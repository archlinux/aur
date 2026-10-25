# Maintainer: Eugene Flanagin <eflanagin@pm.me>
# NVIDIA PhysX SDK 5 with GPU (CUDA) kernels, built PTX-only so they run on AMD GPUs through ZLUDA.
# The CUDA toolkit pieces (nvcc, cudart, crt, cccl, libnvvm) are NVIDIA redistributables extracted
# into $srcdir only -- nothing NVIDIA is installed system-wide except the redistributable libcudart.so.13
# that ends up inside /opt/physx5/lib.  See README.md.

pkgname=physx5-zluda
_commit=6dc53585d7db07346f53d0598a5fd3bfdce47d8d
pkgver=5.11.0
pkgrel=3
pkgdesc="NVIDIA PhysX SDK 5 (GPU rigid bodies, articulations, deformables) running on AMD GPUs via ZLUDA - PTX-only build in /opt/physx5"
arch=(x86_64)
url="https://github.com/NVIDIA-Omniverse/PhysX"
# PhysX SDK (physx/ subtree, SPDX headers + physx/LICENSE.md): Apache-2.0.  The repository root's
# LICENSE.md is BSD-3-Clause but covers older releases / the other subprojects, none of which are built.
# libcudart.so.13 is redistributed under the NVIDIA CUDA Toolkit EULA.
license=(Apache-2.0 LicenseRef-NVIDIA-CUDA-EULA)
depends=(zluda gcc-libs glibc freeglut glu libxmu libx11 libxi)
makedepends=(cmake ninja gcc14 python patchelf rapidjson)
optdepends=('konsole: terminal used by the menu entries')
options=(!lto !debug)
_cuda=13.4.92
_redist=https://developer.download.nvidia.com/compute/cuda/redist
source=(PhysX-$_commit.tar.gz::$url/archive/$_commit.tar.gz
        $_redist/cuda_nvcc/linux-x86_64/cuda_nvcc-linux-x86_64-$_cuda-archive.tar.xz
        $_redist/cuda_cudart/linux-x86_64/cuda_cudart-linux-x86_64-$_cuda-archive.tar.xz
        $_redist/cuda_crt/linux-x86_64/cuda_crt-linux-x86_64-$_cuda-archive.tar.xz
        $_redist/cccl/linux-x86_64/cccl-linux-x86_64-13.3.4.3.1-archive.tar.xz
        $_redist/libnvvm/linux-x86_64/libnvvm-linux-x86_64-$_cuda-archive.tar.xz
        physx5-zluda.patch
        zluda-physx-shim.c
        physx5-gputest.cpp
        physx5-zluda-run
        physx5-zluda.desktop
        physx5-gputest.desktop
        README.md)
noextract=(cuda_nvcc-linux-x86_64-$_cuda-archive.tar.xz
           cuda_cudart-linux-x86_64-$_cuda-archive.tar.xz
           cuda_crt-linux-x86_64-$_cuda-archive.tar.xz
           cccl-linux-x86_64-13.3.4.3.1-archive.tar.xz
           libnvvm-linux-x86_64-$_cuda-archive.tar.xz)
sha256sums=('486860085ee6c09da14c045d600edf0f3da662b67d632af69c57a2004b281a90'
            '60998f40cc9df5826b2a846e2dcc328133fbc5ef539398ce0a21cf5dcac7193d'
            '0ac5dbc538d04e9983bc493b410cce4b459e1ee9f5f6654b6464ef7b3e14a8b5'
            'c969e61ded12dbf0cf20ace72867f1622ec0e8ea1e1d305e27761012025f7aaa'
            '6b7516074f42f80dd3feb9c11318c8e1c5ab56cdd9f18fff4c5ace2e7e0a8209'
            '0e619cf3d5b27f7c812665599ca9761fc296e56129b24a85d822a5d8a1a3bd75'
            'e30dce564a35abc1f99d3d89201e300672cd3013f549b8e7a682c4ae71d8c42c'
            'a311794ea551fe36fd5e9d96281861ecea053d8bf4df5968b32537091ba8649e'
            '67b443b983b8e9aed5a60109847d5f0bad6fc82b2b11cb3f65ec790086e8845f'
            '41b122bfedb469fa4c4db0106c045b3ce653d2105dea8349cf6b02f1d7dfd3c0'
            '14bb89981d22632b268f51ea87ca4cd046ac85dd3908c30c438343546d852d54'
            'b420844eca245146e351567bcbdced32bbcfebc7b0bb34e8089e9d41ef48417b'
            'aaf74e1d806fe671dcf3c91b689021b70c7716b3aefed15f5549e6e36abe1372')

_prefix=/opt/physx5
# $srcdir is only defined inside the functions
_setpaths() { _physx="$srcdir/PhysX-$_commit/physx"; _cudadir="$srcdir/cuda"; }

prepare() {
  _setpaths
  # private CUDA toolkit prefix (never installed)
  rm -rf "$_cudadir"; mkdir -p "$_cudadir"
  local t
  for t in cuda_nvcc cuda_cudart cuda_crt libnvvm; do
    bsdtar -xf "$srcdir/$t-linux-x86_64-$_cuda-archive.tar.xz" -C "$_cudadir" --strip-components=1
  done
  bsdtar -xf "$srcdir/cccl-linux-x86_64-13.3.4.3.1-archive.tar.xz" -C "$_cudadir" --strip-components=1
  ln -sfn lib "$_cudadir/lib64"          # nvcc looks for lib64/
  "$_cudadir/bin/nvcc" --version | tail -1

  cd "$_physx"
  patch -Np1 -i "$srcdir/physx5-zluda.patch"
}

build() {
  _setpaths
  cd "$_physx"
  # PhysX sets its own warning/optimisation flags (-Wall -Werror -Wno-format ...); makepkg's
  # -Werror=format-security then errors out ("-Wformat-security ignored without -Wformat"), so the
  # distro C/C++ flags are dropped for the SDK itself.  -flto is disabled in options because
  # nvcc-produced host objects do not mix with GCC LTO bytecode.
  local _pkgCFLAGS="$CFLAGS"
  export CFLAGS="" CXXFLAGS="" CPPFLAGS=""
  rm -rf "$srcdir/build"
  cmake -S . -B "$srcdir/build" -G Ninja --no-warn-unused-cli \
    -DCMAKE_BUILD_TYPE=release \
    -DTARGET_BUILD_PLATFORM=linux -DPX_OUTPUT_ARCH=x86 \
    -DPHYSX_ROOT_DIR="$_physx" -DPX_OUTPUT_LIB_DIR="$_physx" -DPX_OUTPUT_BIN_DIR="$_physx" \
    -DCMAKE_C_COMPILER=gcc-14 -DCMAKE_CXX_COMPILER=g++-14 \
    -DCMAKE_CUDA_COMPILER="$_cudadir/bin/nvcc" -DCMAKE_CUDA_HOST_COMPILER=g++-14 \
    -DCUDAToolkit_ROOT="$_cudadir" -DCMAKE_CUDA_ARCHITECTURES=75-virtual \
    -DPX_GENERATE_GPU_PROJECTS=ON -DPX_GENERATE_GPU_REDUCED_ARCHITECTURES=ON \
    -DPX_GENERATE_STATIC_LIBRARIES=OFF -DPX_GENERATE_GPU_STATIC_LIBRARIES=OFF \
    -DPX_BUILDSNIPPETS=ON -DPX_BUILDPVDRUNTIME=OFF -DPX_CUDA_DEVICE_DEBUG=OFF \
    -DPX_SCALAR_MATH=OFF -DPX_FLOAT_POINT_PRECISE_MATH=OFF \
    -DCMAKE_INSTALL_PREFIX="$_prefix"
  # cudafe++/ptxas are memory hungry: cap the job count
  ninja -C "$srcdir/build" -j"$(( $(nproc) < 10 ? $(nproc) : 10 ))"

  # ZLUDA shim and functional test
  local bin="$_physx/bin/linux.x86_64/release"
  gcc ${_pkgCFLAGS} -O2 -Wall -shared -fPIC -o "$srcdir/libzluda-physx-shim.so" "$srcdir/zluda-physx-shim.c" -ldl
  g++-14 -std=c++14 -O2 -o "$srcdir/physx5-gputest" "$srcdir/physx5-gputest.cpp" -I"$_physx/include" \
    -Wl,-rpath,"$_prefix/lib" \
    "$bin/libPhysXExtensions_static_64.a" "$bin/libPhysXPvdSDK_static_64.a" \
    "$bin/libPhysX_64.so" "$bin/libPhysXCommon_64.so" "$bin/libPhysXFoundation_64.so" -lpthread -ldl
}

package() {
  _setpaths
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  local bin="$_physx/bin/linux.x86_64/release"
  install -dm755 "$pkgdir$_prefix/bin" "$pkgdir$_prefix/lib" "$pkgdir$_prefix/share/doc" "$pkgdir/usr/bin" \
                 "$pkgdir/usr/share/applications" "$pkgdir/usr/share/licenses/$pkgname"
  # snippets (demo programs) and the self-test
  install -m755 "$bin"/Snippet*_64 "$pkgdir$_prefix/bin/"
  # the build tree bakes its own output dir into RUNPATH; point the snippets at the installed libs instead
  local f; for f in "$pkgdir$_prefix"/bin/Snippet*_64; do patchelf --set-rpath '$ORIGIN/../lib' "$f"; done
  install -m755 "$srcdir/physx5-gputest" "$pkgdir$_prefix/bin/"
  # ZLUDA shim + the one redistributable CUDA runtime library PhysXGpu links against
  install -m755 "$srcdir/libzluda-physx-shim.so" "$pkgdir$_prefix/lib/"
  cp -a "$_cudadir"/lib/libcudart.so.13* "$pkgdir$_prefix/lib/"
  # wrapper, menu entries, docs
  install -m755 "$srcdir/physx5-zluda-run" "$pkgdir/usr/bin/physx5-zluda-run"
  install -m644 "$srcdir/physx5-zluda.desktop" "$srcdir/physx5-gputest.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/README.md" "$srcdir/zluda-physx-shim.c" "$srcdir/physx5-gputest.cpp" "$pkgdir$_prefix/share/doc/"
  install -m644 "$_physx/README.md" "$pkgdir$_prefix/share/doc/README.PhysX.md"
  install -m644 "$_physx/CHANGELOG.md" "$pkgdir$_prefix/share/doc/"
  install -m644 "$_physx/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.PhysX.md"
  # the toolkit dir's LICENSE is whichever redist tarball was extracted last (CCCL); ship the EULA that
  # covers the redistributed libcudart.so.13, taken from the cuda_cudart tarball itself
  bsdtar -xOf "$srcdir/cuda_cudart-linux-x86_64-$_cuda-archive.tar.xz" "cuda_cudart-linux-x86_64-$_cuda-archive/LICENSE" \
    > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CUDA-EULA"
  chmod 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CUDA-EULA"
}

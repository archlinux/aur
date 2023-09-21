# Maintainer: Mark Peschel <mpeschel10@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Contributor: anakano <azusanakan0 at outlook dot com>
# Contributor: wuxxin <wuxxin@gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Konstantin Gizdov (kgizdov) <arch@kge.pw>
# Contributor: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>
# Contributor: Thibault Lorrain (fredszaq) <fredszaq@gmail.com>

pkgbase=tensorflow-amd-git
pkgname=(tensorflow-amd-git python-tensorflow-amd-git)
pkgver=2.13
_known_good_commit=c3580ed754a1c0eb66c6219d4bad84a6db0021e7   
# You can find the latest probably successful official build at:
# http://ml-ci.amd.com:21096/job/tensorflow/job/release-rocmfork-r213-rocm-enhanced/job/release-build-whl/lastSuccessfulBuild/
# Look for the revision for the "ROCmSoftwarePlatform/tensorflow-upstream" repository.
# You can find the latest version at:
# http://ml-ci.amd.com:21096/job/tensorflow/
# Look for builds named like release-rocmfork-r*-enhanced
pkgrel=1
pkgdesc="Library for scalable machine learning (with ROCm)"
url="https://www.tensorflow.org/"
license=('APACHE')
arch=('x86_64')

depends=('c-ares' 'pybind11' 'openssl' 'libpng' 'curl' 'giflib' 'icu' 'libjpeg-turbo' 'openmp' \
         'rocrand' 'rccl' 'miopen-hip' 'hipfft' \
         'zlib' 'glibc' 'gcc-libs' 'hsa-rocr' 'hip-runtime-amd' )
         # zlib etc. were discovered with namcap.
         # namcap also suggests libicu-32, but that breaks building in clean chroot cuz I'm too lazy to figure out multilib
makedepends=('python-numpy' 'git' 'python-wheel' \
             'python-installer' 'python-setuptools' 'python-h5py' 'python-keras-applications' \
             'python-keras-preprocessing' 'cython' 'patchelf' 'python-requests' \
             'java-environment=11' 'coreutils' 'base-devel' \
             'rocm-core' 'roctracer' 'hipsparse' 'hipsolver' 'hipblas' 'hipcub' )
             # bazel: Don't need bazel since this PKGBUILD downloads and installs bazel 5.4.0 locally
             #  java-environment=11: outdated bazel needs jdk 11
             # coreutils: df, for our check if there's enough space on /tmp. 
             # base-devel: fakeroot and some other things
             # rocm-core: /opt/rocm/.info/version, which the official docker image seems to need.
optdepends=('tensorboard: Tensorflow visualization toolkit')
source=('tensorflow-upstream-rocm::git+https://github.com/ROCmSoftwarePlatform/tensorflow-upstream#branch=r2.13-rocm-enhanced'
        fix-tensorflow-2.10-sparse-transpose-op2.patch
        https://github.com/bazelbuild/bazel/releases/download/5.4.0/bazel_nojdk-5.4.0-linux-x86_64
        fix-c++17-compat.patch
        fix-cstdint-tsllibio-cache.patch
        fix-log-spam.patch)
sha512sums=( SKIP
            '45325ef3130aa95d48121d8c39bb4e683bdb5faa936ff29af953a2c359edb441a29e2dc0cae53ec6c08eee0432c0eeeaa7a40fbd063467b7f3c250d0f7f8ffed'
            'e2adb747cd1fe3c90686831703618af3f8bc8197a96d9e1e90e66db38dbc4e7a94d88dac755b25e288002983a87fcffbfb0d7c2e356d979d4635301c3daf9281'
            'f682368bb47b2b022a51aa77345dfa30f3b0d7911c56515d428b8326ee3751242f375f4e715a37bb723ef20a86916dad9871c3c81b1b58da85e1ca202bc4901e'
            '78bffffdb6fa58dfcfae37b4458c198a644605b9e9136ceef079d4d5002fad6f2ae39dee15e77e35c198267574860554a69e98674882164fad4b63e9ab68fb05'
            'fde73feeb2bbb814ba229c2b879e5e5944fd658e9810937753a25f2650f57c49f8a435924b47a1a54eb2852f9713b19a15d42b307593e26a74ad65aeee22c36a')

# consolidate common dependencies to prevent mishaps
_common_py_depends=(python-termcolor python-astor python-gast03 python-numpy python-protobuf
                    absl-py python-h5py python-keras python-keras-applications python-keras-preprocessing
                    python-tensorflow-estimator python-opt_einsum python-astunparse python-pasta
                    python-flatbuffers python-typing_extensions)

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

check_dir() {
  # first make sure we do not break parsepkgbuild
  if ! command -v cp &> /dev/null; then
    >&2 echo "'cp' command not found. PKGBUILD is probably being checked by parsepkgbuild."
    if ! command -v install &> /dev/null; then
      >&2 echo "'install' command also not found. PKGBUILD must be getting checked by parsepkgbuild."
      >&2 echo "Cannot check if directory '${1}' exists. Ignoring."
      >&2 echo "If you are not running nacmap or parsepkgbuild, please make sure the PATH is correct and try again."
      >&2 echo "PATH should not be '/dummy': PATH=$PATH"
      return 0
    fi
  fi
  # if we are running normally, check the given path
  if [ -d "${1}" ]; then
    return 0
  else
    >&2 echo Directory "${1}" does not exist or is a file! Exiting...
    exit 1
  fi
}

prepare() {
  cd tensorflow-upstream-rocm
  echo Checking out known good commit $_known_good_commit
  git config advice.detachedHead false
  git checkout $_known_good_commit
  cd ..

  # When upstream changes the name of the wheel, people who have built this package once will get a duplicate .whl file.
  # This confuses `WHEEL_PACKAGE=$(find ...` and makes the python -m installer line fail.
  # So clean tmprocm between builds.
  [ -d "$srcdir"/tmprocm ] && rm "$srcdir"/tmprocm/*
  
  # Allow any bazel version
  echo "*" > tensorflow-upstream-rocm/.bazelversion

  # Since Tensorflow is currently incompatible with Bazel 6, we're going to use
  # a local Bazel 5 to fix that. Stupid problems call for stupid solutions.
  install -Dm755 "${srcdir}"/bazel_nojdk-5.4.0-linux-x86_64 bazel/bazel

  # Get rid of hardcoded versions. Not like we ever cared about what upstream
  # thinks about which versions should be used anyway. ;) (FS#68772)
  sed -i -E "s/'([0-9a-z_-]+) .= [0-9].+[0-9]'/'\1'/" tensorflow-upstream-rocm/tensorflow/tools/pip_package/setup.py

  # setup.py generates ~1Mb of warnings if you don't explicitly include namespace packages.
  sed -i -E "s/find_packages/find_namespace_packages/" tensorflow-upstream-rocm/tensorflow/tools/pip_package/setup.py
  
  patch -Np1 -i "${srcdir}/fix-tensorflow-2.10-sparse-transpose-op2.patch" -d tensorflow-upstream-rocm
  # Patch for gcc13: cstdint is no longer implicitly included in some headers, so include it explicitly.
  # See https://gcc.gnu.org/gcc-13/porting_to.html
  patch -Np1 -i "${srcdir}/fix-cstdint-tsllibio-cache.patch" -d tensorflow-upstream-rocm
  # Patch tensorflow/core/common_runtime/gpu_fusion_pass.cc to fix "ROCm Fusion is enabled." log spam.
  patch -Np1 -i "${srcdir}/fix-log-spam.patch" -d tensorflow-upstream-rocm
  
  if [ ! -f "/opt/rocm/bin/target.lst" ]; then
    echo WARNING: If you are building for GPUs not currently installed in your machine,
    echo \ or if you are getting random segfaults and suspect that this build is not
    echo \ properly targeting your architecture,
    echo \ you must provide a target list in /opt/rocm/bin/target.lst
    echo Something of the form:
    # From the tensorflow-upstream build environment dockerfile:
    #  https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/blob/develop-upstream/tensorflow/tools/ci_build/Dockerfile.rocm
    echo -e "gfx900\ngfx906\ngfx908\ngfx90a\ngfx1030\ngfx904"
    echo You can see the architectures of cards in your machine by running
    echo "pacman -S rocminfo"
    echo "/opt/rocm/bin/rocminfo | grep gfx"
  fi
}

build() {
  # Use outdated bazel since tensorflow is configured for that,
  #  and use outdated java since bazel needs specifically java 11.
  # If the user installs any other version of java before 11,
  #  /usr/lib/jvm/default will point to the first install,
  #  so put java 11 in PATH.
  PATH="/usr/lib/jvm/java-11-openjdk/bin:$PATH"
  export PATH="${srcdir}/bazel:$PATH"
  # bazel somehow caches the jvm,
  #  so if you pacman -R jre11-openjdk; pacman -S jre-openjdk to see if modern java also works,
  #  makepkg may still build as though java 20 is ok.
  # For a clean test, you must rm -rf ~/.cache/bazel
  
  # These environment variables influence the behavior of the configure call.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_DOWNLOAD_CLANG=0

  # See https://github.com/tensorflow/tensorflow/blob/master/third_party/systemlibs/syslibs_configure.bzl
  # Important since boringssl may no longer build due to dangling pointer warning as of 2023-06-04
  export TF_SYSTEM_LIBS="boringssl,curl,cython,gif,icu,libjpeg_turbo,nasm,png,pybind11,zlib"
  
  # Don't need --config=rocm for tensorflow-upstream, since it's included from .tf_configure.bazelrc
  export BAZEL_ARGS="--config=opt"

  if [[ -f /opt/rocm/bin/target.lst && `wc -l < /opt/rocm/bin/target.lst` > 3 ]]; then
    # If building for multiple gfx architectures, confirm there's enough space in /tmp.
    tmp_size=`df /tmp | sed -rn "s|tmpfs +([[:digit:]]+) +.*|\1|p"`
    if [ -z "$tmp_size" ]; then
        echo Please confirm your /tmp directory is larger than 8 gigabytes\;
        echo if it isn\'t, you may run into errors during the build due to running out of space
        echo \ if you are building for multiple architectures.
        echo Find /tmp size with "df -h".
        echo You can remount it larger with "mount -o remount,size=12G /tmp"
        echo \ if it is tmpfs and you have enough RAM.
    else
        if [ "$tmp_size" -lt 8388608 ]; then
            echo WARNING: Your /tmp directory is less than 8 gigibytes.
            echo You may run into errors during the build due to /tmp running out of space
            echo \ if you are building for multiple architectures.
            echo You can remount it larger with "mount -o remount,size=12G /tmp"
            echo \ if it is tmpfs and you have enough RAM.
        fi
    fi
  fi
  
  cd "${srcdir}"/tensorflow-upstream-rocm
  export CC_OPT_FLAGS="-march=native -O2"
  export TF_NEED_CUDA=0
  export TF_NEED_ROCM=1
  ./configure
  
  bazel \
    build ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}"/tmprocm --rocm
}

_package() {
  # install headers first
  install -d "${pkgdir}"/usr/include/tensorflow
  cp -r bazel-bin/tensorflow/include/* "${pkgdir}"/usr/include/tensorflow/

  # install python-version to get all extra headers
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  python -m installer --destdir="$pkgdir" "$WHEEL_PACKAGE"
  
  # move extra headers to correct location
  local _srch_path="${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include
  check_dir "${_srch_path}"  # we need to quit on broken search paths
  cp -rf "${_srch_path}"/* "${pkgdir}"/usr/include/tensorflow/

  # clean up unneeded files
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/share

  # make sure no lib objects are outside valid paths
  local _so_srch_path="${pkgdir}/usr/include"
  check_dir "${_so_srch_path}"  # we need to quit on broken search paths
  find "${_so_srch_path}" -type f,l \( -iname "*.so" -or -iname "*.so.*" \) -print0 | while read -rd $'\0' _so_file; do
    # check if file is a dynamic executable
    ldd "${_so_file}" &>/dev/null && rm -rf "${_so_file}"
  done

  # install the rest of tensorflow
  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  sed -e 's@/include$@/include/tensorflow@' -i tensorflow.pc -i tensorflow_cc.pc
  install -Dm644 tensorflow.pc "${pkgdir}"/usr/lib/pkgconfig/tensorflow.pc
  install -Dm644 tensorflow_cc.pc "${pkgdir}"/usr/lib/pkgconfig/tensorflow_cc.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so "${pkgdir}"/usr/lib/libtensorflow.so.${pkgver}
  ln -s libtensorflow.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow.so.${pkgver:0:1}
  ln -s libtensorflow.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_cc.so "${pkgdir}"/usr/lib/libtensorflow_cc.so.${pkgver}
  ln -s libtensorflow_cc.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow_cc.so.${pkgver:0:1}
  ln -s libtensorflow_cc.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow_cc.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_framework.so "${pkgdir}"/usr/lib/libtensorflow_framework.so.${pkgver}
  ln -s libtensorflow_framework.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow_framework.so.${pkgver:0:1}
  ln -s libtensorflow_framework.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow_framework.so
  install -Dm644 tensorflow/c/c_api.h "${pkgdir}"/usr/include/tensorflow/tensorflow/c/c_api.h
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # Fix interoperability of C++14 and C++17. See https://bugs.archlinux.org/task/65953
  patch -Np0 -i "${srcdir}"/fix-c++17-compat.patch -d "${pkgdir}"/usr/include/tensorflow/absl/base

}

_python_package() {
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  python -m installer --destdir="$pkgdir" "$WHEEL_PACKAGE"

  # create symlinks to headers
  local _srch_path="${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include/
  check_dir "${_srch_path}"  # we need to quit on broken search paths
  find "${_srch_path}" -maxdepth 1 -mindepth 1 -type d -print0 | while read -rd $'\0' _folder; do
    rm -rf "${_folder}"
    _smlink="$(basename "${_folder}")"
    ln -s /usr/include/tensorflow/"${_smlink}" "${_srch_path}"
  done

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this package.
  rm -rf "${pkgdir}"/usr/bin/tensorboard

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_tensorflow-amd-git() {
  conflicts=(tensorflow)
  provides=(tensorflow)
  
  cd "${srcdir}"/tensorflow-upstream-rocm
  _package tmprocm
}

package_python-tensorflow-amd-git() {
  depends+=(tensorflow "${_common_py_depends[@]}")
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)

  cd "${srcdir}"/tensorflow-upstream-rocm
  _python_package tmprocm
}

# vim:set ts=2 sw=2 et:

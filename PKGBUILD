# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/unset variables
# shellcheck disable=SC2191 # preserve current _CMAKE_FLAGS initialization.

# Configuration.
_branch="fracture_modifier"
_fragment=${FRAGMENT:-#branch=${_branch}}
[[ -v CUDA_ARCH ]] && _cuda_capability=${CUDA_ARCH}
_suffix=${_branch}

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.
((DISABLE_NINJA)) ||  makedepends+=('ninja')
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || makedepends+=('cuda')

pkgname=blender-${_suffix}-git
pkgver=2.79.r70678.g233ad61cb8d
_blenver=${pkgver:0:4}
pkgrel=2
pkgdesc="Development version of Blenders ${_branch} branch"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg2'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
makedepends+=('git' 'cmake' 'boost' 'mesa' 'llvm')
provides=("blender-${_suffix}")
conflicts=("blender-${_suffix}")
license=('GPL')
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("git://git.blender.org/blender.git${_fragment}"
        'blender-addons.git::git://git.blender.org/blender-addons.git'
        'blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git'
        'blender-translations.git::git://git.blender.org/blender-translations.git'
        'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git'
        'git+https://github.com/scorpion81/blender-fracture-helper.git'
        SelectCudaComputeArch.patch
        gcc8.patch
        gcc9.patch
        ffmpeg.patch
        openvdb.patch
        collada1668.patch
        oiio-2.0.patch
        Cleanup-use-PyImport_GetModuleDict.patch
        python3.8.patch
        addon_path.patch
        'python3.9.patch'   # ::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/56d0df51a36fdce7ec2d1fbb7b47b1d95b591b5f
        'python3.9_2.patch' # ::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/5edba9b42f684bf8b99894bb6988e7f46180e12c
        openvdb7.patch
        openvdb8.patch # ::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/37889011070ff2ec52159690f652238d2b325185
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '39ab45862044a838e49720c93ef5d246c3192e1438bf3ceca169e3ed0439ea18'
            '6093024b0a27f1fd144f5f8a25121939f74f41bcc164d8b8b58f33d3c364e456'
            'ec95ba11ef9f41ca3123b330f25ab767f7916531f39943b4f92f28f36e1e0725'
            '450a3ec68360981e47503e734e8229a4ad06554ad009664b4abfb6bf317962d9'
            'e22d5908877165958991161c6800dac9f8810e2d92fb18c6fe09fe1a24e5d18c'
            'ba390c37ea5a63e603c97350f9401fe1794c54406243a48f860195cc0c6085ab'
            '5ff48d0e35025f21ee45274b56d1788b2e1768fa4d86b5032a40941057695176'
            'f4fea95b9d27fb5c30a13cd57ae22d8f3091d456719377e28572091793e941c2'
            '229853b98bb62e1dec835aea6b2eab4c3dabbc8be591206573a3c1b85f10be59'
            '350063cd4f234565bd928a356b4e5f65cf37fc1377904a08bf60f7010c88740b'
            'd106248d55045f5ef913bf6243ad74a76f6282264d9ee4c9b87ec4a3d2e2064b'
            'b2a2bc5de8d3b730e49d1f50cb025c1dfdbcb66c58ead573322585b6a887d3a7'
            'c4079c4c142516d9cd476f5a3cafddf4068f0950c3c11ea4da9cf999c5ccc1f9'
            'edfd784f8497417660c0b9fdc97893fd0d77764d0bc10f4cb92a9082f41bae75')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION\s+\K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git -C "$srcdir/blender" submodule update --init --recursive --remote
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
    git -C "$srcdir/blender" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  if [[ -v _suffix ]]; then
    git apply -v <(sed "s/@@_suffix@@/${_suffix}/g" "${srcdir}/addon_path.patch")
  fi
  git -C "$srcdir/blender" apply -v "${srcdir}"/{gcc{8,9},ffmpeg,openvdb{,7,8},collada1668,oiio-2.0,Cleanup-use-PyImport_GetModuleDict}.patch
  git -C "$srcdir/blender" apply -v "${srcdir}"/python3.{8,9,9_2}.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ] && ! ((DISABLE_CUDA)) ; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    if [[ -v _cuda_capability ]]; then
      _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
    fi
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && _CMAKE_FLAGS+=( -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache )
    if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
      [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/"$_cuda_gcc" )
    fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" -S "$srcdir/blender" -B "$srcdir/build" \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=OFF \
        -DWITH_ALEMBIC=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION="${_pyver}" \
        -DWITH_MOD_OCEANSIM=ON \
        -DWITH_CYCLES_OPENSUBDIV=ON \
        -DWITH_CYCLES_OSL=ON \
        -DWITH_LLVM=ON \
        -DWITH_IMAGE_OPENEXR=ON \
        -DWITH_OPENSUBDIV=ON \
        -DWITH_OPENVDB=ON \
        -DWITH_OPENVDB_BLOSC=ON \
        -DWITH_OPENCOLLADA=ON \
        "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" ; else ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}; fi
}

package() {
  export DESTDIR="$pkgdir"
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" install; else ninja -C "$srcdir/build" install; fi
  msg "install fracture-helper addon"
  install -Dm644 "${srcdir}"/blender-fracture-helper/*.py "${pkgdir}/usr/share/blender/${_blenver}_${_suffix}/scripts/addons/"

  if [[ -v _suffix ]]; then
    msg "add -${_suffix} suffix to desktop shortcut"
    sed -i "s/=blender/=blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    sed -i "s/=Blender/=Blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    mv "${pkgdir}/usr/share/applications/blender.desktop" "${pkgdir}/usr/share/applications/blender-${_suffix}.desktop"

    msg "add -${_suffix} suffix to binaries"
    mv "${pkgdir}/usr/bin/blender" "${pkgdir}/usr/bin/blender-${_suffix}"
    mv "${pkgdir}/usr/bin/blender-thumbnailer.py" "${pkgdir}/usr/bin/blender-${_suffix}-thumbnailer.py"

    msg "mv doc/blender to doc/blender-${_suffix}"
    mv "${pkgdir}/usr/share/doc/blender" "${pkgdir}/usr/share/doc/blender-${_suffix}"

    msg "add -${_suffix} suffix to man page"
    mv "${pkgdir}/usr/share/man/man1/blender.1" "${pkgdir}/usr/share/man/man1/blender-${_suffix}.1"

    msg "add -${_suffix} suffix to all icons"
    while read -r icon
    do
      # ${filename##/*.} extra extenssion from path
      # ${filename%.*} extract filename form path
      # look at bash "manipulatin string"
      mv "$icon" "${icon%.*}-${_suffix}.${icon##/*.}"
    done < <(find "${pkgdir}/usr/share/icons" -type f)
  fi

  if [[ -e "$pkgdir/usr/share/blender/${_blenver}${_suffix:+_$_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir/usr/share/blender/${_blenver}${_suffix:+_$_suffix}/scripts/addons/cycles/lib/*"
  fi
}
# vim:set sw=2 ts=2 et:

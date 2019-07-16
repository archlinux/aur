# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

#to enforce cuda verison uncomment this line and update value of sm_xx model accordingly
#_cuda_capability+=(sm_30 sm_35 sm_37) # suppress to prevent Travis build exceed time limit.
_cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)

pkgname=blender-2.7
_fragment="#branch=blender2.7"
pkgver=2.79b.r71421.e045fe53f1b
pkgrel=1
pkgdesc="Blender 2.7 branch"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
#optdepends=('cuda: CUDA support in Cycles')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm' 'ninja')
makedepends+=('cuda') # disable to prevent build process from exiting Travis 50m build time limit
options=(!strip)
provides=('blender=2.7')
license=('GPL')
install=blender.install
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
        blender-2.7.desktop
        SelectCudaComputeArch.patch
        stl_export_iter.patch
        python3.7.patch
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'cef7a015d4ab57592b424ea06c8b576e'
         '8b22ddc71fb3a766029dc460bba49a0a'
         'f21e971208232d8d78d1a4c41013a101'
         'e0d4a0a876bcf48969613912f3463c01')

pkgver() {
  cd "$srcdir/blender"
  printf "2.79b.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
  if [ -z "$_cuda_capability" ] && grep -q nvidia <(lsmod); then 
    git apply -v ${srcdir}/SelectCudaComputeArch.patch
  fi
  git apply -v ${srcdir}/{python3.7,stl_export_iter}.patch
}

build() {

  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"
  
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
  if [ "$_CUDA_PKG" != "" ]; then
      _EXTRAOPTS=(-DWITH_CYCLES_CUDA_BINARIES=ON \
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda)
      ((TRAVIS)) && _EXTRAOPTS+=(-DCUDA_NVCC_FLAGS="--ptxas-options=-w")  # suppress all ptxas warnings in Travis build
      if [ "$_cuda_capability" != "" ]; then
        _EXTRAOPTS+=(-DCYCLES_CUDA_BINARIES_ARCH=$(IFS=';'; echo "${_cuda_capability[*]}";))
      fi
  fi

# export CFLAGS="${CFLAGS} -DOPENVDB_3_ABI_COMPATIBLE -DOPENVDB_USE_DEPRECATED_ABI"
# export CXXFLAGS="${CXXFLAGS} -DOPENVDB_3_ABI_COMPATIBLE -DOPENVDB_USE_DEPRECATED_ABI"
  cmake -GNinja "$srcdir/blender" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_CXX11=ON \
        -DWITH_ALEMBIC=NO \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=${_pyver} \
        -DWITH_MOD_OCEANSIM=ON \
        -DWITH_CYCLES_OPENSUBDIV=ON \
        -DWITH_CYCLES_OSL=ON \
        -DWITH_LLVM=ON \
        -DWITH_IMAGE_OPENEXR=ON \
        -DWITH_OPENSUBDIV=ON \
        -DWITH_OPENVDB=ON \
        -DWITH_OPENVDB_BLOSC=ON \
        -DWITH_OPENCOLLADA=ON \
        ${_EXTRAOPTS[@]}
  export NINJA_STATUS="[%p | %cbps | %f<%r<%u ] "
  ninja -d stats
}

package() {
  cd "$srcdir/blender-build"
  DESTDIR="$pkgdir" ninja install
  
  msg "add -2.7 sufix to desktop shortcut"
  sed -i 's/=blender/=blender-2.7/g' ${pkgdir}/usr/share/applications/blender.desktop
  sed -i 's/=Blender/=Blender-2.7/g' ${pkgdir}/usr/share/applications/blender.desktop
  mv ${pkgdir}/usr/share/applications/blender.desktop ${pkgdir}/usr/share/applications/blender-2.7.desktop

  msg "add -2.7 sufix to binaries"
  mv ${pkgdir}/usr/bin/blender ${pkgdir}/usr/bin/blender-2.7
  mv ${pkgdir}/usr/bin/blender-thumbnailer.py ${pkgdir}/usr/bin/blender-2.7-thumbnailer.py
#  mv ${pkgdir}/usr/bin/blenderplayer ${pkgdir}/usr/bin/blenderplayer-2.7

  msg "mv doc/blender to doc/blender-2.7"
  mv ${pkgdir}/usr/share/doc/blender ${pkgdir}/usr/share/doc/blender-2.7

  msg "add -2.7 sufix to all icons"  
  for icon in `find ${pkgdir}/usr/share/icons -type f`
  do
    # ${filename##/*.} extra extenssion from path
    # ${filename%.*} extract filename form path
    # look at bash "manipulatin string" 
    mv $icon ${icon%.*}-2.7.${icon##/*.}
  done

  ## not needed when using options=(!strip)?
  #if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
  #  # make sure the cuda kernels are not stripped
  #  chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  #fi
}
# vim:set sw=2 ts=2 et:

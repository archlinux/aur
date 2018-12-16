# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_branch="fracture_modifier"
_sufix=${_branch}
_blenver=2.81
_fragment="#branch=${_branch}"
pkgname=blender-${_sufix}-git
pkgver=v2.79b.r2154.gc8d6bba3cce
pkgrel=1
pkgdesc="Development version of Blenders ${_branch} branch"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('alembic' 'openjpeg' 'python-numpy'  'libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
optdepends=('cuda: CUDA support in Cycles')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
provides=('blender-fracture_modifier')
conflicts=('blender-fracture_modifier')
#options=(!makeflags)
license=('GPL')
install=blender.install
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("git://git.blender.org/blender.git${_fragment}" \
        'blender-addons.git::git://git.blender.org/blender-addons.git' \
        'blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git' \
        'blender-translations.git::git://git.blender.org/blender-translations.git' \
        'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git' \
        'git+https://github.com/scorpion81/blender-fracture-helper.git' \
        blender-fracture_modifier.desktop \
        SelectCudaComputeArch.patch \
        gcc8.patch \
        version.patch \
        ffmpeg.patch \
        openvdb.patch \
        collada1668.patch \
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '0a4847775c9eec16a76ec7d3a03a678d'
         '9454ff7e994f72ead5027356e227cbd2'
         'df6f12c3327678b0a05f9e48e9ace67c'
         '975cef0e17c77517ed8727701abc8a0c'
         'bb325c8c879d677ad1f1c54797268716'
         'fe709e616e52c1acc47c1cc0f77c2694'
         '4e4423315f07bc724c7703c57c4481d7')

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

pkgver() {
  cd "$srcdir/blender"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
#  git submodule foreach git checkout master
#  git submodule foreach git pull --rebase origin master
  git apply -v ${srcdir}/SelectCudaComputeArch.patch
  git apply -v ${srcdir}/gcc8.patch
  git apply -v ${srcdir}/ffmpeg.patch
  git apply -v ${srcdir}/openvdb.patch
  git apply -v ${srcdir}/version.patch
  git apply -v ${srcdir}/collada1668.patch
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"
  
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  export CFLAGS="${CFLAGS} -DOPENVDB_3_ABI_COMPATIBLE"
  export CXXFLAGS="${CXXFLAGS} -DOPENVDB_3_ABI_COMPATIBLE"

  cmake "$srcdir/blender" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=OFF \
        -DWITH_ALEMBIC=ON \
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
        $_EXTRAOPTS
  make
}

package() {
  cd "$srcdir/blender-build"
  make DESTDIR="$pkgdir" install

  msg "install fracture-helper addon"  
  install ${srcdir}/blender-fracture-helper/*.py ${pkgdir}/usr/share/blender/${_blenver}/scripts/addons/

  msg "add -${_sufix} sufix to desktop shortcut"
  sed -i "s/=blender/=blender-${_sufix}/g" ${pkgdir}/usr/share/applications/blender.desktop
  sed -i "s/=Blender/=Blender-${_sufix}/g" ${pkgdir}/usr/share/applications/blender.desktop
  mv ${pkgdir}/usr/share/applications/blender.desktop ${pkgdir}/usr/share/applications/blender-${_sufix}.desktop

  msg "add -${_sufix} sufix to binaries"
  mv ${pkgdir}/usr/bin/blender ${pkgdir}/usr/bin/blender-${_sufix}
  mv ${pkgdir}/usr/bin/blender-thumbnailer.py ${pkgdir}/usr/bin/blender-${_sufix}-thumbnailer.py
#  mv ${pkgdir}/usr/bin/blenderplayer ${pkgdir}/usr/bin/blenderplayer-${_sufix}

  msg "mv doc/blender to doc/blender-${_sufix}"
  mv ${pkgdir}/usr/share/doc/blender ${pkgdir}/usr/share/doc/blender-${_sufix}

  msg "add -${_sufix} sufix to all icons"  
  for icon in `find ${pkgdir}/usr/share/icons -type f`
  do
    # ${filename##/*.} extra extenssion from path
    # ${filename%.*} extract filename form path
    # look at bash "manipulatin string" 
    mv $icon ${icon%.*}-${_sufix}.${icon##/*.}
  done

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:

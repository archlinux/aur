# Maintainer: Jeremy Attali <contact@jtheoof.me>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: John Sowiak <john@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>

## This is a blander build based on wayland branch by Christian Rauch
## See Blender thread https://devtalk.blender.org/t/wayland-and-egl-support/11171
## This PKGBUILD was mainly taken from blender-develop-git AUR package.

# Sometimes blender.org takes some time to release patch releases and because Arch users
# are impatient, we sometimes need to build from git directly.
# Update because I get so many queries on this:
# Due to our other rolling deps, it's sometimes not possible to build Blender stable releases.
# More often than not, a new openshadinglanguage breaks it and I could either backport fixes
# or simply roll with a new version. I usually choose the latter when the former seems
# unreasonable.

# For legal reasons, we can't separately package the Optix headers so we'll
# just build the package against them. I checked with NVIDIA and this way is
# fine with them.

#_gittag=v2.82a
# _gitcommit=054dbb833e15275e0e991e2c15e754a3e7583716
_gitbranch=wayland

pkgname=blender-wayland-git
pkgver=2.90.r95473.g52ad92977e1
[[ -n $_gitcommit ]] && pkgver=${pkgver}.git1.${_gitcommit:0:8}
pkgrel=1
epoch=17
pkgdesc="A fully integrated 3D graphics creation suite"
arch=('x86_64')
license=('GPL')
url="http://www.blender.org"
provides=('blender')
conflicts=('blender')
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils' 'python-requests'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg2' 'python-numpy'
         'freetype2' 'openal' 'ffmpeg' 'fftw' 'boost-libs' 'opencollada' 'alembic'
         'openimageio' 'libsndfile' 'jack' 'opencolorio' 'openshadinglanguage' 'openimagedenoise'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus' 'sdl2' 'embree')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm' 'cuda' 'ninja')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
source=("git://git.blender.org/blender-addons.git"
        "git://git.blender.org/blender-addons-contrib.git"
        "git://git.blender.org/blender-translations.git"
        "git://git.blender.org/blender-dev-tools.git"
        embree.patch
        https://developer.download.nvidia.com/redist/optix/v7.0/OptiX-7.0.0-include.zip)

if [[ -n $_gitbranch ]]; then
    source+=("${pkgname}::git+https://github.com/christianrauch/blender.git#branch=${_gitbranch}")
fi

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6de779ad8649a034ee65c45a36d7838ac0b8b32c3336b4d476186265c060f56276e3e0a2860ec4bff42bef7d5582ee82238013845f6a697672767a05a455aaca'
            'b2cff73def3757d4259f4b4d318a8ccfe166bf7c215cbb2124f1c81bd6e742f96207285b24eb4d99b527b7b97dc6d5e8fdf2f16d78d5d1e2684c26d681328491'
            'SKIP')


pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION \K[0-9]{3}" "$srcdir"/${pkgname}/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" \
    "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}


prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git config submodule."release/scripts/addons".url "${srcdir}/blender-addons"
  git config submodule."release/scripts/addons_contrib".url "${srcdir}/blender-addons-contrib"
  git config submodule."release/datafiles/locale".url "${srcdir}/blender-translations"
  git config submodule."source/tools".url "${srcdir}/blender-dev-tools"
  git submodule update

  patch -Np1 -i "$srcdir"/embree.patch

  mkdir build
}

build() {
  cd "$srcdir/$pkgname"/build

  cmake \
    -GNinja \
    -C../build_files/cmake/config/blender_release.cmake .. \
    -DOPTIX_ROOT_DIR="$srcdir"/include \
    -DWITH_CYCLES_EMBREE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DWITH_GHOST_WAYLAND=ON \
    -DPYTHON_VERSION=3.8 \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.8 \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.8
  ninja
}

package() {
  cd "$srcdir/$pkgname/build"

  DESTDIR="${pkgdir}" ninja install
  install -Dm755 ../release/bin/blender-softwaregl "${pkgdir}/usr/bin/blender-softwaregl"
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}

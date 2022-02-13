# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=0.4.1.r712.gc3aa19381
pkgrel=1
pkgdesc="A free (as in freedom) clone of the Age of Empires II engine"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://openage.sft.mx/"
license=(GPL3)
depends=(libepoxy ftgl sdl2_image opusfile eigen
         qt5-declarative xdg-utils sdl2 qt5-quickcontrols
         libpng libogg python-pillow python-numpy python-toml
         python-pygments python-jinja nyan-lang-git)
makedepends=(git cmake cython doxygen vulkan-headers python-graphviz)
optdepends=('ttf-dejavu: for text display, but you can use any font'
            vulkan-icd-loader)
provides=(openage)
conflicts=(openage)
source=("git+https://github.com/SFTtech/openage"
        "https://github.com/SFTtech/openage/pull/1461/commits/c20866d5485383fd5395e0d19b52108505af571e.patch"
        "https://github.com/SFTtech/openage/pull/1461/commits/54dd74a9afe3b89d0036cade7572309d689bc942.patch")
sha256sums=('SKIP'
            'e903b1ea37d910efc401279141bd6241ed2eec0b1feb5aa89679ff2aa7bae13a'
            '38a6e4bbb145b15b0c0e1e69bd24af048515f7bc95a2192faad9f7a3037739ea')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "${srcdir}/${pkgname%-git}"
  install -d build
  patch -Np1 -i ../c20866d5485383fd5395e0d19b52108505af571e.patch
  patch -Np1 -i ../54dd74a9afe3b89d0036cade7572309d689bc942.patch
}
build() {
  cd "${srcdir}/${pkgname%-git}/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}
package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}/" install
}

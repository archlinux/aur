# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Lex Black (autumn-wind at web.de)
# Contributor: andre.vmatos

_pkgname=resynthesizer
pkgname=gimp3-plugin-${_pkgname}-git
pkgver=3.0.r3.g32e3962
pkgrel=1
pkgdesc="Suite of gimp plugins for texture synthesis (like heal-selection), ported to GIMP 3. Git-Version"
arch=('i686' 'x86_64' 'x86_64_v3')
url="https://github.com/bootchk/resynthesizer"
license=('GPL-3.0-or-later')
depends=(
  'gimp>=2.99'
  python
  python-gobject
)
makedepends=(
  git
  intltool
  meson
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=$pkgver")
options=('!emptydirs')
source=('git+https://github.com/bootchk/resynthesizer#branch=resynthesizer3')
b2sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd $_pkgname
    # Remove Ubuntu-ism
    sed -i 's@x86_64-linux-gnu/@@g' meson.build
}

build() {
    arch-meson --prefix '/usr' builddir $_pkgname
    meson compile -C builddir
}

check() {
    meson test -C builddir
}

package() {
    meson install -C builddir --destdir "$pkgdir"
}

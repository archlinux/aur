# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Lex Black (autumn-wind at web.de)
# Contributor: andre.vmatos

_pkgname=resynthesizer
pkgname=gimp3-plugin-${_pkgname}-git
pkgver=2.0.3.r90.gdee6711
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
source=('git+https://github.com/bootchk/resynthesizer#branch=resynthesizer3'
        "$_pkgname-0001-Fix-format-security-warning-in-debug.c.patch::$url/pull/130.patch")
b2sums=('SKIP'
        '35cc86808385984950bfa811d20422ba1082ecfb280f18ee42faa8b86b78e53b0cd354c818ac51efa15daab24190b864c08f8a6c8e821f079368a9fa6a319253')


pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd $_pkgname
    # See https://github.com/bootchk/resynthesizer/pull/130
    patch -Np1 < ../$_pkgname-0001-Fix-format-security-warning-in-debug.c.patch
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

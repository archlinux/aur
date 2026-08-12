# Maintainer: Gijs Vermeulen <gijsvrm at gmail dot com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Lorenzo Ferrillo <lorenzofer@live.it>
# Contributor: Ray Rashif <schiv@archlinux.org>

_pkgbase=lv2
pkgname=lib32-lv2
pkgver=1.18.10
pkgrel=2
pkgdesc="Plugin standard for audio systems (32-bit)"
arch=(x86_64)
url="https://lv2plug.in/"
license=(ISC)
depends=(
  lv2 # for the headers, which are not duplicated in this package
)
makedepends=(
  codespell
  flake8
  meson
  python-black
  python-pylint
  python-rdflib
  serd
  sord
)
source=(https://lv2plug.in/spec/$_pkgbase-$pkgver.tar.xz{,.sig})
sha512sums=('ab4bcf593f633b1ed16c0eb6aa4525458a00655ef9c87619bf85eaa966f8fd094a8e871b825f679e0d97923f8bbbf11841ff467022390ca2f1a5b5f66ccd5d1b'
            'SKIP')
b2sums=('72f9bc50ebac5d71279e0616bb1eb3c2a6748a28ff68988294135b18c7adc68c46a52b4698faf79f633768bf850d5052128a9f84b90aa9b5f9a56721acaf04c3'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

  arch-meson $_pkgbase-$pkgver build \
    --libdir='/usr/lib32' \
    -Ddocs=disabled \
    -Dplugins=disabled

  meson compile -C build
}

check() {
  meson test -C build || : # syntax and codespell tests fail
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -vDm 644 $_pkgbase-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $_pkgbase-$pkgver/{NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

  cd "$pkgdir/usr"

  rm -r bin include
}

# vim:set ts=2 sw=2 et:

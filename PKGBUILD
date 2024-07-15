# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Armin Preiml <apreiml@strohwolke.at>

pkgname=hare
pkgver=0.24.2
pkgrel=1
pkgdesc='The Hare programming language'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('MPL-2.0 AND GPL-3.0-only')
depends=('qbe' 'harec')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('2dbb83448efe85c36be50ebfbe9c8c567ac7a8c420253f242aa911e815fbf41ff4fbe0e36d22b5654b74441cc73bbaac9de5b9cdb06f9f687813babe2bf359c0')

prepare() {
  cd "${pkgname}-${pkgver}"

  # configure prefix directory & architecture
  sed \
    -e 's:/usr/local:/usr:' \
    -e "s/^ARCH = .*/ARCH = $CARCH/" \
    configs/linux.mk > config.mk
}

build() {
  cd "${pkgname}-${pkgver}"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  # XXX: parallel build driver builds are broken.
  LOCALVER=arch make -j1
}

check() {
  cd "${pkgname}-${pkgver}"

  # XXX: see above, in build().
  #
  # Currently one test fails on glibc
  # https://lists.sr.ht/~sircmpwn/hare-dev/%3C2I5P65667M8XC.2AAFMEP64ZWLL%40mforney.org%3E
  make check -j1
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}

# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=solus-artwork-git
pkgver=27.0.r3.g5120697
pkgrel=1
pkgdesc="Solus Artwork -- latest git"
arch=('x86_64')
url="https://solus-project.com/budgie"
license=(CC-BY-3.0 CC-BY-SA-4.0 GPL-2.0-only)
depends=(
budgie-desktop
)
makedepends=(
meson
go
)
provides=(solus-artwork)
conflicts=(solus-artwork)
source=("git+https://github.com/getsolus/artwork.git")
md5sums=('SKIP')

pkgver() {
  cd artwork
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd artwork

  # fix https://github.com/getsolus/artwork/issues/5
  sed -i '/start-here-solus-mono/d' icons/meson.build

  meson --prefix=/usr --sysconfdir=/etc build
}

build() {
  cd artwork
  ninja -C build
}

package() {
  cd artwork
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/${pkgname}/
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/."
  #install -Dm644 LICENSE.CCBY-3.0 "${pkgdir}/usr/share/licenses/${pkgname}/."
  #install -Dm644 LICENSE.CCBY-SA-4.0 "${pkgdir}/usr/share/licenses/${pkgname}/."
}


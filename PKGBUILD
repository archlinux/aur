# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Fediverse: @fabiscafe@mstdn.social

pkgname=tuba
pkgver=0.1.0
pkgrel=2
pkgdesc='Browse the Fediverse'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
url='https://tuba.geopjr.dev/'
license=('GPL3')
depends=(
  gtk4
  libadwaita
  libgee
  libsoup
  # Not a hard dependency of Tuba
  ## but it's UX breaking & so important
  ## enough to be in this list instead of
  ## optdepends
  ## https://github.com/GeopJr/Tuba/issues/32#issuecomment-1483280966
  webp-pixbuf-loader
)
makedepends=(
  git
  meson
  vala
)
_commit=3d952be8d31136873fe1261c460baf88aafb8e7f # tags/0.1.0^0
source=("git+https://github.com/GeopJr/Tuba.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd Tuba
  git describe --tags | sed -r 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd Tuba
}

build() {
  arch-meson Tuba build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s "/usr/bin/dev.geopjr.Tuba" "$pkgdir/usr/bin/tuba" 
}

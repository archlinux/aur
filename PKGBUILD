# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=itch-bin
pkgver=23.6.2
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss')
makedepends=()
options=('!strip')
provides=('itch')
conflicts=('itch')
install="itch.install"

[ "$CARCH" = "i686" ]   && _ELECTRON_ARCH=ia32; _ITCH_ARCH=i386
[ "$CARCH" = "x86_64" ] && _ELECTRON_ARCH=x64;  _ITCH_ARCH=amd64

# sic. - source is in itch repo, kitch is a dummy repo for canary-channel github releases
source=("https://github.com/itchio/itch/releases/download/v${pkgver}/itch-${pkgver}-${_ITCH_ARCH}.tar.xz")
sha256sums=('a9faa0fda73d7935b52ec829dccc3e523066f9e6d072232e7cd813e062c015b3')

prepare() {
  basedir=`cd .. && pwd`;
  tar xf "${basedir}/extras.tar.gz"
}

package() {
  tar xf itch-${pkgver}-${_ITCH_ARCH}.tar.xz
  cd "${srcdir}/itch-${pkgver}-${_ITCH_ARCH}"

  install -d "${pkgdir}/usr/lib/itch"
  cp -a "${srcdir}/itch-${pkgver}-${_ITCH_ARCH}/." "${pkgdir}/usr/lib/itch"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/extras/io.itch.itch.desktop" "${pkgdir}/usr/share/applications/itch.desktop"

  for icon in ${srcdir}/extras/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 "${srcdir}/extras/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/itch/itch" "${pkgdir}/usr/bin/itch"
}

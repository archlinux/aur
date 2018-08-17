# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=itch-bin
pkgver=23.6.3
pkgrel=2
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
sha256sums=('d9015929cecf5d68c05b109dc462ee42d457f7e7a5feb8885678fcc355ae8212')

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
    iconsize="${icon#${srcdir}/extras/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 "${srcdir}/extras/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/itch/itch" "${pkgdir}/usr/bin/itch"
}

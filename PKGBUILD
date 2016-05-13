# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=itch
pkgver=17.6.0
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'p7zip')
makedepends=('nodejs' 'nodejs-grunt-cli' 'npm' 'ruby')
options=('!strip')
install="itch.install"

# sic. - source is in itch repo, kitch is a dummy repo for canary-channel github releases
source=("https://github.com/itchio/itch/archive/v${pkgver}.tar.gz")
sha256sums=('e34a6dc8128dfaf7ce68b001444c5c4d53a9f8b4912d9bd586450ae2d0bd7a6f')

[ "$CARCH" = "i686" ]   && _ELECTRON_ARCH=ia32; _ITCH_ARCH=i386
[ "$CARCH" = "x86_64" ] && _ELECTRON_ARCH=x64;  _ITCH_ARCH=amd64

prepare() {
  cd "itch-${pkgver}"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  # (npm3's progress indicator is notoriously slow, disable)
  npm install --no-progress --quiet
}

build() {
  cd "${srcdir}/itch-${pkgver}"
  export CI_BUILD_TAG="v17.6.0"
  export CI_CHANNEL="stable"

  release/ci-compile.rb
  release/ci-generate-linux-extras.rb

  grunt -v "electron:linux-${_ELECTRON_ARCH}"
}

check() {
  cd "${srcdir}/itch-${pkgver}"
  npm test
}

package() {
  cd "${srcdir}/itch-${pkgver}"

  install -d "${pkgdir}/usr/lib/itch"
  cp -a "build/v${pkgver}/itch-linux-${_ELECTRON_ARCH}/." "${pkgdir}/usr/lib/itch"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 linux-extras/itch.desktop "${pkgdir}/usr/share/applications/itch.desktop"

  for icon in release/images/itch-icons/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -s "/usr/bin/itch" "${pkgdir}"
}

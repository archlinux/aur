# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=itch
pkgver=20.0.0
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss')
makedepends=('nodejs' 'nodejs-grunt-cli' 'npm')
options=('!strip')
install="itch.install"

# sic. - source is in itch repo, kitch is a dummy repo for canary-channel github releases
source=("https://github.com/itchio/itch/archive/v${pkgver}.tar.gz")
sha256sums=('d75d95820806fdfbfd402dfe843afbdf027664567f3813dfa7a8fa97c76de875')

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
  export CI_BUILD_TAG="v20.0.0"
  export CI_CHANNEL="stable"

  release/ci-compile.js
  release/ci-generate-linux-extras.js

  grunt -v "electron:linux-${_ELECTRON_ARCH}"
}

check() {
  cd "${srcdir}/itch-${pkgver}"
  node app/tests/runner.js
}

package() {
  cd "${srcdir}/itch-${pkgver}"

  install -d "${pkgdir}/usr/lib/itch"
  cp -a "build/v${pkgver}/itch-linux-${_ELECTRON_ARCH}/." "${pkgdir}/usr/lib/itch"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 linux-extras/io.itch.itch.desktop "${pkgdir}/usr/share/applications/itch.desktop"

  for icon in release/images/itch-icons/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/itch/itch" "${pkgdir}/usr/bin/itch"
}

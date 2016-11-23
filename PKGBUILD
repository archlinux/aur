# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=kitch
pkgver=20.1.0
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/kitch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss')
makedepends=('nodejs' 'nodejs-grunt-cli' 'npm')
options=('!strip')
install="kitch.install"

# sic. - source is in itch repo, kitch is a dummy repo for canary-channel github releases
source=("https://github.com/itchio/itch/archive/v${pkgver}-canary.tar.gz")
sha256sums=('d9d9179475173dec60bc977a9a72caf75b05dfc835ff15125b7dde48e43c40d6')

[ "$CARCH" = "i686" ]   && _ELECTRON_ARCH=ia32; _ITCH_ARCH=i386
[ "$CARCH" = "x86_64" ] && _ELECTRON_ARCH=x64;  _ITCH_ARCH=amd64

prepare() {
  cd "itch-${pkgver}-canary"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  # (npm3's progress indicator is notoriously slow, disable)
  npm install --no-progress --quiet
}

build() {
  cd "${srcdir}/itch-${pkgver}-canary"
  export CI_BUILD_TAG="v20.1.0-canary"
  export CI_CHANNEL="canary"

  release/ci-compile.js
  release/ci-generate-linux-extras.js

  grunt -v "electron:linux-${_ELECTRON_ARCH}"
}

check() {
  cd "${srcdir}/itch-${pkgver}-canary"
  node app/tests/runner.js
}

package() {
  cd "${srcdir}/itch-${pkgver}-canary"

  install -d "${pkgdir}/usr/lib/kitch"
  cp -a "build/v${pkgver}-canary/kitch-linux-${_ELECTRON_ARCH}/." "${pkgdir}/usr/lib/kitch"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 linux-extras/io.itch.kitch.desktop "${pkgdir}/usr/share/applications/kitch.desktop"

  for icon in release/images/kitch-icons/icon*.png
  do
    iconsize="${icon#release/images/kitch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/kitch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/kitch/kitch" "${pkgdir}/usr/bin/kitch"
}

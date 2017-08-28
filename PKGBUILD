# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=kitch
pkgver=24.2.0
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/kitch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss')
makedepends=('nodejs' 'npm' 'python2' 'gcc')
options=('!strip')
install="kitch.install"

# sic. - source is in itch repo, kitch is a dummy repo for canary-channel github releases
source=("https://github.com/itchio/itch/archive/v${pkgver}-canary.tar.gz")
sha256sums=('85979ad36f4de863e0efb74f45b39062c9b7ea5aeb254e5a9da56899c28eeb0e')

[ "$CARCH" = "i686" ]   && _ELECTRON_ARCH=ia32; _ITCH_ARCH=386
[ "$CARCH" = "x86_64" ] && _ELECTRON_ARCH=x64;  _ITCH_ARCH=amd64

prepare() {
  cd "itch-${pkgver}-canary"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/itch-${pkgver}-canary"
  export CI_BUILD_TAG="v24.2.0-canary"
  export CI_CHANNEL="canary"

  release/ci-compile.js
  release/ci-generate-linux-extras.js
  release/ci-package.js --build-only linux "${_ITCH_ARCH}"
}

# about the absence of check():
# tests are run with electron and, trust me, you don't
# want this in your PKGBUILD

package() {
  cd "${srcdir}/itch-${pkgver}-canary"

  install -d "${pkgdir}/usr/lib/kitch"
  cp -a "build/v${pkgver}/kitch-linux-${_ELECTRON_ARCH}/." "${pkgdir}/usr/lib/kitch"

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

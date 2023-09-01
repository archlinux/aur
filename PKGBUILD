# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jeremy Symon <jtsymon@gmail.com>

pkgname=itch-setup-git
pkgver=1.26.0.r12.gc718b87
pkgrel=2
pkgdesc="Installer for the itch.io desktop app"
arch=(x86_64)
url="https://itch.io/"
license=(MIT)
depends=(gtk3)
makedepends=(git go npm nodejs)
provides=(itch-setup)
conflicts=(itch-setup)
_itchver=25.5.1
source=("git+https://github.com/itchio/itch-setup.git"
        "itch-${_itchver}.tar.gz::https://github.com/itchio/itch/archive/refs/tags/v${_itchver}.tar.gz"
        'itch.desktop'
        'itch.sh')
sha256sums=('SKIP'
            '0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            '57e1c8ad285b89f3380cd028aa51e8083a8e4327cc5763d396caf607e905efcf'
            '985cf842686598dd7e4e153f6fd7c9ee901fd200403893235e2974b108653bcf')
options=(!lto)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  npm install

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -extldflags ${LDFLAGS}" \
    -buildmode=pie \
    .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 itch-setup -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm755 ../itch.sh "${pkgdir}/usr/bin/itch"
  install -Dm644 ../itch.desktop -t "${pkgdir}/usr/share/applications/"

  cd "${srcdir}/itch-${_itchver}"
  for icon in release/images/itch-icons/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done
}

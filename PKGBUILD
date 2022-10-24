# Maintainer: Roni Hokkanen <roni dot hokkanen at protonmail dot com>

pkgname=ergo-node
pkgver=4.0.104
pkgrel=1
pkgdesc="Reference implementation of the Ergo protocol. Ergo is a smart contract platform and cryptocurrency. This package provides a Systemd service and a script that runs Ergo node using Xdg base dirs."
arch=('any')
url='https://docs.ergoplatform.com/node/install/'
license=('custom:CC0')
depends=('java-runtime>=8')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
	"git+https://github.com/ergoplatform/ergo"
	"ergo-node"
	"ergo-node.service"
)

# Pkgver should be changed to use github's api at https://api.github.com/repos/ergoplatform/ergo/releases/latest
# Right now if there is a prerelease this package will download it instead of the latest stable release
pkgver() {
  cd ergo
  ver=$(git describe --tags)
  echo ${ver:1}
}

prepare() {
  if ! [ -f ergo-$(pkgver).jar ]; then
    curl -LO "https://github.com/ergoplatform/ergo/releases/download/v$(pkgver)/ergo-$(pkgver).jar"
  fi
}

package() {
  install -Dm755 "${srcdir}/ergo-node" "${pkgdir}/usr/bin/ergo-node"
  install -Dm644 "${srcdir}/ergo-$(pkgver).jar" "${pkgdir}/usr/share/ergo-node/ergo.jar"
  install -Dm644 "${srcdir}/ergo/src/main/resources/samples/local.conf.sample" "${pkgdir}/usr/share/ergo-node/local.conf.sample"
  install -Dm644 "${srcdir}/ergo-node.service" "${pkgdir}/usr/lib/systemd/user/ergo-node.service"
  install -Dm644 "${srcdir}/ergo/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP'
         '7cd767eb77d149cd5132b502568bc738'
		 '2746b9cc548b8a234fa8772cb1968929')

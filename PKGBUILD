# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=signal-web-gateway-git
pkgver=0.1
pkgrel=1
pkgdesc="Use Signal as a web gateway for other apps (reporting, monitoring, etc.)"
arch=('x86_64')
url="https://gitlab.com/morph027/signal-web-gateway"
license=('MIT')
makedepends=('go')
source=('git+https://github.com/morph027/textsecure.git'
	'signal-web-gateway.service')
sha512sums=('SKIP'
	    'aa0c5e8eae19bc8da8374827de993b5dace5e9d84a02a51f01903a99a55816eab448905e8d8b552f28b2cfd8e0f2e263839b0b12b58df477c3910d6f73d961a8')
install="signal-web-gateway.install"
conflicts=("signal-web-gateway")
provides=("signal-web-gateway")

#pkgver() {
#  cd "textsecure"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/morph027"
  mv "${srcdir}/textsecure" "${srcdir}/src/github.com/morph027/textsecure"
  cd "${srcdir}/src/github.com/morph027/textsecure"
  go get -v
  go get -v github.com/sirupsen/logrus
}

build() {
  export GOPATH="${srcdir}"
  cd "${srcdir}/src/github.com/morph027/textsecure/cmd/textsecure"
  go build -v
}

package() {
  install -Dm755 "${srcdir}/src/github.com/morph027/textsecure/cmd/textsecure/textsecure" "${pkgdir}/usr/bin/signal-web-gateway"
  install -Dm644 "${srcdir}/signal-web-gateway.service" "${pkgdir}/usr/lib/systemd/system/signal-web-gateway.service"
  install -D "${srcdir}/src/github.com/morph027/textsecure/COPYING" "${pkgdir}/usr/share/licenses/signal-web-gateway/LICENSE"
  mkdir -p "${pkgdir}/var/lib/signal-web-gateway"
  cp -r "${srcdir}/src/github.com/morph027/textsecure/cmd/textsecure/.config" "${pkgdir}/var/lib/signal-web-gateway/.config"
  mkdir -p "${pkgdir}/etc/webapps/signal-web-gateway"
  ln -s "/var/lib/signal-web-gateway/.config/config.yml" "${pkgdir}/etc/webapps/signal-web-gateway/"
}

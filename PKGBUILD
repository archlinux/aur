# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=signal-web-gateway-git
pkgver=0.1
pkgrel=7
pkgdesc="Use Signal as a web gateway for other apps (reporting, monitoring, etc.)"
arch=('x86_64')
url="https://gitlab.com/morph027/signal-web-gateway"
license=('MIT')
makedepends=('go' 'mercurial')
source=('git+https://github.com/morph027/textsecure.git'
	'signal-web-gateway.service'
	'signal-web-gateway.tmpfiles'
	'signal-web-gateway.sysusers')
sha512sums=('SKIP'
            '55d05974f9e07f8849d7ea0b68ea1bd408c1e247801ff1236bbf0183ead0a1133bd5be1613d0e6ca64010525402c7ec2957274d8fd88a3c12c4389c77d76e5fa'
            '139dc026505c124520c922fbe975c19052dee82fbe5195ac2c1016d09a1e78ff9aae0b62173a0238d2d1a734a25237cec048fd2210435401ec97ffa4010c4dc8'
            'ac42a4350a6c3e5f77189f41a906ce2b0144d8e6bee930b1897db0e50968b38986b9e937e009160a40e8568bffddf8ad6e67bddf0d69aa19f63831b04e23826d')
conflicts=("signal-web-gateway")
provides=("signal-web-gateway")
backup=("etc/webapps/signal-web-gateway/config.yml")

#pkgver() {
#  cd "textsecure"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/morph027"
  cp -r "${srcdir}/textsecure" "${srcdir}/src/github.com/morph027/textsecure"
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
  install -Dm 755 "${srcdir}/src/github.com/morph027/textsecure/cmd/textsecure/textsecure" "${pkgdir}/usr/bin/signal-web-gateway"
  install -Dm 644 "${srcdir}/signal-web-gateway.service" "${pkgdir}/usr/lib/systemd/system/signal-web-gateway.service"
  install -Dm 644 "${srcdir}/signal-web-gateway.sysusers" "${pkgdir}/usr/lib/sysusers.d/signal-web-gateway.conf"
  install -Dm 644 "${srcdir}/signal-web-gateway.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/signal-web-gateway.conf"
  install -D "${srcdir}/src/github.com/morph027/textsecure/COPYING" "${pkgdir}/usr/share/licenses/signal-web-gateway/LICENSE"
  install -Dm 644 "${srcdir}/src/github.com/morph027/textsecure/cmd/textsecure/.config/config.yml" "${pkgdir}/etc/webapps/signal-web-gateway/config.yml"
  mkdir -p "${pkgdir}/var/lib/signal-web-gateway/.config"
  ln -s "/etc/webapps/signal-web-gateway/config.yml" "${pkgdir}/var/lib/signal-web-gateway/.config/config.yml" 
}

# Maintainer: dr00tb <adam at dr00tb dot com>

pkgname=tkey-ssh-agent
pkgver=1.0.0
pkgrel=1
pkgdesc="A ssh-agent for the Tillitis TKey"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tillitis/${pkgname}"
license=('GPL2')
makedepends=('make' 'go')
conflicts=("${pkgname}2")
provides=("${pkgname}")
install="${pkgname}.install"
_archive="${pkgname}-${pkgver}"
source=("${url}/archive/v${pkgver}/${_archive}.tar.gz")
b2sums=('SKIP')

build() {
  TKEY_SSH_AGENT_VERSION=
  TKEY_SIGNER_APP_NO_TOUCH=
  cd "${srcdir}/${_archive}"
  CGO_ENABLED=0 go build \
          -ldflags "-X main.version=$TKEY_SSH_AGENT_VERSION -X main.signerAppNoTouch=$TKEY_SIGNER_APP_NO_TOUCH" \
          -trimpath \
          -buildvcs=false \
          ./cmd/tkey-ssh-agent
}

package() {
  destbin="${pkgdir}/usr/bin"
  destman1="${pkgdir}/usr/share/man/man1"
  destunit="${pkgdir}/usr/lib/systemd/user"
  destrules="${pkgdir}/etc/udev/rules.d"
  cd "${srcdir}/${_archive}"
	install -Dm755 "${pkgname}" "${destbin}/${pkgname}"
	strip "${destbin}/${pkgname}"
	install -Dm644 "system/${pkgname}.1" "${destman1}/${pkgname}.1"
	gzip -n9f "${destman1}/${pkgname}.1"
	install -Dm644 "system/${pkgname}.service.tmpl" "${destunit}/${pkgname}.service"
	sed -i -e "s,##BINDIR##,/usr/bin," "${destunit}/${pkgname}.service"
	install -Dm644 system/60-tkey.rules "${destrules}/60-tkey.rules"
}


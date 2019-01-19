# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=jackal
pkgname=${_pkgname}-git
pkgver=v0.4.6_1_g8be4ba9049ea
pkgrel=1
pkgdesc='An XMPP/Jabber server'
arch=('x86_64' 'i686')
url='https://github.com/ortuman/jackal'
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.11.0')
optdepends=('mariadb: MariaDB support')
conflicts=('jackal')
provides=('jackal')
backup=('etc/jackal/jackal.yml')
source=(git+https://github.com/ortuman/jackal.git
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        jackal.yml)
sha256sums=('SKIP'
            '537ff4d0a3467f0b4ed64c677fcdb0d160bdc38af9ded2e2e33783a88c9e8f3b'
            '5fec4f4053ac15cd597bb32ba03c35d85f52438204fd801edf333403ec2c4bf3'
            '6692334f0d5157d8da200e1d1e3817805a321342c02677cb0a97236c68cf465e'
            '490d8da615e0f2517bb4493cb42bfa3de902fdd47b0e8e9f289bd2da12846be4')
install=jackal.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

build() {
  cd ${_pkgname}
  export GO111MODULE=on
  go build -gcflags  "all=-trimpath=${PWD}" \
           -asmflags "all=-trimpath=${PWD}" \
           -ldflags  "-extldflags ${LDFLAGS}"
}

package() {
  install -dm 750 "${pkgdir}/var/lib/jackal/"
  install -dm 775 "${pkgdir}/usr/share/doc/jackal/"
  install -dm 775 "${pkgdir}/usr/share/jackal/"

  install -D jackal.yml "${pkgdir}/etc/jackal/jackal.yml"
  install -Dm444 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/jackal/"
  cp -r "${srcdir}/${_pkgname}/sql/" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/${_pkgname}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim: ts=2 sw=2 et:

# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=jackal
pkgver=0.4.6
pkgrel=2
pkgdesc='An XMPP/Jabber server'
arch=('x86_64' 'i686')
url='https://github.com/ortuman/jackal'
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.11')
optdepends=('postgresql: PostgreSQL support'
            'mariadb: MariaDB support')
conflicts=('jackal-git')
backup=('etc/jackal/jackal.yml')
source=(https://github.com/ortuman/jackal/archive/v${pkgver}.tar.gz
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        jackal.yml)
sha256sums=('1c6c8827d905802a35f42bac73476eead768cf8a5540334403e3ee241c2162e2'
            '537ff4d0a3467f0b4ed64c677fcdb0d160bdc38af9ded2e2e33783a88c9e8f3b'
            '5fec4f4053ac15cd597bb32ba03c35d85f52438204fd801edf333403ec2c4bf3'
            '6692334f0d5157d8da200e1d1e3817805a321342c02677cb0a97236c68cf465e'
            'e7e0b6d701c4e0c7b76fb3b446e01926368325e70aff04fa33eb5f9e88f392be')
install=jackal.install

build() {
  cd jackal-${pkgver}
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
  install -Dm444 "${srcdir}/jackal-${pkgver}/README.md" "${pkgdir}/usr/share/doc/jackal/"
  cp -r "${srcdir}/jackal-${pkgver}/sql/" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/jackal-${pkgver}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/jackal.service" "${pkgdir}/usr/lib/systemd/system/jackal.service"
  install -Dm644 "${srcdir}/jackal.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackal.conf"
}

# vim: ts=2 sw=2 et:

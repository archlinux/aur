# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=jackal
pkgver=0.61.0
pkgrel=1
pkgdesc='An XMPP/Jabber server'
arch=('x86_64' 'i686')
url='https://github.com/ortuman/jackal'
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.17')
optdepends=('postgresql: PostgreSQL support'
            'mariadb: MariaDB support')
conflicts=('jackal-git')
backup=('etc/jackal/jackal.yml', 'etc/jackal/config.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ortuman/jackal/archive/v${pkgver}.tar.gz"
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        config.yaml)
sha256sums=('d64a8a3107c26e5186304f9538ad97633d667ce297f930e480490f64640c6b9b'
            '0a9a9065957e5b0576e5443b29bf0cae81281194664376569a91c51f85e7d7ff'
            '5fec4f4053ac15cd597bb32ba03c35d85f52438204fd801edf333403ec2c4bf3'
            '20b7e5a5fee727e72fdbac54182b594a838340c0625036ca9d117e2a9d710045'
            'a6b361f52bb1ffb7b872c0ab43086048680cbe462ea95e72d85771d2418e52fe')
install=jackal.install

build() {
  cd jackal-${pkgver}
  go build -tags netgo \
           -trimpath \
           -buildmode=pie \
           -ldflags  "-extldflags ${LDFLAGS}" \
           "github.com/ortuman/jackal/cmd/jackalctl"
  go build -tags netgo \
           -trimpath \
           -buildmode=pie \
           -ldflags  "-extldflags ${LDFLAGS}" \
           "github.com/ortuman/jackal/cmd/jackal"
}

package() {
  install -dm 775 "${pkgdir}/usr/share/doc/jackal/"
  install -dm 775 "${pkgdir}/usr/share/jackal/"

  install -D "${srcdir}/config.yaml" "${pkgdir}/etc/jackal/config.yaml"
  install -Dm444 "${srcdir}/jackal-${pkgver}/README.md" "${pkgdir}/usr/share/doc/jackal/"
  cp -r "${srcdir}/jackal-${pkgver}/sql/" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/jackal-${pkgver}/jackalctl" "${pkgdir}/usr/bin/jackalctl"
  install -Dm755 "${srcdir}/jackal-${pkgver}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/jackal.service" "${pkgdir}/usr/lib/systemd/system/jackal.service"
  install -Dm644 "${srcdir}/jackal.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackal.conf"
}

# vim: ts=2 sw=2 et:

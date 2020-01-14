# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=jackal
pkgver=0.8.2
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ortuman/jackal/archive/v${pkgver}.tar.gz"
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        config.patch)
sha256sums=('52b5c72d633909e25ab11d3ca5f82d414b5627d7226cb7ec50cdab08b6847bb7'
            '0a9a9065957e5b0576e5443b29bf0cae81281194664376569a91c51f85e7d7ff'
            '5fec4f4053ac15cd597bb32ba03c35d85f52438204fd801edf333403ec2c4bf3'
            '20b7e5a5fee727e72fdbac54182b594a838340c0625036ca9d117e2a9d710045'
            'b89cf730cf119e6800aa4b9dac3b7ad1f0b901829f035933d5ea998c561b55f4')
install=jackal.install

prepare() {
  cd jackal-${pkgver}/
  patch -Np1 -i ../config.patch
}

build() {
  cd jackal-${pkgver}
  export GO111MODULE=on
  go build -trimpath \
           -buildmode=pie \
           -ldflags  "-extldflags ${LDFLAGS}"
}

package() {
  install -dm 775 "${pkgdir}/usr/share/doc/jackal/"
  install -dm 775 "${pkgdir}/usr/share/jackal/"

  install -D "${srcdir}/jackal-${pkgver}/example.jackal.yml" "${pkgdir}/etc/jackal/jackal.yml"
  install -Dm444 "${srcdir}/jackal-${pkgver}/README.md" "${pkgdir}/usr/share/doc/jackal/"
  cp -r "${srcdir}/jackal-${pkgver}/sql/" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/jackal-${pkgver}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/jackal.service" "${pkgdir}/usr/lib/systemd/system/jackal.service"
  install -Dm644 "${srcdir}/jackal.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackal.conf"
}

# vim: ts=2 sw=2 et:

# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=jackal
pkgver=0.4.0
pkgrel=1
pkgdesc='An XMPP/Jabber server'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ortuman/jackal'
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.11.0')
optdepends=('mariadb: MariaDB support')
conflicts=('jackal-git')
backup=('etc/jackal/jackal.yml')
source=(https://github.com/ortuman/jackal/archive/v${pkgver}.tar.gz
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        jackal.yml)
sha512sums=('b25065f21dbc674c8d43ffa389fcf7e16b27bdd72186e3ce56412654de6321f9a6c75ee1df1ff320b3d8770e0ee907fdd2310ec696f11ccd88f474464fcc9268'
            'd7025628d82371c6ef7a942a918d8970ca54f01ddd513e2577474a31d880355045415c131cf68b8df6f1cc3b19b17135a8d955815f6b4f91d6ce77a70d982f7e'
            '470ec8c5958658e3f264f2186ccfb14a2b9cd6760da86116a89ecfbf147ef38310fb767ae1bb79a0fb6ae3881de399322a52540da7f4b21f4bd791d54cf47b11'
            '8eb4c15f63d1f4028d3dbe8a0861ffa514f6643c8fa918fc54c1fda4d6380d914b12d6cf1a199ee0929c966b311645aa482825f6d8ea29173865da29530bb711'
            'c8445899ab3708bd11754e4c1cc74069c8586521d4e9d41c8cc93a7738889817a5502f19484685f3d1b5e658eb40eea1bd1b61c1fc447c5c3e4569faf1b82664')
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
  install -Dm444 "${srcdir}/jackal-${pkgver}/sql/mysql.sql" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/jackal-${pkgver}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/jackal.service" "${pkgdir}/usr/lib/systemd/system/jackal.service"
  install -Dm644 "${srcdir}/jackal.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackal.conf"
}

# vim: ts=2 sw=2 et:

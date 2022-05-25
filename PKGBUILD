# Maintainer: ltdk <usr@ltdk.xyz>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.13.1
pkgrel=2
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
depends=('glibc')
makedepends=('go'
             'sqlite'
             'go-bindata'
             'nodejs-less'
             'nodejs-less-plugin-clean-css')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('etc/writefreely/config.ini')
source=("${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/writeas/writefreely/archive/v${pkgver}.tar.gz")
sha256sums=('5f8dc4dfa200b395b0a615a0ab3faa40d363978d460aa800a022725c6973ae25'
            '7407acf657f6ae090d916e7b002e1521e60479776137bbb5b7b1084eea595807'
            '591e6067e08a35dad90c82302dbb853bb08943fdcea4af20abf5940128aada08'
            'f7ac0a02721bc4fb7451dd1ab3dc3c4b4f450d1d7623b3c55e6d0b1c73add43c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/less"
  make all

  cd ../
  ORIGLDFLAGS="$LDFLAGS" GO111MODULE=on make LDFLAGS="-ldflags=\"-X 'github.com/writeas/writefreely.softwareVer=${pkgver}-arch-${pkgrel}' -extldflags '\$(ORIGLDFLAGS)'\"" build

  cmd/writefreely/writefreely config generate
}

package() {
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/pages
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/static
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/templates

  install -Dm644 "${pkgname}-${pkgver}"/config.ini "${pkgdir}"/etc/writefreely/config.ini
  install -Dm644 "${pkgname}.service" -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm755 "${pkgname}-${pkgver}"/cmd/writefreely/writefreely "${pkgdir}"/usr/bin/writefreely

  cp -r "${pkgname}-${pkgver}"/pages/* "${pkgdir}"/usr/share/writefreely/pages
  cp -r "${pkgname}-${pkgver}"/static/* "${pkgdir}"/usr/share/writefreely/static
  cp -r "${pkgname}-${pkgver}"/templates/* "${pkgdir}"/usr/share/writefreely/templates

  install -dm700 "${pkgdir}"/var/lib/writefreely/data
  install -dm700 "${pkgdir}"/var/lib/writefreely/keys
}

# vim: ts=2 sw=2 et:

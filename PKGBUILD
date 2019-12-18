# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.11.2
pkgrel=1
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
install="${pkgname}.install"
source=("${pkgname}-sysusers.conf"
        "${pkgname}.service"
        "${pkgname}.tmpfiles"
        config.ini
        makefile.patch
        "https://github.com/writeas/writefreely/archive/v${pkgver}.tar.gz")
sha256sums=('6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            '28328462c921cc6dfc690231da190ed77635da60d5f76c9f2646aeb0cc48f13e'
            '7884d61cf16b7ef94616c5aa2954229979dace22deb6d5c2ece25405bcf41aae'
            '4c404097744537bc3c6b58913c4c20a36da8a8953b756f80b136c2b11b02e6d3'
            'f6282ce91ada86b77f54469f0c24db20089b87bf4593ee23f5855cbf5fde4859'
            '70b1f2101e75d36410b8d94624488d9cc826e34f4078cbac11e0e5242ff1b0d5')

prepare() {
  export GO111MODULE=on
  cd "${srcdir}/${pkgname}-${pkgver}/"

  patch -p1 Makefile ../makefile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/less"
  make all

  cd ../
  GO111MODULE=on make build
}

package() {
  install -dm700 "${pkgdir}"/var/lib/${pkgname}/data
  install -dm700 "${pkgdir}"/var/lib/${pkgname}/keys
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/pages
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/static
  install -dm755 "${pkgdir}"/usr/share/${pkgname}/templates

  install -Dm644 config.ini "${pkgdir}"/etc/writefreely/config.ini
  install -Dm644 "${pkgname}.service" -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm755 "${pkgname}-${pkgver}"/cmd/writefreely/writefreely "${pkgdir}"/usr/bin/writefreely

  cp -r "${pkgname}-${pkgver}"/pages/* "${pkgdir}"/usr/share/writefreely/pages
  cp -r "${pkgname}-${pkgver}"/static/* "${pkgdir}"/usr/share/writefreely/static
  cp -r "${pkgname}-${pkgver}"/templates/* "${pkgdir}"/usr/share/writefreely/templates
}

# vim: ts=2 sw=2 et:

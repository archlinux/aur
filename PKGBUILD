# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=writefreely
pkgname=writefreely-git
pkgver=v0.9.1_0_gfdbefa806fd0
pkgrel=1
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
depends=('glibc')
makedepends=('go'
             'go-bindata'
             'sqlite'
             'nodejs-less'
             'nodejs-less-plugin-clean-css')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('etc/writefreely/config.ini')
install=writefreely.install
source=(writefreely-sysusers.conf
        writefreely.service
        config.ini
        64.patch
        git+https://github.com/writeas/writefreely.git)
sha256sums=('6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            '60d4b49872523a2aed3e0e6a55513dfefe5ae6cbec43f2fcc65db894fb3bd2a3'
            'e357b687bd0eab95996711276216b6f2dc534ba9214ae094172d6d7a6b1fdae5'
            '009c083488511d92b489337f7feb8bd17631a104907959d21b1f9b5df3ce0a70'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  export GO111MODULE=on
  cd "${srcdir}/${_pkgname}"

  patch -p1 <../64.patch
}

build() {
  cd "${_pkgname}/less"
  make all

  cd ../
  GO111MODULE=on make build
}

package() {
  install -dm750 "${pkgdir}"/var/lib/${_pkgname}/data
  install -dm750 "${pkgdir}"/var/lib/${_pkgname}/keys
  install -dm750 "${pkgdir}"/usr/share/${_pkgname}/pages
  install -dm750 "${pkgdir}"/usr/share/${_pkgname}/static
  install -dm750 "${pkgdir}"/usr/share/${_pkgname}/templates

  install -Dm644 config.ini "${pkgdir}"/etc/writefreely/config.ini
  install -Dm644 writefreely.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 writefreely-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/writefreely.conf
  install -Dm755 "${_pkgname}"/cmd/writefreely/writefreely "${pkgdir}"/usr/bin/writefreely

  cp -r "${_pkgname}"/pages/* "${pkgdir}"/usr/share/writefreely/pages
  cp -r "${_pkgname}"/static/* "${pkgdir}"/usr/share/writefreely/static
  cp -r "${_pkgname}"/templates/* "${pkgdir}"/usr/share/writefreely/templates
}

# vim: ts=2 sw=2 et:

# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.7.1
pkgrel=2
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
makedepends=('go>=1.11'
             'go-bindata'
             'sqlite')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('var/lib/writefreely/config.ini'
        'etc/writefreely/config.ini')
install=writefreely.install
source=(writefreely-sysusers.conf
        writefreely.service
        config.ini
        64.patch
        69.patch
        "https://github.com/writeas/writefreely/archive/v${pkgver}.tar.gz")
sha256sums=('6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            '60d4b49872523a2aed3e0e6a55513dfefe5ae6cbec43f2fcc65db894fb3bd2a3'
            'e357b687bd0eab95996711276216b6f2dc534ba9214ae094172d6d7a6b1fdae5'
            '009c083488511d92b489337f7feb8bd17631a104907959d21b1f9b5df3ce0a70'
            '3a8adb0c6c559801e5ffcea89c06a787fdff5e8d0b7ffd4d5ff4261f168912fa'
            'e9700e751d7d2a71a19ed9313be93247e4f865e193de5b3d3d9d81bea2148be4')

prepare() {
  export GO111MODULE=on
  cd "${srcdir}/${pkgname}-${pkgver}/"

  patch -p1 <../64.patch
  patch -p1 <../69.patch

  rm -rf go.mod
  go mod init github.com/writeas/writefreely

  # Temporary manual override:
  # Go picks v2 by default, which writefreely doesn't seem to support yet.
  go get -u github.com/ikeikeikeike/go-sitemap-generator@v1.0.1
  go get -u github.com/writeas/monday@v0.0.0-20181024143321-54a7dd579219
  go mod tidy
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  GO111MODULE=on make build
}

package() {
  install -dm750 "${pkgdir}"/var/lib/${pkgname}/data
  install -dm750 "${pkgdir}"/var/lib/${pkgname}/keys
  install -dm750 "${pkgdir}"/usr/share/${pkgname}/pages
  install -dm750 "${pkgdir}"/usr/share/${pkgname}/static
  install -dm750 "${pkgdir}"/usr/share/${pkgname}/templates

  install -Dm644 config.ini "${pkgdir}"/etc/writefreely/config.ini
  install -Dm644 writefreely.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 writefreely-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/writefreely.conf
  install -Dm755 "${pkgname}-${pkgver}"/cmd/writefreely/writefreely "${pkgdir}"/usr/bin/writefreely

  cp -r "${pkgname}-${pkgver}"/pages/* "${pkgdir}"/usr/share/writefreely/pages
  cp -r "${pkgname}-${pkgver}"/static/* "${pkgdir}"/usr/share/writefreely/static
  cp -r "${pkgname}-${pkgver}"/templates/* "${pkgdir}"/usr/share/writefreely/templates
}

# vim: ts=2 sw=2 et:

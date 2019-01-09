# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.7.0
pkgrel=4
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
makedepends=('go>=1.11'
             'go-bindata'
             'sqlite')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('var/lib/writefreely/config.ini')
install=writefreely.install
source=('writefreely-sysusers.conf'
        'writefreely.service'
        'config.ini'
        '64.patch'
        "https://github.com/writeas/writefreely/archive/v${pkgver}.tar.gz")
sha256sums=('6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            '142fcf18320a418b73ed0678acea58ae69287e47760d6abb5283376c21092dec'
            '6946f0211b25743451954d2c155222df2aeaf7f49c3fafcb9183c6fc62a95ef9'
            '009c083488511d92b489337f7feb8bd17631a104907959d21b1f9b5df3ce0a70'
            'a99d4fdc6fb3a52426f4b99fe1c18180ea35544d2267ec8ef82d868da5017fc9')

prepare() {
  export GO111MODULE=on
  cd "${srcdir}/${pkgname}-${pkgver}/"

  # See: https://github.com/writeas/writefreely/pull/64
  patch -p1 <../64.patch

  rm -rf go.mod
  go mod init github.com/writeas/writefreely

  # Temporary manual override:
  # Go picks v2 by default, which writefreely doesn't seem to support yet.
  go get -u github.com/ikeikeikeike/go-sitemap-generator@v1.0.1
  go mod tidy
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  GO111MODULE=on make build
}

package() {
  install -dm750 "${pkgdir}"/var/lib/writefreely/data
  install -dm750 "${pkgdir}"/var/lib/writefreely/keys
  install -dm750 "${pkgdir}"/var/lib/writefreely/pages
  install -dm750 "${pkgdir}"/var/lib/writefreely/static
  install -dm750 "${pkgdir}"/var/lib/writefreely/templates
  install -Dm644 writefreely.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 "${pkgname}-${pkgver}"/cmd/writefreely/writefreely "${pkgdir}"/usr/bin/writefreely
  install -Dm644 writefreely-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/writefreely.conf

  # These files should probably be in /usr/share and /etc but writefreely
  # expects everything in the same directory.
  # See: https://github.com/writeas/writefreely/issues/63
  install -Dm644 config.ini "${pkgdir}"/var/lib/writefreely/config.ini
  cp -r "${pkgname}-${pkgver}"/pages/* "${pkgdir}"/var/lib/writefreely/pages
  cp -r "${pkgname}-${pkgver}"/static/* "${pkgdir}"/var/lib/writefreely/static
  cp -r "${pkgname}-${pkgver}"/templates/* "${pkgdir}"/var/lib/writefreely/templates
}

# vim: ts=2 sw=2 et:

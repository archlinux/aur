# Maintainer: VVL <me@ivvl.ru>

pkgname=casdoor
pkgver=1.538.0
pkgrel=1
pkgdesc="An open-source UI-first Identity and Access Management (IAM) / Single-Sign-On (SSO) platform"
arch=('x86_64')
url="https://github.com/casbin/casdoor"
optdepends=('postgresql: PostgreSQL database'
            'cockroachdb: CockroachDB database'
            'mariadb: MariaDB database'
            'sqlite: SQLite database'
            'nginx: reverse-proxy')
makedepends=('go>=1.21' 'yarn')
license=('Apache License 2.0')
source=("https://github.com/casbin/casdoor/archive/refs/tags/v${pkgver}.tar.gz"
        "casdoor.service"
        "casdoor.sysusers"
        "casdoor.tmpfiles")
sha512sums=('7b8e68cb644fc5dee3c2a323c3a08f46ac2aa0589b678e4212595da286b9cfdb230d76b38bba001d0c29e326c0a513c8a7d52f0acff1ac1f8830de05a09744e4'
            'c4f2d91aaab7b024fe5618054f90cb37660b59c1822f01c02817fb204cc23deb1c885da19e3424a44e89bab41a4e0765086ed4cd27bf5ad6558fd1448088dc1e'
            '2f5ec975f0b121d356f282b3101856dc1ba1ca6d3aa9b65c0ccb66d85b793472d868dda4d51f7e7cf72e7dfa4a1e1a2f90c406f6cad94ddb9dc5a81d04bc2615'
            '6a128bb89359188b8e9198acd053a4cd713a1b61a5e61b5300fa9494a38c15e8ac7e647c9dc910d51fcc77b4c9d2b24d19d00173c949b53e92964e5ed157c9ec')
backup=('etc/casdoor/casdoor.conf')
install="casdoor.install"

prepare() {
  cd "$pkgname-$pkgver"
  sed -i -e "s/configPath            = \"conf\/app.conf\"/configPath            = \"\/etc\/casdoor\/casdoor.conf\"/" object/ormer.go
  sed -i -e "s/initDataFile.*/initDataFile = \"\/etc\/casdoor\/init_data.json\"/" -e "s/frontendBaseDir.*/frontendBaseDir = \"\/usr\/share\/webapps\/casdoor\"/" conf/app.conf
}

build() {
  cd "$pkgname-$pkgver"
  go build -o bin/casdoor main.go
  cd web
  yarn install
  yarn run build
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/webapps/casdoor/"
  install -d "${pkgdir}/etc/casdoor/"
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/bin/casdoor" "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/$pkgname-$pkgver/conf/app.conf" "${pkgdir}/etc/casdoor/casdoor.conf"
  install -Dm 644 "${srcdir}/$pkgname-$pkgver/init_data.json.template" "${pkgdir}/etc/casdoor/init_data.json"
  cp -r ${srcdir}/$pkgname-$pkgver/web/build/* "${pkgdir}/usr/share/webapps/casdoor/"
  install -Dm 644 "${srcdir}/casdoor.service" "${pkgdir}/usr/lib/systemd/system/casdoor.service"
  install -Dm 644 "${srcdir}/casdoor.sysusers" "${pkgdir}/usr/lib/sysusers.d/casdoor.conf"
  install -Dm 644 "${srcdir}/casdoor.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/casdoor.conf"

}

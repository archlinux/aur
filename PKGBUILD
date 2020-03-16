# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia
pkgver=4.7.2
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
makedepends=(
  'gcc'
  'git'
  'go'
  'nodejs'
  'yarn'
)
conflicts=(
  'authelia-bin'
  'authelia-git'
)
backup=('etc/authelia/configuration.yml')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('74b4819d775dfa0e2745ebc599448dbd18776ced740c91e5d554198c274f9108')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/__BUILD_TAG__/v${pkgver}/" cmd/authelia/constants.go
  sed -i "s/__BUILD_COMMIT__/$(git rev-parse --verify v${pkgver})/" cmd/authelia/constants.go
  go build -ldflags '-w' -trimpath -o authelia cmd/authelia/*.go
  cd web
  yarn install --frozen-lockfile
  yarn build
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm700 "${srcdir}/${pkgname}-${pkgver}/config.template.yml" "${pkgdir}/etc/${pkgname}/configuration.yml"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm655 "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/web/build/." "${pkgdir}/usr/share/webapps/${pkgname}/"
}

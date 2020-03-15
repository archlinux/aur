# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia
pkgver=4.7.0
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

sha256sums=('ff7d6355a7bbbeb9352637e1daf579b7309ab79c3d8f3ffb547416eafe505f57')

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

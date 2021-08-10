# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia
pkgver=4.30.3
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

sha256sums=('928b4ae6014113a8c29848de9d03bfa7b7389aadf5091174ebfd7f78be35db76')

build() {
  export GOPATH="$srcdir/gopath" PATH="$PATH:$srcdir/gopath/bin"
  cd "$srcdir/$pkgname-$pkgver/web"
  yarn install --frozen-lockfile
  INLINE_RUNTIME_CHUNK=false yarn build
  rm -rf ../internal/server/public_html
  mv build ../internal/server/public_html
  cd ..
  cp -R api internal/server/public_html/
  sed -i "s/__BUILD_TAG__/v${pkgver}/" cmd/authelia/constants.go
  sed -i "s/__BUILD_COMMIT__/$(git rev-parse --verify v${pkgver})/" cmd/authelia/constants.go
  go build -ldflags '-w' -trimpath -o authelia cmd/authelia/*.go
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm700 "${srcdir}/${pkgname}-${pkgver}/config.template.yml" "${pkgdir}/etc/${pkgname}/configuration.yml"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

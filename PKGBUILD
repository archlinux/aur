# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia
pkgver=4.37.5
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
makedepends=(
  'curl'
  'gcc'
  'go'
  'jq'
  'nodejs'
  'yarn'
)
conflicts=(
  'authelia-bin'
  'authelia-git'
)
backup=('etc/authelia/configuration.yml')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('bb02d9b5115139e010f63e081c573a1b565d6ca1ef1f7b7cdae87d913e2adecd')

build() {
  export GOPATH="$srcdir/gopath" PATH="$PATH:$srcdir/gopath/bin" _pkgver="v${pkgver}"
  cd "$srcdir/$pkgname-$pkgver/web"

  COMMIT=$(curl -s https://api.github.com/repos/authelia/authelia/tags | jq -r '.[] | select(.name==env._pkgver) | .commit.sha')
  TAG=v${pkgver}
  STATE="tagged clean"
  DATE=$(date +"%a, %d %b %Y %R:%S %z")
  XOPTIONS="-X 'github.com/authelia/authelia/v4/internal/utils.BuildBranch=v${pkgver}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildTag=${TAG}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildCommit=${COMMIT}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildDate=${DATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildState=${STATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildNumber=AUR'"

  yarn install --frozen-lockfile --ignore-scripts
  yarn build
  cd ..
  cp -R api internal/server/public_html/
  go build -ldflags "-w ${XOPTIONS}" -trimpath -o authelia cmd/authelia/*.go
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm700 "${srcdir}/${pkgname}-${pkgver}/config.template.yml" "${pkgdir}/etc/${pkgname}/configuration.yml"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

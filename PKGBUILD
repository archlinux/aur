# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia
pkgver=4.39.15
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
  'pnpm'
)
conflicts=(
  'authelia-bin'
  'authelia-git'
)
backup=('etc/authelia/configuration.yml')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('7b0dcaf0a32684255a6e620cf79013f2cb9e40be5c416391b66e51a828d64baa')

build() {
  export GOPATH="$srcdir/gopath" PATH="$PATH:$srcdir/gopath/bin" _pkgver="v${pkgver}" CGO_CFLAGS="-O2 -pipe -fno-plt -fstack-protector-strong" CGO_CPPFLAGS="-D_FORTIFY_SOURCE=3" CGO_CXXFLAGS="-O2 -pipe -fno-plt" CGO_LDFLAGS="-Wl,-O1,-sort-common,-as-needed,-z,relro,-z,now" GOEXPERIMENT="nosynchashtriemap"
  cd "$srcdir/$pkgname-$pkgver/web"

  COMMIT=$(curl -s https://api.github.com/repos/authelia/authelia/tags | jq -r '.[] | select(.name==env._pkgver) | .commit.sha')
  TAG=v${pkgver}
  STATE="tagged clean"
  DATE=$(date +"%a, %d %b %Y %R:%S %z")
  XOPTIONS="-X 'github.com/authelia/authelia/v4/internal/utils.BuildBranch=v${pkgver}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildTag=${TAG}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildCommit=${COMMIT}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildDate=${DATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildState=${STATE}' -X 'github.com/authelia/authelia/v4/internal/utils.BuildNumber=AUR'"

  pnpm install --no-frozen-lockfile --ignore-scripts
  pnpm build
  cd ..
  cp -R api internal/server/public_html/
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -s -w ${XOPTIONS}" \
    -o authelia \
    cmd/authelia/*.go
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.sysusers.conf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.tmpfiles.config.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}-config.conf"
  install -Dm440 "${srcdir}/${pkgname}-${pkgver}/config.template.yml" "${pkgdir}/etc/${pkgname}/configuration.yml"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

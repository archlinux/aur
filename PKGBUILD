# Maintainer: Jesús Espino <jespinog@gmail.com>

pkgname=mmctl
pkgver=v6.3.0
pkgrel=1
pkgdesc="A remote CLI tool for Mattermost"
arch=('x86_64')
url="https://github.com/mattermost/mmctl"
options=('!strip')
license=('Apache')
depends=('gcc-libs')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattermost/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2287646e25bec8691b5e738fe42a5a890e2b2cdffe25221127830b797903048f')

build() {
  echo "${srcdir}"/${pkgname}-${pkgver:1}
  cd "${srcdir}"/${pkgname}-${pkgver:1}
  # Respect LDFLAGS
	go mod vendor
	go mod tidy
  EXTLDFLAGS=${LDFLAGS}
  LDFLAGS="-X \"github.com/mattermost/mmctl/commands.BuildHash=release-source-build\""
  CACHE="${srcdir}/cache" go build -trimpath -ldflags "-linkmode external -extldflags '${EXTLDFLAGS}' -s -w ${LDFLAGS}" -mod=vendor
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver:1}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver:1}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:


# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=reftools-git
_pkgname=reftools
provides=('fixplurals' 'fillstruct' 'fillswitch')
pkgver=20201119.01cf781
pkgrel=1
pkgdesc='reftools - refactoring tools for Go'
url='https://github.com/davidrjenni/reftools'
arch=('any')
license=('BSD2')
makedepends=('git' 'go')
depends=()
source=('git://github.com/davidrjenni/reftools.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fillstruct -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" ./cmd/fillstruct
  go build -o fillswitch -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" ./cmd/fillswitch
  go build -o fixplurals -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" ./cmd/fillswitch
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/fillstruct" ${pkgdir}/usr/bin/fillstruct
  install -Dm755 "${srcdir}/${_pkgname}/fillswitch" ${pkgdir}/usr/bin/fillswitch
  install -Dm755 "${srcdir}/${_pkgname}/fixplurals" ${pkgdir}/usr/bin/fixplurals
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et

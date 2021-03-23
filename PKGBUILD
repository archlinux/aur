# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=ccupdaterui
pkgname="${_pkgname}-git"
pkgver=r53.284721a
pkgrel=3
pkgdesc="Unofficial Mod Updater UI for CrossCode"
arch=(x86_64 i686)
url="https://github.com/dmitmel/CCUpdaterUI"
license=('custom:MIT')
depends=('sdl2')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/dmitmel/CCUpdaterUI.git"
        "${pkgname}-ccupdatercli::git+https://github.com/dmitmel/CCUpdaterCLI.git#branch=redesign-for-ui"
        "${pkgname}-go-vkv::git+https://github.com/20kdc/go-vkv.git"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'cb3306509846c3a770dd39f0d03a57256e251820f887850cea312f88bd982ed1')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="${srcdir}/${pkgname}-gopath"
  mkdir -p "$GOPATH"

  pushd "${srcdir}/${pkgname}" >/dev/null
  rm -rf "vendor/" "go.mod" "go.sum"
  cat > "go.mod" <<EOF
module github.com/20kdc/CCUpdaterUI
go 1.11
replace github.com/CCDirectLink/CCUpdaterCLI => ../${pkgname}-ccupdatercli
replace github.com/20kdc/go-vkv => ../${pkgname}-go-vkv
EOF
  popd >/dev/null

  pushd "${srcdir}/${pkgname}-go-vkv" >/dev/null
  rm -rf "vendor/" "go.mod" "go.sum"
  cat > "go.mod" <<EOF
module github.com/20kdc/go-vkv
go 1.11
EOF
  popd >/dev/null
}

build() {
  export GOPATH="${srcdir}/${pkgname}-gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -ldflags=-s -ldflags=-w"
  export CGO_ENABLED=1
  export GO111MODULE=on

  cd "${srcdir}/${pkgname}"
  go get -v
  go build -v
}

package() {
  export GOPATH="${srcdir}/${pkgname}-gopath"
  install -Dm755 "${GOPATH}/bin/CCUpdaterUI" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}/bindata/credits.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

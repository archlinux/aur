# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=ccupdaterui
pkgname="${_pkgname}-git"
pkgver=r53.284721a
pkgrel=1
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
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP'
            'cb3306509846c3a770dd39f0d03a57256e251820f887850cea312f88bd982ed1')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Copied from <https://github.com/archlinux/svntogit-community/blob/b138f41c77b5b911bdf6d14484163c48ea51ac0f/trunk/PKGBUILD#L37-L45>
_fake_gopath_link() {
  mkdir -p "${GOPATH}/src/${1%/*}"
  rm -f "${GOPATH}/src/${1}"
  ln -rsT "${2}" "${GOPATH}/src/${1}"
}

_fake_gopath_pushd() {
  pushd  "${GOPATH}/src/${1}" >/dev/null
}

# Copied from <https://github.com/archlinux/svntogit-community/blob/b138f41c77b5b911bdf6d14484163c48ea51ac0f/trunk/PKGBUILD#L47-L49>
_fake_gopath_popd() {
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
  export GO111MODULE=off

  _fake_gopath_link github.com/20kdc/CCUpdaterUI "${pkgname}"
  _fake_gopath_link github.com/CCDirectLink/CCUpdaterCLI "${pkgname}-ccupdatercli"

  _fake_gopath_pushd github.com/20kdc/CCUpdaterUI
  go get -v ./...
  go build -v .
  _fake_gopath_popd
}

package() {
  install -Dm755 "${GOPATH}/bin/CCUpdaterUI" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}/bindata/credits.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

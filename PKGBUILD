# Maintainer: shbernal <shbernal.01@gmail.com>

_pkgname=tsuzuri
pkgname=${_pkgname}-git
pkgver=0.3.1.r1.gca1dc0e
pkgrel=1
pkgdesc='Block-based notebook for the terminal with plain Markdown files and Vim editing'
arch=('x86_64' 'aarch64')
url='https://github.com/jaisuriya-11/tsuzuri'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('wl-clipboard: clipboard access on Wayland'
            'xclip: clipboard access on X11'
            'xdg-utils: open links'
            'zenity: file picker for attachments'
            'kdialog: file picker for attachments')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-compressdwarf=false -linkmode external -X main.version=${pkgver}" \
    -o tsuzuri ./cmd/tsuzuri
}

check() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  go test ./...
}

package() {
  cd "${_pkgname}"

  install -Dm755 tsuzuri "${pkgdir}/usr/bin/tsuzuri"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

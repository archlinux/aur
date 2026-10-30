# Maintainer: shbernal <shbernal.01@gmail.com>

pkgname=tsuzuri
pkgver=0.3.1
pkgrel=1
pkgdesc='Block-based notebook for the terminal with plain Markdown files and Vim editing'
arch=('x86_64' 'aarch64')
url='https://github.com/jaisuriya-11/tsuzuri'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('wl-clipboard: clipboard access on Wayland'
            'xclip: clipboard access on X11'
            'xdg-utils: open links'
            'zenity: file picker for attachments'
            'kdialog: file picker for attachments')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b1b9cf58e70a3e74d84eda68976213eaf1a2db8f43e08658f136057ab8bbe04')

build() {
  cd "${pkgname}-${pkgver}"

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
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 tsuzuri "${pkgdir}/usr/bin/tsuzuri"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

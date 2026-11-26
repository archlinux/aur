# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>

# Builds the tagged release from source. Named md2pdf-alchemy because
# md2pdf-git packages an unrelated project (walwe/md2pdf) that also installs
# /usr/bin/md2pdf.
#
# To release: set pkgver, run `updpkgsums`, regenerate .SRCINFO with
# `makepkg --printsrcinfo > .SRCINFO`, and push both.

pkgname=md2pdf-alchemy
_name=md2pdf
pkgver=0.3.0
pkgrel=1
pkgdesc='Convert Markdown to PDF, with customizable JSON5 styles and bundled fonts'
arch=('x86_64' 'aarch64')
url='https://github.com/alchemy/md2pdf'
# md2pdf is MIT; the fonts compiled into the binary are IBM Plex Sans and
# JetBrains Mono (OFL-1.1) and DejaVu Sans (Bitstream-Vera).
license=('MIT' 'OFL-1.1' 'Bitstream-Vera')
depends=('glibc')
provides=("${_name}=${pkgver}")
conflicts=("${_name}" 'md2pdf-git')
makedepends=('go')
options=('!debug') # debugedit cannot process Go's DWARF; the debug package would be empty
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3e61e3628cb636fe5169666845d8be2f4502460bf3905ca5a9e65089260e0567')

prepare() {
  cd "${_name}-${pkgver}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go mod download
}

build() {
  cd "${_name}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/md2pdf ./cmd/md2pdf
}

check() {
  cd "${_name}-${pkgver}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${_name}-${pkgver}"
  install -Dm755 build/md2pdf "${pkgdir}/usr/bin/${_name}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 fonts/LICENSE-*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 styles/default.json5 "${pkgdir}/usr/share/doc/${pkgname}/default-style.json5"
}

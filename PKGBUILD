# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent
_fqpn=so.libdb.${pkgname}
pkgver=0.0.39
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=(x86_64 aarch64)
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=(
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gobject-introspection
  graphene
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  libspelling
  pango
)
makedepends=(git go)
source=("git+https://github.com/diamondburned/dissent#tag=v${pkgver}")
sha256sums=('4a34d4fa6dec60c9f647ac27b54106a1092d585a7251a2c1532bc7dfc8eea640')

prepare() {
  cd "${pkgname}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -linkmode=external"
  export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
  export GOPATH="${srcdir}"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o build
}

package() {
  cd "${pkgname}"

  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "nix/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
  install -Dm644 "nix/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
  install -Dm644 "${_fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_fqpn}.metainfo.xml"

  cp -dr internal/icons/hicolor/ "${pkgdir}/usr/share/icons/"
  cp -dr internal/icons/scalable/ "${pkgdir}/usr/share/icons/hicolor/"
  cp -dr internal/icons/symbolic/ "${pkgdir}/usr/share/icons/hicolor/"
}

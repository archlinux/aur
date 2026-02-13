# Maintainer: Your Name <your-email@example.com>

_pkgname=lambda
pkgname="${_pkgname}-im-git"
pkgver=r36.713cb24
pkgrel=1
pkgdesc="Yet another XMPP client written in Go with GTK4"
arch=('x86_64' 'aarch64')
url="https://forge.sunglocto.net/sunglocto/${_pkgname}"
license=('unknown')
depends=('gtk4' 'gdk-pixbuf2')
makedepends=('go' 'git' 'gcc' 'pkg-config')
provides=("${_pkgname}-im")
conflicts=("${_pkgname}-im")

source=("${_pkgname}::git+https://forge.sunglocto.net/sunglocto/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${_pkgname}"

    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"

    # External linkmode is required for reliable GTK4 CGO linking on Arch
    go build -o "${_pkgname}" -ldflags "-linkmode=external" .
}

package() {
    cd "${_pkgname}"

    # Install Binary
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install Icon (used by the desktop entry)
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/net.sunglocto.lambda.png"

    # Generate and Install Desktop Entry
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/net.sunglocto.lambda.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Lambda
Comment=Yet another XMPP client
Exec=${_pkgname}
Icon=net.sunglocto.lambda
Categories=Network;Chat;InstantMessaging;
Terminal=false
StartupWMClass=net.sunglocto.lambda
EOF
}

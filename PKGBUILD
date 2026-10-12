# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>

pkgname=aifreeyoutube
pkgver=1.0.1
pkgrel=1
pkgdesc="Authentic human video portal filtering out AI slop, clickbait mills, and bots on YouTube"
arch=('x86_64')
url="https://github.com/chrisfair/aifreeyoutube"
license=('GPL-3.0-or-later')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'hicolor-icon-theme'
)
makedepends=(
    'go'
    'nodejs'
    'npm'
)
provides=('aifreeyoutube')
conflicts=('aifreeyoutube')

source=("$pkgname-$pkgver.tar.gz::https://github.com/chrisfair/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('384b63d9a5483cdb8fbfcf7d84907cfae9b5ae08a629bda46306b4afbfb95191')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/frontend"
    npm install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    # 1. Build frontend distribution assets
    cd frontend && npm run build && cd ..

    # 2. Build desktop application binary (WebKit2GTK 4.1)
    go build -tags "desktop,production,webkit2_41" -ldflags "-s -w" -o "build/bin/${pkgname}" .

    # 3. Build standalone background web server binary
    go build -ldflags "-s -w" -o "build/bin/${pkgname}-server" ./cmd/server
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install binaries
    install -Dm755 "build/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "build/bin/${pkgname}-server" "${pkgdir}/usr/bin/${pkgname}-server"

    # Install Freedesktop desktop launcher
    install -Dm644 "build/linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install application icons
    install -Dm644 "build/appicon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "build/appicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Install systemd service units
    install -Dm644 "packaging/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "packaging/systemd/${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

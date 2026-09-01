# Maintainer: Wasylq <wasylq@protonmail.com>
pkgname=moandrop
pkgver=0.1.2
pkgrel=1
pkgdesc='Find and share subtitles for a video by what the file is, not what it is called'
arch=('x86_64' 'aarch64')
url='https://github.com/Anastylosis/MoanDrop'
license=('GPL-3.0-only')
# Fyne's OpenGL window: cgo stays ON (unlike the sibling packages) and the
# GL/X11 runtime libraries are real dependencies.
depends=('glibc' 'libgl' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxxf86vm' 'libxkbcommon' 'wayland')
makedepends=('go>=1.25')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2a938e36f91aabe3e31a0b5dda1bd68affc24efce945e8922db417a898a5a9ba')

build() {
    cd "MoanDrop-${pkgver}"
    export CGO_ENABLED=1
    go build \
        -ldflags "-s -w -X main.version=v${pkgver} -X main.commit=aur -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        -o "${pkgname}" .
}

package() {
    cd "MoanDrop-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 contrib/linux/moandrop.desktop "${pkgdir}/usr/share/applications/moandrop.desktop"
    install -Dm644 internal/ui/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/moandrop.png"
}

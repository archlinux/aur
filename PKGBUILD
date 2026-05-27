# Maintainer: britors <rodrigo@w3ti.com.br>
pkgname=prisma4postgres-bin
pkgver=10.5.1
pkgrel=1
pkgdesc="PostgreSQL database explorer and query runner"
arch=('x86_64')
url="https://github.com/britors/Prisma4Postgres"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'libxtst')
makedepends=('librsvg')
provides=('prisma4postgres')
conflicts=('prisma4postgres')
options=('!debug' '!strip')
source=("https://github.com/britors/Prisma4Postgres/releases/download/v${pkgver}/prisma4postgres_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/britors/Prisma4Postgres/main/logo.svg")
sha256sums=('SKIP'
            'b22695b2f97a91e4995fe11fd5cd60a63522818fa49af063cfa300a75a6b3ba6')

prepare() {
    ar x "prisma4postgres_${pkgver}_amd64.deb"
}

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # ícone SVG correto
    install -Dm644 "logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/prisma4postgres.svg"

    # gera PNGs a partir do SVG, sobrescrevendo os PNGs do Electron incluídos no .deb
    for size in 16 32 48 64 128 256; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w "${size}" -h "${size}" "logo.svg" \
            -o "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/prisma4postgres.png"
    done

    # symlink no PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/Prisma4Postgres/prisma4postgres" "${pkgdir}/usr/bin/prisma4postgres"

    # chrome-sandbox precisa de setuid
    chmod 4755 "${pkgdir}/opt/Prisma4Postgres/chrome-sandbox"
}

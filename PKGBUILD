# Maintainer: Jonas Karlsson <jonaskarlsson@fripost.org>
pkgname=loap-git
pkgver=r722.ef09186
pkgrel=1
pkgdesc="Loap - A clone of the classic DOS game Lemmings 3D"
arch=('x86_64')
url="https://bitbucket.org/namida42/loap"
license=('custom')
depends=('dotnet-runtime-8.0')
makedepends=('git' 'dotnet-sdk')
source=(
    "${pkgname}::git+https://bitbucket.org/namida42/loap.git"
    "loap.desktop"
    "loap.png"
    "loap.sh"
    "0001-Fix-user-data-paths.patch"
)
md5sums=('SKIP'
         'f5d5c6b2b49c49eed14f385f9af5a107'
         'd7b7206c66535766db60ebf5b5b54b93'
         '368ce8e4c984535d092c604dfe171762'
         '7163f803cbb7fd137bb9ba1c89dc7cff')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    chmod +x "${srcdir}/loap.sh"
    cd "${srcdir}/${pkgname}"
    patch -p1 -i "${srcdir}/0001-Fix-user-data-paths.patch"
}

build() {
    cd "${srcdir}/${pkgname}/Loap"
    dotnet publish \
        -c Release \
        -r linux-x64 \
        --self-contained false
}

package() {
    install -dm755 "${pkgdir}/usr/share/loap"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cp -r "${srcdir}/${pkgname}/Loap/bin/Release/net8.0/linux-x64/publish/"* \
        "${pkgdir}/usr/share/loap/"

    install -Dm755 "${srcdir}/loap.sh" \
        "${pkgdir}/usr/bin/loap"

    install -Dm644 "${srcdir}/loap.desktop" \
        "${pkgdir}/usr/share/applications/loap.desktop"

    install -Dm644 "${srcdir}/loap.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/loap.png"
}

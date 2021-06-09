# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=sphinxchat-appimage-git
pkgver=r636.8159c4e
pkgrel=1
pkgdesc="The first platform that handles money and speech in the same protocol built on top of Bitcoin"
arch=('x86_64')
url="https://sphinx.chat/"
license=('MIT')
depends=('electron' 'zlib' 'hicolor-icon-theme')
makedepends=('npm' 'yarn' 'git')
source=("$pkgname::git+https://github.com/stakwork/sphinx-android.git"
        "update-electron-builder.patch"
       )
sha256sums=('SKIP'
            '177d18eb86f34ff261557faa06d0d6f49ca18ee110a15ac8591ca7a34387f214')
options=(!strip)

_appimage="Sphinx Chat-0.1.0.AppImage"

pkgver() {
    cd "$pkgname" || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname" || exit

    echo "Apply patch to build electron-builder on Arch"
    git apply ../update-electron-builder.patch

    # Use legacy-peer-deps because of newer npm on Arch
    echo "npm install --legacy-peer-deps"
    npm install --legacy-peer-deps
}

build() {
    cd "$pkgname" || exit

    # Following official instructions: https://github.com/stakwork/sphinx-android

    echo "npm run build"
    npm run build

    echo "package.json postinstall script: electron-builder install-app-deps --platform=linux"
    ./node_modules/.bin/electron-builder install-app-deps --platform=linux

    echo "yarn && yarn dist:linux"
    yarn && yarn dist:linux

    # Extract files
    chmod +x dist/"${_appimage}"
    ./dist/"${_appimage}" --appimage-extract

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/sphinxchat|"\
        "squashfs-root/sphinx.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/$pkgname/dist/${_appimage}" "${pkgdir}/opt/${pkgname}/sphinxchat.AppImage"
    install -Dm644 "${srcdir}/$pkgname/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/$pkgname/squashfs-root/sphinx.desktop"\
            "${pkgdir}/usr/share/applications/sphinx.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/$pkgname/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Fix Icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    ln -s "/usr/share/icons/hicolor/0x0/apps/sphinx.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sphinx.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/sphinxchat.AppImage" "${pkgdir}/usr/bin/sphinxchat"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

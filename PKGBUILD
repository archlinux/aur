# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="gdlauncher"
pkgver="1.1.11"
pkgrel=2
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
makedepends=('gendesk' 'git' 'nodejs' 'npm' 'rust')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'electron' 'p7zip')
conflicts=('gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-bin' 'gdlauncher-appimage')
provides=('gdlauncher')
source=("https://github.com/gorilla-devs/GDLauncher/archive/refs/tags/v${pkgver}.tar.gz"
        "use-system-7za-and-disable-updater.patch")
md5sums=('59a3149bd07acdc6ae4f4f9d7823034a'
         '0ccba0e195278ab1de3fec6ea0445afa')
icon_sizes=(48 128 256 1024)

prepare() {
    # Generate .desktop
    gendesk --pkgname "GDLauncher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" --categories "Application;Game" -n -f
    mv "GDLauncher.desktop" "${pkgname}.desktop"

    cd "${srcdir}/GDLauncher-${pkgver}/"

    # Apply patches, copied from ObserverOfTime's gdlauncher-git
    sed -i package.json \
        -e '/electron-updater/d;/7zip-bin/d' \
        -e 's$public/electron.js$build/electron.js$' \
        -e '/"dependencies"/i\  "bundledDependencies": ["7zip-bin"],'
    patch -p1 -i "${srcdir}/use-system-7za-and-disable-updater.patch"
    mkdir .git  # Husky needs a .git folder to not die
}

build() {
    cd "${srcdir}/GDLauncher-${pkgver}/"

    # Install required npm packages
    export CARGO_HOME="${srcdir}/cargo-cache"
    npm install --cache="${srcdir}"/npm-cache

    # Build the program
    export CI=false \
        APP_TYPE=electron \
        NODE_ENV=production \
        REACT_APP_RELEASE_TYPE=setup
    npx craco build
    npx webpack --config scripts/electronWebpackConfig.js
}

package() {
    # Copy runtime files
    install -d -m755 "${pkgdir}/usr/lib/gdlauncher/"
    rm "${srcdir}/GDLauncher-${pkgver}/build/installer"{.nsh,{Header,Sidebar}.bmp}  # Unecessary install files
    cp -r "${srcdir}/GDLauncher-${pkgver}/"{package.json,build} "${pkgdir}/usr/lib/gdlauncher/"

    # Create run script
    install -d -m755 "${pkgdir}/usr/bin/"
    printf '#!/bin/sh\nexec electron /usr/lib/gdlauncher "$@"' > "${pkgdir}/usr/bin/gdlauncher"
    chmod a+x "${pkgdir}/usr/bin/gdlauncher"

    # Desktop entry
    install -d -m755 "${pkgdir}/usr/share/applications/"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icons
    for size in "${icon_sizes[@]}"; do
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/"
        convert "${srcdir}/GDLauncher-${pkgver}/public/icon.png" -size "${size}/${size}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}

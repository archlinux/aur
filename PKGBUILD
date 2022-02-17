# Maintainer: Marie Piontek <marie@kaifa.ch>

pkgname=tidal-hifi
pkgver=2.7.2
pkgrel=1
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine."
arch=(x86_64)
url="https://github.com/Mastermindzh/tidal-hifi"
license=("custom:MIT")
depends=(libxss nss gtk3)
makedepends=(git libxcrypt-compat)
source=("${pkgname}-${pkgver}.zip::https://github.com/Mastermindzh/tidal-hifi/archive/${pkgver}.zip"
        "tidal-hifi.desktop")
md5sums=('1417f7612b6483236469732fd15b6c05'
        '234e31f93ccbdeb67f425165efe9e938')

getnvm() {
    if command -v nvm 
    then
        echo "nvm command found, using system version.."
    else

        if test -f "/usr/share/nvm/init-nvm.sh"
        then
            echo "found init-nvm.sh in /usr/share/nvm, sourcing..."
            unset npm_config_prefix
            source "/usr/share/nvm/init-nvm.sh"
        else
            echo "nvm could not be found, installing"
            unset npm_config_prefix
            folderName=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 12)
            git clone https://aur.archlinux.org/nvm.git "$folderName"
            cd "$folderName"
            makepkg -si --asdeps
            source /usr/share/nvm/init-nvm.sh
            cd ../
            rm -rf "$folderName"
        fi
    fi
}

prepare() {
    getnvm

    cd "tidal-hifi-${pkgver}"

    # use correct nodejs/npm versions
    nvm install lts/gallium
    nvm use lts/gallium

    # install build dependencies
    npm install
}

build() {
    getnvm

    cd "tidal-hifi-${pkgver}"

    # We are not using the systems Electron as we need castlab's Electron.
    npm run build-arch
}

package() {
    cd "tidal-hifi-${pkgver}"

    install -d "${pkgdir}/opt/tidal-hifi/" "${pkgdir}/usr/bin"

    cp -r dist/linux-unpacked/* "${pkgdir}/opt/tidal-hifi/"
    chmod +x "${pkgdir}/opt/tidal-hifi/tidal-hifi"

    ln -s "/opt/tidal-hifi/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"

    install -Dm644 build/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/tidal-hifi.desktop" -t "${pkgdir}/usr/share/applications"
}

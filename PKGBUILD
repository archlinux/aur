# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=cohesion-git
pkgrel=3
pkgver=1.0.5.r0.g9c3b682
pkgdesc="Notion client for Linux"
arch=(x86_64)
url="https://github.com/brunofin/cohesion"
license=("MIT")
depends=(electron libxss nss gtk3 libxcrypt-compat libnotify)
makedepends=(git jq)
provides=(cohesion)
conflicts=(cohestion)

source=("git+${url}.git")
sha512sums=('SKIP')

getnvm() {
    if command -v nvm; then
        echo "nvm command found, using system version.."
    else

        if test -f "/usr/share/nvm/init-nvm.sh"; then
            echo "found init-nvm.sh in /usr/share/nvm, sourcing..."
            unset npm_config_prefix
            source "/usr/share/nvm/init-nvm.sh"
        else
            echo "nvm could not be found, installing"
            unset npm_config_prefix
            folderName=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 12)
            git clone https://aur.archlinux.org/nvm.git "$folderName"
            cd "$folderName" || exit
            makepkg -si --asdeps
            source /usr/share/nvm/init-nvm.sh
            cd ../
            rm -rf "$folderName"
        fi
    fi
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}" || exit
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    getnvm

    cd "${srcdir}/${pkgname%-git}" || exit

    # use correct nodejs/npm versions
    nvm install lts/gallium
    nvm use lts/gallium

    # add author (needed for electron-builder linux target)
    cat package.json | jq '. += {"author": "Bruno Finger <bruno.k.finger@gmail.com>"}' | tee package.json
    # install build dependencies
    npm install
}

build() {
    getnvm

    cd "${srcdir}/${pkgname%-git}" || exit

    # We are not using the systems Electron as we need castlab's Electron.
    npm run build
}

package() {
    cd "${srcdir}/${pkgname%-git}" || exit

    install -d "${pkgdir}/opt/cohesion/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

    cp -r build/linux-unpacked/* "${pkgdir}/opt/cohesion/"
	cp -r data/icons/* "${pkgdir}/usr/share/icons/"
    chmod +x "${pkgdir}/opt/cohesion/cohesion"

    ln -s "/opt/cohesion/cohesion" "${pkgdir}/usr/bin/cohesion"

    install -Dm 644 "data/io.github.brunofin.Cohesion.desktop" "${pkgdir}/usr/share/applications/cohesion.desktop"

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/cohesion/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    ln -s "/opt/cohesion/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=cohesion-git
pkgrel=2
pkgver=r194.g6dbadfb
pkgdesc="Notion client for Linux"
arch=(x86_64)
url="https://github.com/brunofin/cohesion"
license=("MIT")
depends=(electron libxss nss gtk3 libxcrypt-compat libnotify)
makedepends=(git)
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
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    getnvm
    cd "${srcdir}/${pkgname%-git}" || exit
    nvm install lts/gallium
    nvm use lts/gallium
    npm install
}

build() {
    getnvm
    cd "${srcdir}/${pkgname%-git}" || exit
    npm run build
}

package() {
    cd "${srcdir}/${pkgname%-git}" || exit

    install -d "${pkgdir}/opt/cohesion/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"

    cp -r build/linux-unpacked/* "${pkgdir}/opt/cohesion/"
    

    chmod +x "${pkgdir}/opt/cohesion/cohesion"

    ln -s "/opt/cohesion/cohesion" "${pkgdir}/usr/bin/cohesion"

    install -Dm 644 "data/io.github.brunofin.Cohesion.desktop" "${pkgdir}/usr/share/applications/cohesion.desktop"

    install -Dm 644 "data/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-greyscale.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-greyscale.png"
    install -Dm 644 "data/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-greyscale-unread.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-greyscale-unread.png"
    install -Dm 644 "data/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion.png"
    install -Dm 644 "data/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-unread.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.brunofin.Cohesion-unread.png"

    install -Dm 644 "data/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-greyscale.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-greyscale.png"
    install -Dm 644 "data/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-greyscale-unread.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-greyscale-unread.png"
    install -Dm 644 "data/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion.png"
    install -Dm 644 "data/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-unread.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.brunofin.Cohesion-unread.png"
	
    install -Dm 644 "data/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-greyscale.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-greyscale.svg"
    install -Dm 644 "data/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-greyscale-unread.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-greyscale-unread.svg"
    install -Dm 644 "data/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion.svg"
    install -Dm 644 "data/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-unread.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.brunofin.Cohesion-unread.svg"
	
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/cohesion/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    ln -s "/opt/cohesion/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

# Maintainer: Wabuo <Spam [.] Wabuo [at] GoogleMail [.] Com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bar-lobby-git
### ↓↓↓ This needs to be set manually, the correct version will be displayed during build, update manually if needed!
_electronver=37
### ↑↑↑ This sadly cant be done automatically
pkgver=VERSION
pkgrel=1
pkgdesc="The new - stil Work_In_Progres lobby, for the RTS game Beyond All Reason (Github version)."
arch=('x86_64')
url="https://beyond-all-reason.github.io/bar-lobby/"
_ghurl="https://github.com/beyond-all-reason/bar-lobby"
### Only use _tag or _git_commit never use both at the same time! Default is neither to build latest master.
#_tag="#tag=v0.15.1"
#_git_commit='#commit=2bf7e22d2792236377c218f8c06e27ded2984f81'
### https://github.com/beyond-all-reason/bar-lobby/releases/latest

license=(
    'MIT'
    'CC-BY-NC-ND-4.0'
    'CC-BY-3.0'
    'CC-BY-SA-3.0'
    'CC0-1.0'
    'ISC'
    'OFL-1.0'
    'Unlicense'
    'LicenseRef-custom'
)
#conflicts=("${pkgname%-git}") # Not needed multiple versions can be installed beside each other
provides=("${pkgname}")
depends=("electron${_electronver}" 'devil' 'python-py7zr' )
makedepends=('git' 'npm' 'nvm' 'sed' )
optdepends=('recoil-engine-rc')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${_ghurl}.git${_tag}${_git_commit}"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.install"
)
install="${pkgname%-git}.install"
sha256sums=('SKIP'
            'a2fc4b255be99cb528864e8af6351deba9a373a453f7ad453aa2749c2a285e03'
            'ac8154641054d406626a2ff2e0a55ddf533007435d7bf472fd2df98ebc9779fd')


pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_get_electron_version() {
    _electronversion="$(strings "squashfs-root/${pkgname%-git}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    if [ "$_electronver" != "$_electronversion" ]; then
        echo -e "\033[1;31mWARNING: \033[1;33mThe electron version this PKGBUILD depends on  \033[0m(\033[1;36m${_electronver}\033[0m)\033[1;33m does not match the one required by ${pkgname} \033[0m(\033[1;36m${_electronversion}\033[0m)"
        echo -e "\033[1;32mINFO: \033[0mPlease update the PKGBUILD to depend on the correct electron version! \033[0m"
        echo -e "\033[1;32mINFO: \033[0mPlease mark this package as out of date on the AUR web page, so that it can be fixed for everyone\033[0m"
        echo -e "\033[1;32mINFO: \033[0mPlease set\033[1;32m _electronver=\033[1;36m${_electronversion}\033[0m"
        exit 1
    else
        echo -e "\033[1;32mINFO: \033[1;33mThe electron version is: \033[1;36m${_electronversion}\033[0m"
    fi
}

_ensure_local_nvm() {
    ## let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    ## The init script returns 3 if version specified
    ## in ./.nvmrc is not (yet) installed in $NVM_DIR
    ## but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

build() {
cd "${pkgname%-git}"

    _ensure_local_nvm
    nvm install
    npm install
    #npm run package
    #npm run build:unpack
    #npm run build:linux
    npm run buildall:linux


}

package() {
    _prepare() {

        chmod +x BeyondAllReason-*.AppImage

        ./*.AppImage --appimage-extract > /dev/null
        _get_electron_version


        _appimgname=$( find *.AppImage)
        echo -e "AppImage_Name is:  \033[1;32m${_appimgname}\033[0m"
        sed -i -e "
            s/@appimgname@/${_appimgname}/g
            s/@electronversion@/${_electronversion}/g
            s/@appname@/${pkgname}/g
            s/@runname@/app.asar/g
            s/@cfgdirname@/${_pkgname}/g
            s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
        " "${srcdir}/${pkgname%-git}.sh"


        sed -i "s/AppRun --no-sandbox/${pkgname%-git}/g" "squashfs-root/${pkgname%-git}.desktop"

        find "squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +

        rm -rf "squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
        ln -sf "/usr/bin/7za" "squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
    }

    _install() {
        install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm644 "squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
        cp -Pr --no-preserve=ownership "squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
        install -Dm644 "squashfs-root/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname}.desktop"
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

        cd "${srcdir}/${pkgname%-git}"/LICENSES
        install -Dm644 "CC-BY-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-3.0.txt"
        install -Dm644 "CC-BY-NC-ND-4.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-NC-ND-4.0.txt"
        install -Dm644 "CC-BY-SA-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-SA-3.0.txt"
        install -Dm644 "CC0-1.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC0-1.0.txt"
        install -Dm644 "ISC.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ISC.txt"
        install -Dm644 "LicenseRef-IFOPE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-IFOPE.txt"
        install -Dm644 "LicenseRef-UNKNOWN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-UNKNOWN.txt"
        install -Dm644 "MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
        install -Dm644 "OFL-1.1.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-OFL-1.1.txt"
        install -Dm644 "Unlicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Unlicense.txt"
        }


   cd "${pkgname%-git}"/dist/

    _prepare

    _install


}

# vim:set ts=4 sw=4 et:

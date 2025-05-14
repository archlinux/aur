# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-git
_pkgname=Mailspring
pkgver=1.15.1.r1.g3cde64f
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="A beautiful, fast and fully open source mail client.(Use system-wide electron)"
arch=('x86_64')
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'db5.3'
    'openssl-1.0'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'curl'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto --password-store=\"gnome-libsecret\"/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        sed -i "s/github.com/github.moeyy.xyz\/https:\/\/github.com/g" .gitmodules
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/, 'create-rpm-installer'//g" app/build/Gruntfile.js
    sed -i "s/execstack --clear-execstack//g" app/script/mkdeb
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    git submodule update --depth=1 --init --recursive
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     npm run build
    sed "s/${_pkgname}.desktop/${pkgname%-git}.desktop/g" -i app/dist/"${pkgname%-git}".appdata.xml
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/dist/${pkgname%-git}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/app/dist/${pkgname%-git}-linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    _icon_sizes=(16 32 64 128 256 512)
    for _icon_size in "${_icon_size[@]}"; do
        install -Dm644 "${srcdir}/${pkgname//-/.}/app/build/resources/linux/icons/${_icon_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon_size}x${_icon_size}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/dist/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/dist/${pkgname%-git}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
}
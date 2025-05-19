# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=horen-git
pkgver=perfect.lyric.r4.g86d4052
_electronversion=28
_nodeversion=20
pkgrel=1
pkgdesc="A music player by Electron.(Use system-wide electron)"
arch=('any')
url="https://github.com/horenjs/horen"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}-${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'pnpm'
    'nvm'
    'curl'
    'imagemagick'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
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
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    magick preview/"${pkgname%-git}.ico" preview/"${pkgname%-git}.png"
    sed -i "s/${pkgname%-git}\.ico/${pkgname%-git}\.png/g" forge.config.js
    sed -i "s/process\.env\.APPDATA/\'\/home\/${USER}\'/g" app/main/src/constant.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install
    NODE_ENV=development    pnpm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i '/makers: \[/i\
	plugins: [\
		{\
			name: "@electron-forge/plugin-local-electron",\
			config: {\
				electronPath: "'"${electronDist}"'"\
			}\
		}\
	],' forge.config.*
    NODE_ENV=production     pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/out/${pkgname%-git}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/preview/${pkgname%-git}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/out/${pkgname%-git}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
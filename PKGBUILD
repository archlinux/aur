# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: Bet4 <0xbet4@gmail.com>
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk
pkgname=hyper-git
_pkgname=Hyper
pkgver=4.0.0.canary.5.r405.g2a7bb18
_electronversion=22
_nodeversion=18
pkgrel=1
pkgdesc="A terminal built on web technologies."
arch=('any')
url="https://hyper.is/"
_ghurl="https://github.com/vercel/hyper"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'nodejs'
    "electron${_electronversion}"
)
makedepends=(
    'git'
    'npm'
    'yarn'
    'nvm'
    'libarchive'
    'libicns'
    'icoutils'
    'python'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
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
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="System" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "/registry.npmjs.org/d" ".yarnrc"
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g;s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    icotool -i 5 -x build/canary.ico -o "${pkgname%-git}.png"
    sed -i "51i\    fs.mkdirSync(pathToElectron, { recursive: true });" bin/cp-snapshot.js
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config=electron-builder.json
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chromedriver chromedriver.debug chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/${pkgname//-/.}/dist/linux-"*/"${_files}"
	done
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-git}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/dist/linux-"*/* "${pkgdir}/usr/lib/${pkgname%-git}"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
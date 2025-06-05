# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=udb-git
_pkgname=UDB
pkgver=0.0.2.r4.gba44cda
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="An open-source, multi-agent based modern database management tool.(Use system-wide electron)"
arch=('x86_64')
url="https://github.com/udb-org/udb-app"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "jdk21.0.2.tar.gz::https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz"
    "${pkgname%-git}-${pkgver%.r*}.jar::https://github.com/udb-org/udb-java/releases/download/${pkgver%.r*}/${pkgname%-git}-java-${pkgver%.r*}.jar"
    "${pkgname%-git}.sh"
)
noextract=("jdk21.0.2.tar.gz")
sha256sums=('SKIP'
            'a2def047a73941e01a73739f92755f86b895811afb1f91243db214cff5bdac3f'
            'f11e4cd5bd776b4907713dc92c3b6bc362567c01a534301efe91f652fcaf06e0'
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
        --categories="Development;Database" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
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
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "/height: 800,/a\    icon: path.join(__dirname, '../../../icons/logo.png')," src/main.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \'${electronDist}\',\\
        },\\
    }," forge.config.*
    sed -i "s/icons\/icon/icons\/logo.png/g" forge.config.*
    sed -i '/asar: true,/a\    extraResource: ["icons"],' forge.config.*
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/out/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/out/${_pkgname}-linux-x64/resources/icons" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/icons/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/home/${USER}/.${pkgname%-git}/server/"{jar,java}
    install -Dm644 "${srcdir}/${pkgname%-git}-${pkgver%.r*}.jar" "${pkgdir}/home/${USER}/.${pkgname%-git}/server/jar/${pkgname%-git}.jar"
    bsdtar -xf "${srcdir}/jdk21.0.2.tar.gz" -C "${pkgdir}/home/${USER}/.${pkgname%-git}/server/java"
    mv "${pkgdir}/home/${USER}/.${pkgname%-git}/server/java/jdk-21.0.2" "${pkgdir}/home/${USER}/.${pkgname%-git}/server/java/jdk-21.0.2.jdk"
    chown -R "${USER}:${USER}" "${pkgdir}/home/${USER}/.${pkgname%-git}"
}
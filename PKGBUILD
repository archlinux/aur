# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pdf-guru-anki-git
_pkgname='PDF Guru'
pkgver=latest.r8.gf67a40f
_nodeversion=20
pkgrel=1
pkgdesc="A PDF-centric multi-functional office learning toolbox software, including four major functions: PDF practical toolbox, Anki card creation artifact, Anki strongest assistant, video note artifact."
arch=('any')
url="https://guru.kevin2li.top/"
_ghurl="https://github.com/kevin2li/PDF-Guru"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'python'
    'pandoc-cli'
    'tesseract'
    'python-pymupdf'
    'python-pillow'
    'python-tqdm'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'go'
    'python-pip'
    'wails'
    'pyinstaller'
    'upx'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git}"
    install -dm755 build/bin
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
    go mod tidy
    cd "${srcdir}/${pkgname%-git}.git/frontend"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    NODE_ENV=development    npm install --legacy-peer-deps
    cd "${srcdir}/${pkgname%-git}.git/thirdparty"
    python -m venv ./
    ./bin/pip install -r requirements.txt
    pyinstaller -F -w pdf.py
    cp dist/pdf "${srcdir}/${pkgname%-git}.git/build/bin/"
    cp ocr.py "${srcdir}/${pkgname%-git}.git/build/bin/"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i "/frontend:install/d" wails.json
    wails build -upx -ldflags "-s -w"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/build/bin/"{pdf,"${_pkgname}"} -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/bin/ocr.py" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-git}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    touch "${pkgdir}/usr/lib/${pkgname%-git}/config.json"
    chmod 666 "${pkgdir}/usr/lib/${pkgname%-git}/config.json"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
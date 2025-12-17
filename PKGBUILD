# Maintainer: Levi Zim <rsworktech at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=affine
_pkgname=AFFiNE
pkgver=0.25.7
_electronversion=36
pkgrel=1
pkgdesc="There can be more than Notion and Miro. AFFiNE is a next-gen knowledge base that brings planning, sorting and creating all together. Privacy first, open-source, customizable and ready to use."
arch=('x86_64')
url="https://affine.pro/"
_ghurl="https://github.com/toeverything/AFFiNE"
license=(
    'LicenseRef-custom'
    'MIT'
)
provides=("${pkgname}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    # https://github.com/toeverything/AFFiNE/blob/canary/docs/BUILDING.md#prerequisites
    # Keep nodejs the first as we might replace it later.
    nodejs yarn
    # node gyp
    python
    # electron-packager
    zip unzip
    # Rust
    cargo
    # Misc
    git jq
)
source=(
    "${_pkgname}::git+https://github.com/toeverything/AFFiNE#tag=v${pkgver}"
    "${pkgname}.sh"
    "${pkgname}.desktop"
)
sha256sums=('53af0d30f63e0b5ab69352511d35da61173837a54f2a6aa8ab8ebbedf690d67d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980'
            '18724474ab2351ed00965f9fe9adea04967458dec810866b572cf44ca8185b5b')

case "${CARCH}" in
    x86_64)
        _arch=x64
        ;;
    *)
        _arch="${CARCH}"
esac

# Allow using unsupported node.js versions
if [[ -n "$NODEJS" ]]; then
    makedepends[0]="$NODEJS"
fi

_ensure_nodejs() {
    if [[ "$NODEJS" == "nvm" ]]; then
        # let's be sure we are starting clean
        which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
        export NVM_DIR="${srcdir}/.nvm"

        # The init script returns 3 if version specified
        # in ./.nvmrc is not (yet) installed in $NVM_DIR
        # but nvm itself still gets loaded ok
        source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

	if [[ "$1" == "install" ]]; then
            nvm install 22
        fi
    fi
}

prepare() {
    _ensure_nodejs install
    cd "$_pkgname"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 ELECTRON_SKIP_BINARY_DOWNLOAD=1 SENTRYCLI_SKIP_DOWNLOAD=1
    _electron_pkg_ver="$(jq -r .devDependencies.electron package.json | tr -d '^' | cut -d. -f1)"
    if [[ "$_electronversion" -ne "$_electron_pkg_ver" ]]; then
        echo "Electron version ${_electronversion} does not match ${_electron_pkg_ver} in package.json"
	exit 1
    fi
    yarn install
}

build() {
    _ensure_nodejs
    # https://github.com/toeverything/AFFiNE/blob/canary/docs/building-desktop-client-app.md
    cd "$_pkgname"
    # https://github.com/toeverything/AFFiNE/blob/v0.18.2/.github/actions/setup-version/action.yml
    export APP_VERSION="${pkgver}"
    ./scripts/set-version.sh $APP_VERSION
    CFLAGS+=' -ffat-lto-objects' # https://github.com/launchbadge/sqlx/issues/3149
    yarn affine @affine/native build
    export BUILD_TYPE=stable
    SKIP_NX_CACHE=1 yarn affine @affine/electron generate-assets
    yarn config set nmMode classic
    yarn config set nmHoistingLimits workspaces
    find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
    yarn install
    SKIP_WEB_BUILD=1 SKIP_BUNDLE=1 HOIST_NODE_MODULES=1 DEBUG='*' yarn affine @affine/electron make --platform=linux --arch="${_arch}"
    unzip packages/frontend/apps/electron/out/stable/make/zip/linux/${_arch}/${_pkgname}-linux-${_arch}-${pkgver}.zip
}

package() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cd "$_pkgname/${_pkgname}-linux-${_arch}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r resources/* "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "../LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "../packages/frontend/apps/electron/resources/icons/icon_stable_64x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

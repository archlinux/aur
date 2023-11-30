# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=httptoolkit
pkgver=1.14.8
pkgrel=2
epoch=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.tech/"
license=('GPL3')

# ci.yml specifies node 18 as of version 1.14.3
_node_version=18

# package.json specifies electron 22.3.24 as of version 1.14.3
_electron_version=22

depends=("electron${_electron_version}" python)
makedepends=(git nvm)
checkdepends=()
optdepends=()

provides=()
conflicts=(httptoolkit-bin)
replaces=()
backup=()
options=()
install=
changelog=
_pkgrepo="https://github.com/httptoolkit/httptoolkit-desktop"
source=("${pkgname}::git+${_pkgrepo}.git#tag=v${pkgver}"
        'httptoolkit.desktop')
noextract=()
md5sums=('SKIP'
         'faf640796c9ad59c3fe56dac09b19767')
validpgpkeys=()

_ensure_local_nvm() {
    if type nvm &>/dev/null; then
        nvm deactivate
        nvm unload
    fi
    unset npm_config_prefix
    export NVM_DIR=${srcdir}/.nvm
    . /usr/share/nvm/init-nvm.sh
}

prepare() {
    cd "${srcdir}/${pkgname}"
    _ensure_local_nvm
    nvm ls "$_node_version" &>/dev/null ||
        nvm install "$_node_version"
    nvm exec "$_node_version" \
        npm install --no-save --no-audit --no-progress --no-fund
}

build() {
    cd "${srcdir}/${pkgname}"
    _ensure_local_nvm
    nvm exec "$_node_version" npm run build:src
    nvm exec "$_node_version" npm run build:electron -- \
        -c.electronDist=/usr/lib/electron${_electron_version} \
        -c.electronVersion="$(cat /usr/lib/electron${_electron_version}/version)" \
        --linux dir
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/licenses"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    cp "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/opt/${pkgname}/icon.png"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    _electron=${pkgdir}/opt/${pkgname}/${pkgname}
    echo "Deleting Electron binary ($(du -h "$_electron" | awk '{print $1}'))"
    rm -v "$_electron"
    install -m755 /dev/null "${pkgdir}/usr/bin/${pkgname}"
    cat >"${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec electron${_electron_version} /opt/${pkgname}/resources/app.asar "\$@"
EOF
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i "s|$srcdir||g"
}

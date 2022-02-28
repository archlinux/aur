# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname=httptoolkit-git
_pkgname=httptoolkit
pkgver=v1.7.0.r0.g871e047
pkgrel=1
epoch=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.tech/"
license=('GPL3')
depends=(electron14 python)
makedepends=(git nvm)
provides=(httptoolkit)
conflicts=(httptoolkit-bin)
source=("${pkgname}::git+https://github.com/httptoolkit/httptoolkit-desktop.git"
    'httptoolkit.desktop')
md5sums=('SKIP'
    'faf640796c9ad59c3fe56dac09b19767')

# ci.yml specifies node 14, but lockfileVersion@2 implies npm 7 / node 15
_node_version=15

_ensure_local_nvm() {
    if type nvm &>/dev/null; then
        nvm deactivate
        nvm unload
    fi
    unset npm_config_prefix
    export NVM_DIR=${srcdir}/.nvm
    . /usr/share/nvm/init-nvm.sh
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
        -c.electronDist=/usr/lib/electron14 \
        -c.electronVersion="$(cat /usr/lib/electron14/version)" \
        --linux dir
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/licenses"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${_pkgname}"
    cp "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/opt/${_pkgname}/icon.png"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
    _electron=${pkgdir}/opt/${_pkgname}/${_pkgname}
    echo "Deleting Electron binary ($(du -h "$_electron" | awk '{print $1}'))"
    rm -v "$_electron"
    install -m755 /dev/null "${pkgdir}/usr/bin/${_pkgname}"
    cat >"${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec electron14 /opt/${pkgname}/resources/app.asar "\$@"
EOF
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i "s|$srcdir||g"
}

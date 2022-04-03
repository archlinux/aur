# Maintainer: Luke Arms <luke@arms.to>

pkgname=stretchly
pkgver=1.10.0
pkgrel=2
pkgdesc="The break time reminder app"
arch=('i686' 'x86_64')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3' 'libxcrypt-compat' 'electron17')
makedepends=('git' 'nvm' 'jq' 'python')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("https://github.com/hovancik/stretchly/archive/v${pkgver}.tar.gz")

sha256sums=('cc01383ef15fe56662cc143e7ac89dd07e10bdd68e963d79229a0643f978b815')

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
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _node_version=$(jq -r '.engines.node' package.json)
    # Don't create an asar package
    local TEMP
    TEMP=$(mktemp)
    jq '.build.asar = false' package.json >"$TEMP"
    cp "$TEMP" package.json
    rm -f "$TEMP"
    # ` || false` is a workaround until this upstream fix is released:
    # https://github.com/nvm-sh/nvm/pull/2698
    nvm ls "$_node_version" &>/dev/null ||
        nvm install "$_node_version" || false
    nvm use "$_node_version"
    npm install --no-save --no-audit --no-progress --no-fund
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    nvm use "$_node_version"
    # electron-builder only generates /usr/share/* assets for target package
    # types 'apk', 'deb', 'freebsd', 'p5p', 'pacman', 'rpm' and 'sh', so build a
    # pacman package and unpack it
    local _outfile _appname _electron _unpackdir=${srcdir}/${pkgname}-${pkgver}.unpacked
    _outfile=dist/$(jq -r '"\(.name)-\(.version)"' package.json).pacman
    _appname=$(jq -r .name package.json)
    _electron=${_unpackdir}/opt/${_appname}/${pkgname}
    rm -Rf "${_unpackdir}"
    mkdir -p "${_unpackdir}"
    local i686=ia32 x86_64=x64
    ./node_modules/.bin/electron-builder build \
        --linux pacman \
        --"${!CARCH}" \
        -c.electronDist=/usr/lib/electron17 \
        -c.electronVersion="$(</usr/lib/electron17/version)"
    tar -C "${_unpackdir}" -Jxf "${_outfile}"

    echo "Deleting Electron ($(du -h "$_electron" | awk '{print $1}'))..." >&2
    rm -v "$_electron"

    # Replace absolute path in desktop entry
    sed -Ei "s/^(Exec=).*/\1stretchly/" \
        "${_unpackdir}/usr/share/applications/${pkgname}.desktop"

    # Create /usr/bin/stretchly
    install -D -m 0755 /dev/null "${_unpackdir}/usr/bin/stretchly"
    cat >"${_unpackdir}/usr/bin/stretchly" <<EOF
#!/bin/sh
exec electron17 '/usr/lib/$(sed -E "s/'/'\\\\''/g" <<<"${_appname}")/' "\$@"
EOF
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local _appname
    _appname=$(jq -r .name package.json)
    rm -rf "${pkgdir:?}/usr"
    mv "${srcdir}/${pkgname}-${pkgver}.unpacked/usr" "${pkgdir}/"
    install -d "${pkgdir}/usr/lib"
    mv "${srcdir}/${pkgname}-${pkgver}.unpacked/opt/${_appname}/resources/app" "${pkgdir}/usr/lib/${_appname}"
    install -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: xeruf <27jf at pm dot me>

_electron_version=19
_pkgname=stretchly
pkgname=${_pkgname}-xeruf-git
pkgver=1239.537339b
pkgrel=1
pkgdesc="The break reminder app with more restrictive menus"
arch=('i686' 'x86_64')
url="https://github.com/xeruf/${_pkgname}"
license=('BSD')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 'util-linux-libs' 'libsecret' 'libappindicator-gtk3' 'libxcrypt-compat' "electron$_electron_version")
makedepends=('git' 'nvm' 'jq' 'python')
provides=("$_pkgname")
source=("git+${url}.git")
conflicts=("$_pkgname" "${_pkgname}-bin")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
    cd "${srcdir}/${_pkgname}"
    _ensure_local_nvm
    _node_version=$(jq -r '.engines.node' package.json)
    # ` || false` is a workaround until this upstream fix is released:
    # https://github.com/nvm-sh/nvm/pull/2698
    nvm ls "$_node_version" &>/dev/null ||
        nvm install "$_node_version" || false
}

build() {
    cd "${srcdir}/${_pkgname}"
    _ensure_local_nvm
    nvm use "$_node_version"
    npm install --no-save --no-audit --no-progress --no-fund
    # electron-builder only generates /usr/share/* assets for target package
    # types 'apk', 'deb', 'freebsd', 'p5p', 'pacman', 'rpm' and 'sh', so build a
    # pacman package and unpack it
    local _appname _appver _outfile _unpackdir=${srcdir}/${_pkgname}.unpacked
    _appname=$(jq -r '.name' package.json)
    _appver=$(jq -r '.version' package.json)
    _outfile=dist/${_appname}-${_appver}.pacman
    rm -rf "${_unpackdir}"
    mkdir -p "${_unpackdir}"

    local i686=ia32 x86_64=x64
    # Add -c.asar=false to suppress creation of an app archive
    ./node_modules/.bin/electron-builder build \
        --linux pacman \
        --"${!CARCH}" \
        -c.electronDist="/usr/lib/electron$_electron_version" \
        -c.electronVersion="$(<"/usr/lib/electron$_electron_version/version")"
    tar -C "${_unpackdir}" -xf "${_outfile}"

    # Replace absolute path in desktop entry
    sed -Ei "s/^(Exec=).*/\1\\/usr\\/bin\\/${_pkgname} %U/" \
        "${_unpackdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    local _appname _appdir _appfile=
    _appname=$(jq -r '.name' "${srcdir}/${_pkgname}/package.json")
    _appdir=opt/${_appname}/resources/app
    cd "${srcdir}/${_pkgname}.unpacked"
    mv "usr" "${pkgdir}/"
    install -d "${pkgdir}/usr/lib"
    [[ -d $_appdir ]] || {
        _appdir=${_appdir%/*}
        _appfile=/app.asar
    }
    mv "$_appdir" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<END
#!/bin/sh
exec /usr/lib/electron${_electron_version}/electron /usr/lib/$_pkgname$_appfile "\$@"
END
}

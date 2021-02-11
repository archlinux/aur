# Maintainer: Luke Arms <luke@arms.to>

pkgname=stretchly-git
_pkgname=${pkgname%-git}
pkgver=818.b2182ad
pkgrel=1
pkgdesc="The break time reminder app"
arch=('any')
url="https://github.com/hovancik/stretchly/"
license=('BSD')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3' 'electron9')
makedepends=('git' 'npm' 'jq')
source=("git+https://github.com/hovancik/stretchly.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf '%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    npm install electron@"$(cat /usr/lib/electron9/version)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    # electron-builder only generates /usr/share/* assets for target package
    # types 'apk', 'deb', 'freebsd', 'p5p', 'pacman', 'rpm' and 'sh', so build a
    # pacman package and unpack it
    local _unpackdir=${srcdir}/${_pkgname}.unpacked _outfile
    rm -Rf "${_unpackdir}"
    mkdir -p "${_unpackdir}"
    _outfile=dist/$(jq -r '"\(.name)-\(.version)"' package.json).pacman
    npx electron-builder build --linux pacman \
        -c.electronDist=/usr/lib/electron9 \
        -c.electronVersion="$(cat /usr/lib/electron9/version)"
    tar -C "${_unpackdir}" -Jxf "${_outfile}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    local _unpackdir=${srcdir}/${_pkgname}.unpacked _appname
    _appname=$(jq -r .name package.json)
    # Delete electron binary
    rm "${_unpackdir}/opt/${_appname}/${_pkgname}"
    # Replace absolute path in desktop entry
    sed -Ei "s/^(Exec=).*/\1stretchly/" \
        "${_unpackdir}/usr/share/applications/${_pkgname}.desktop"
    # Create /usr/bin/stretchly
    install -D -m 0755 /dev/null "${_unpackdir}/usr/bin/stretchly"
    cat >"${_unpackdir}/usr/bin/stretchly" <<EOF
#!/bin/sh
exec electron9 /opt/$(printf '%q' "${_appname}")/resources/app.asar "\$@"
EOF
    # Move everything into place
    mv "${_unpackdir}/"{usr,opt} "${pkgdir}"
    install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

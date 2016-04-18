# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=keeweb-git
_pkgname=keeweb
pkgver=1.1.2.1.g5553b10
pkgrel=1
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/antelle/keeweb"
license=('MIT')
depends=('electron' 'xdg-utils' 'sh')
makedepends=('nodejs-grunt' 'npm' 'sed' 'patch')
provides=("${_pkgname}" "${_pkgname}-desktop")
conflicts=("${_pkgname}" "${_pkgname}-desktop")
source=('git+https://github.com/antelle/keeweb.git'
        'app.js.patch')
sha1sums=('SKIP'
          '6ead549d69231890a76ae7531fb03637fccb942a')
_desktop="${_pkgname}.desktop"

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=Keeweb
Comment=KeePass web app
Exec=/usr/bin/${_pkgname}
Icon=/usr/share/${_pkgname}/electron/icon.png
Categories=Utility;
Terminal=false
StartupNotify=true
Version=${pkgver}
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
electron /usr/share/${_pkgname}/electron --htmlpath=/usr/share/${_pkgname}/html \$*
EOF
}

build() {
    cd ${_pkgname}
    # skip electron installation
    sed -i 's/^.*"electron-builder".*$//;s/^.*"grunt-electron".*$//;s/postinstall/_pi/' package.json
    npm install
    grunt --force
}

package() {
    cd "${_pkgname}"
    find ./{electron,tmp} -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${_pkgname}/{}" \;
    mv "${pkgdir}/usr/share/${_pkgname}/"{tmp,html}
    # auto hide menubar
    patch "${pkgdir}/usr/share/${_pkgname}/electron/app.js" < "${srcdir}/app.js.patch"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}


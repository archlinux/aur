# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=mancy-git
_pkgname=mancy
pkgver=3.0.0.26.g03d7972
pkgrel=1
pkgdesc=">_ Electron based NodeJS REPL."
arch=('any')
url="https://github.com/princejwesley/Mancy"
license=('MIT')
depends=('electron' 'xdg-utils' 'sh')
makedepends=('npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::'git+https://github.com/princejwesley/Mancy.git')
sha1sums=('SKIP')
options=('!strip')
_desktop="${_pkgname}.desktop"

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=Mancy
Comment=>_ Electron based NodeJS REPL.
Exec=/usr/bin/${_pkgname}
Icon=/usr/share/${_pkgname}/icons/mancy.png
Categories=Utility;
Terminal=false
StartupNotify=true
Version=${pkgver}
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
electron /usr/share/${_pkgname} \$*
EOF
}

build() {
    cd ${_pkgname}
    _electronver="\'$(pacman -Q --color=never electron | awk '{print $2}' | awk -F '-' '{print $1}')\'"
    sed -i 's/^.*"electron-prebuilt".*$//;s/^.*"electron-rebuild".*$//;s/^.*"electron-packager".*$//;s/^.*"postinstall".*$//' package.json
    sed -i 's/^import Electron.*$//' gulpfile.babel.js
    sed -i 's/^\(const electronVersion =\).*$/\1 '${_electronver}'/' gulpfile.babel.js
    npm install
    npm run build
    sed -i '/^.*resizable: true,$/a autoHideMenuBar: true,' ./build/main/index.js
}

package() {
    cd "${_pkgname}/build"
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -a ./ "${pkgdir}/usr/share/${_pkgname}/"
    cd ..
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}


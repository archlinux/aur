# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro
_tagname=0.8.55
pkgver=${_tagname//-/_}
pkgrel=4
pkgdesc="A powerful automotive ECU development tool Easy of use, Cross platform, Multi dongle, Powerful script ability, CLI support"
arch=(x86_64)
url="https://github.com/ecubus/EcuBus-Pro"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    electron
    gcc-libs
    glibc
)
makedepends=(
    git
    npm
    poppler
    ghostscript
    node-gyp
    nodejs
    python
)
optdepends=(
    "python-doipclient: A Diagnostic over IP (DoIP) client implementing ISO-13400-2."
    "python-udsoncan: Implementation of the Unified Diagnostic Service (UDS) protocol (ISO-14229) used in the automotive industry."
)
backup=()
options=(!debug !strip)
install=
source=("${pkgname}::git+${url}.git#tag=v${_tagname}")
sha256sums=('fd4fe1f1ff396c1c2dc8d4beec54942e4e677171353e73fc3d57683d26b3f862')
# noextract=("${pkgname}-${_tagname}.tar.gz")

_pkgname=EcuBus-Pro
prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd ${srcdir}/${pkgname}/
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >>npmrc
    npm ci
}

build() {
    cd ${srcdir}/${pkgname}/
    npm run docan
    npm run dolin
    npm run someip
    npm run worker
    npm run api
    npm run cli:build:linux
    npm run build:unpack
}

package() {
    cd ${srcdir}/${pkgname}/
    install -dm0755 "${pkgdir}/usr/lib/${pkgname}/"

    cp -r dist/linux-unpacked/locales ${pkgdir}/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources ${pkgdir}/usr/lib/${pkgname}
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/ecubus-pro.desktop" <<EOF
[Desktop Entry]
Name=EcuBus-Pro
Exec=ecubus-pro %U
Terminal=false
Type=Application
Icon=ecubus-pro
StartupWMClass=EcuBus-Pro
Comment=EcuBus-Pro
Categoried=Development
Categories=Development;
EOF
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname} <<EOF
#!/bin/sh

exec electron /usr/lib/ecubus-pro/resources/app.asar "\$@"
EOF
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/ecb_cli <<EOF
#!/bin/sh

cd /usr/lib/ecubus-pro/resources/app.asar.unpacked/resources/lib/

./ecb_cli "\$@"
EOF
    install -Dm0644 build/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    #	for size in 16 32 48 64 128 256 512; do
    #    install -Dm644 "public/icons/${size}x${size}.png" \
    #      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ecubus-pro.png"
    #  done
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

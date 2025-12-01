# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro
pkgver=0.8.57
pkgrel=1
pkgdesc="A powerful automotive ECU development tool Easy of use, Cross platform, Multi dongle, Powerful script ability, CLI support"
arch=(x86_64)
url="https://github.com/ecubus/EcuBus-Pro"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    electron
    gcc-libs
    glibc
    python
)
makedepends=(
    git
    npm
    poppler
    ghostscript
    node-gyp
    nodejs
)
optdepends=(
    "python-doipclient: A Diagnostic over IP (DoIP) client implementing ISO-13400-2."
    "python-udsoncan: Implementation of the Unified Diagnostic Service (UDS) protocol (ISO-14229) used in the automotive industry."
)
backup=()
options=(!debug !strip)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f5217d74fb4d03cda0565127d412326e0d34094c576d77a195b952f817268c25')
# noextract=("${pkgname}-${pkgver}.tar.gz")

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
    npm run native
    npm run worker
    npm run api
    npm run cli:build:linux
    npm run build:unpack
}

package() {
    cd ${srcdir}/${pkgname}/
    install -dm0755 "${pkgdir}/usr/lib/${pkgname}/"
    rm -rf dist/linux-unpacked/resources/bin/esbuild{.exe,_mac}
    cp -R dist/linux-unpacked/locales ${pkgdir}/usr/lib/${pkgname}
    cp -R dist/linux-unpacked/resources ${pkgdir}/usr/lib/${pkgname}
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

# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro
_tagname=0.8.54
pkgver=${_tagname//-/_}
pkgrel=1
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
    python
    python-pytest
    # AUR
    python-udsoncan
    python-doipclient
)
makedepends=(
    git
    npm
    poppler
    ghostscript
    node-gyp
    nodejs
)
backup=()
options=(!debug !strip)
install=
source=("${pkgname}::git+${url}.git#tag=v${_tagname}")
sha256sums=('3ae227fe3deb542c3122b086726e68f396c47a22d4c712339e67d241ec3711ad')
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
    install -Dm0644 build/icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    #	for size in 16 32 48 64 128 256 512; do
    #    install -Dm644 "public/icons/${size}x${size}.png" \
    #      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ecubus-pro.png"
    #  done
    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: taotieren <admin@taotieren.com>

pkgname=ecubus-pro
pkgver=0.8.66
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
    libgcc
    libstdc++
    java-runtime
    python
    python-lxml
    python-openpyxl
    python-yaml
    # AUR
    python-canmatrix
    python-doipclient
    python-odxtools
    python-udsoncan
)
makedepends=(
    git
    npm
    poppler
    ghostscript
    node-gyp
    nodejs-lts-jod 
)
optdepends=()
backup=()
options=(!debug !strip)
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('f9477eca1ce2ae62c79117ebfe78bdb2266628d5716ccc51c16c7552442eb048')
# noextract=("${pkgname}-${pkgver}.tar.gz")

_pkgname=EcuBus-Pro
prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    # npm 12 默认 allow-remote=none，会拒绝 lockfile 中 resolved 为完整 URL 的“远程”tarball（如 npmmirror 镜像），需显式放开
    export npm_config_allow_remote=all
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
    # npm 12 默认 allow-remote=none，会拒绝 lockfile 中 resolved 为完整 URL 的“远程”tarball（如 npmmirror 镜像），需显式放开
    export npm_config_allow_remote=all
    cd ${srcdir}/${pkgname}/
    npm run native
    npm run worker
    npm run api
    npm run cli:build:linux
    npm run build:sdk
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

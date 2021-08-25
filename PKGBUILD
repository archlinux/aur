# Maintainer: Qingxu <me@linioi.com>
pkgname=switchhosts
pkgver=4.0.3
_subpkgver=6070
pkgrel=1
pkgdesc="An App for hosts management & switching."
arch=(
    'any'
)
url="https://github.com/oldj/SwitchHosts"
license=('Apache')
provides=('switchhosts')
conflicts=(
    'switchhosts-bin'
    'switchhosts-appimage'
)
depends=(
    "gtk3"
    "nss"
)
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
makedepends=(
    'nodejs'
    'electron'
    'npm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/SwitchHosts-v${pkgver}.tar.gz"
)
sha256sums=(
    '4a3ad76fa95103c4ba041a6220987d658fc57cb697cbbd0bdd43a66cd1b7cbff'
)

prepare() {
    cd SwitchHosts-${pkgver}
    # use system electron version
    # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
    electronVer=$(electron --version | tail -c +2)
    sed -i "/electronDownload/,/}/d" scripts/make.js
    sed -i "/directories/i\  electronVersion: \`$electronVer\`," scripts/make.js
    sed -i "/directories/i\  electronDist: \`/usr/lib/electron\`," scripts/make.js
    sed -i "s/.*\"electron\":.*$/    \"electron\": \"^$electronVer\",/"  package.json
    # Set arch and target
    local i686=ia32 x86_64=x64 armv7h=armv7l aarch64=arm64
    sed -i "s/.*AppImage:x64.*$/    linux: ['pacman:build_arch'],/" scripts/make.js
    sed -i "s#build_arch#${!CARCH}#g" scripts/make.js
    sed -i "/await makeMacArm/d" scripts/make.js
    sed -i "/await sign/d" scripts/make.js
    sed -i "s/TARGET_PLATFORMS_configs.all/TARGET_PLATFORMS_configs.all.linux/g" scripts/make.js 
}

build() {
    cd SwitchHosts-${pkgver}
    npm install
    npm run build
    npm run make
}

package() {
    cd ${srcdir}
    tar -xvf SwitchHosts-${pkgver}/dist/SwitchHosts_linux_${pkgver}\(${_subpkgver}\).pacman -C ${pkgdir}
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}

post_install() {
    # Link to the binary
    ln -sf '/opt/SwitchHosts/switchhosts' '/usr/bin/switchhosts'
    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/SwitchHosts/chrome-sandbox' || true
    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true
}

post_remove() {
    rm -f '/usr/bin/switchhosts'
}

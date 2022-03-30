# Maintainer: ninni <soelder@hotmail.com>
pkgname=awakened-poe-trade-git
pkgver=3.17.10004.r0.g338ef94
pkgrel=1
pkgdesc='Path of Exile trading app for price checking'
arch=('x86_64')
url='https://github.com/SnosMe/awakened-poe-trade'
license=('MIT')
depends=()
makedepends=('git' 'yarn' 'node-gyp' 'nvm' 'libxtst' 'libpng')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('awakened-poe-trade.desktop' 'git+https://github.com/SnosMe/awakened-poe-trade.git')
md5sums=('SKIP' 'SKIP')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
    cd "${srcdir}/awakened-poe-trade"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/awakened-poe-trade"
    LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
    git checkout $LATEST_TAG
    _ensure_local_nvm
    nvm install 14
}

build() {
    cd "${srcdir}/awakened-poe-trade"
    _ensure_local_nvm
    yarn
    yarn make-index-files
    yarn electron:build
}

package() {
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/bin"

    cp ${srcdir}/awakened-poe-trade/dist_electron/*.AppImage ${pkgdir}/usr/bin/awakened-poe-trade
    cp ${srcdir}/awakened-poe-trade/dist_electron/bundled/icon.png ${pkgdir}/usr/share/pixmaps/awakened-poe-trade.png
    cp ${srcdir}/awakened-poe-trade.desktop ${pkgdir}/usr/share/applications/awakened-poe-trade.desktop
}

post_install() {
    update-mime-database
    update-desktop-database
}

post_upgrade() {
    post_install "$1"
}

post_remove() {
    post_install "$1"
}

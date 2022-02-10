# Maintainer: ninni <soelder@hotmail.com>
pkgname=awakened-poe-trade-git
pkgver=3.17.10003.r1.g0726283
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
source=('git+https://github.com/SnosMe/awakened-poe-trade.git')
md5sums=('SKIP')

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
	mkdir -p "${pkgdir}/usr/bin"
	cd "${srcdir}/awakened-poe-trade/dist_electron/"
	cp *.AppImage "${pkgdir}/usr/bin/awakened-poe-trade"
}

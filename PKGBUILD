pkgname=kerbal-telemetry
pkgver=v2.0.1
pkgrel=1
pkgdesc='A fork of open mct aimed at making telemetry from kerbal space program usable'
arch=('any')
url='https://gitlab.com/Overloader/kerbal-telemetry'
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('nvm')
source=("https://gitlab.com/Overloader/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm
    nvm install 14
}

package() {
    _ensure_local_nvm
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    chown -R root:root "${pkgdir}"
    
    install -Dm644 "$pkgdir/LICENSE"  -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    ln -s "$Pkgdir/kerbal-telemetry" /usr/bin/
}
sha256sums=('65235ddd8e8ff71089b83c707ae36ac8bb2fc238384143d70d8450160a701e9b')

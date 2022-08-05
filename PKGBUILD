# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.1.0
pkgrel=1
pkgdesc="open-source photo thumbnail service"
arch=('x86_64')
url="https://github.com/thumbor/thumbor"
license=('MIT')
depends=(python python-colorama python-pycurl python-opencv python-exiv2 python-cairosvg python-tornado gifsicle python-libthumbor python-derpconf python-socketfromfd)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest python-preggy python-pyssim)
backup=("etc/thumbor.conf")
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz"
        "thumbor.service")
b2sums=('ecb0ad405af4f93e8c4e8bb1d270d7c2fe8a16b1408785e1b032de6bf26206e61fc4a74b4f7338c1070aaf6aa0ecd9779ee6cba9513846bec69b1e78e114b738'
        'c0fe21516f245132ac9bb1a833601eabc8348f8c420c76d49ffe7cb25e00712fcbc0fe7c579604616f5008507ec9f7582936596e54e8a311acf949fb031cd5ca')

prepare() {
    cd "$pkgname-$pkgver"

    # Adjust storage/cache paths to match systemd service
    sed -e "s|FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'storage' )|FILE_STORAGE_ROOT_PATH = '/var/lib/thumbor'|" \
     -e "s|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'result_storage')|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = '/var/cache/thumbor'|" \
     -i $pkgname/$pkgname.conf
}

check(){
    cd "$pkgname-$pkgver"
    # skip tests for now, they are utterly broken and need some sort of sentry.io sdk
    # pytest
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 $srcdir/thumbor.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 $pkgname/$pkgname.conf -t "${pkgdir}"/etc/
}

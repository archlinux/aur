# Maintainer: Anton Karmanov <a.karmanov@inventati.org>
pkgname=stegosaurus-lv2
pkgver=0.4.0
pkgrel=1
pkgdesc="lv2 drum synthersizer without sampling"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname"
license=('BSD')
depends=('lv2' 'cairo')
makedepends=('python-virtualenv' 'python2')
source=("https://sourceforge.net/projects/$pkgname/files/stegosaurus_v0.4.0_October_2021.tar.gz")
md5sums=('6c67794431aedfefd44e3aca21c862dd')

prepare() {
    cd stegosaurus
    virtualenv -p python2 python2_env
    source python2_env/bin/activate
    python -V
}

build() {
    cd stegosaurus
    LDFLAGS="${LDFLAGS} -z muldefs"  # Ignore multiple defenitions
    LV2_PATH="${HOME}./lv2/:/usr/local/lib/lv2/:/usr/lib/lv2/"
    env LV2_PATH="$LV2_PATH" ./waf configure --prefix="${pkgdir}/usr"
    ./waf build
}

package() {
    cd stegosaurus
    ./waf --destdir="$pkgdir" install
}

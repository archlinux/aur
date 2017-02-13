# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=gplaycli
pkgver=0.2.1
pkgrel=1
pkgdesc="command line tool to search/install/update Android applications Google PlayStore able to run with cronjob, in order to automatically update an F-Droid server instance"
arch=('any')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python2' "python2-requests" "python2-protobuf" "python2-androguard" "python2-clint" "python2-pyopenssl")
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/matlink/gplaycli/archive/v${pkgver}.tar.gz"
        "$pkgname.install")
md5sums=('4cd194af873d827795e13752be5ac9e0'
         'e993658f9913493bb4336d73f23a3195')

package() {
    cd gplaycli-$pkgver
    find . -name "*.py" -exec sed -i 's$#!/usr/bin/python$#!/usr/bin/python2$' {} \;
    find . -name "*.py" -exec sed -i 's$#!/usr/bin/env python$#!/usr/bin/env python2$' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1

    # installs config to build user home - moving to /usr/share
    mkdir -p "$pkgdir/usr/share/$pkgname/" 
    mv "${pkgdir}${HOME}/.config/$pkgname/" "$pkgdir/usr/share/$pkgname/config"
    rm -rf "$pkgdir/home"
}

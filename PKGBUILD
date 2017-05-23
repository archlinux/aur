# Maintainer: Sean Enck <enckse@gmail.com>
# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.1
pkgrel=9
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-setuptools' 'python-urllib3')
license=('LGPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/b3/86/0ce63db69006343f3b5f1cc90cf6fee2fc0d1ddf21949bd591daefedeff7/python-telegram-bot-6.0.1.tar.gz"
        "request.patch"
        "setup.patch")
md5sums=('e6eb6d7e71a658415ebd8885f99d0945'
         '8f1c461f10f123d77c58de177593c31f'
         '38e21bfb374f0ac43fbdfe0761ea352e')

prepare(){
    cd $srcdir
    bsdtar -xf $pkgname-$pkgver.tar.gz
    cp $srcdir/request.patch $srcdir/$pkgname-$pkgver/telegram/utils/
    cp $srcdir/setup.patch $srcdir/$pkgname-$pkgver/
}

build(){
    cd $srcdir/$pkgname-$pkgver
    rm -rf telegram/vendor
    sed '/certifi/d' requirements.txt -i
    patch -p0 -i setup.patch
    cd telegram/utils
    patch -p0 -i request.patch
    cd $srcdir/$pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}

# Maintainer: redfish <redfish at galactica dot pw>

pkgname='monero-wallet-qt-git'
_monerover=0.11.0.0
pkgver=${_monerover}
pkgrel=1
arch=('x86_64' 'i686')
url="https://getmonero.org/"
license=('custom:Cryptonote')

provides=('monero-wallet-qt')
conflicts=('monero-wallet-qt')

depends=("libmonero-wallet-git>=$_monerover"
'openssl' 'boost-libs>=1.45'  'libunwind' 'readline'
'qt5-base' 'qt5-declarative' 'qt5-graphicaleffects'
'qt5-location' 'qt5-quickcontrols' 'qt5-tools' 'qt5-webchannel'
'qt5-webengine' 'qt5-x11extras' 'qt5-xmlpatterns')

makedepends=('git' 'cmake' 'boost')

pkgdesc="Official QT GUI wallet for Monero, a private, secure, untraceable peer-to-peer currency"

_repourl=https://github.com/monero-project/monero-core
source=("git+$_repourl")

md5sums=('SKIP')

_srcdir=monero-core

pkgver() {
    cd "$srcdir/$_srcdir"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_srcdir"

    echo "var GUI_VERSION = \"$pkgver\"" > version.js
    echo "var GUI_MONERO_VERSION = \"$_monerover\"" >> version.js

    #patch -p1 < ../link-libreadline.patch

    # Otherwise pull fails
    git config user.name makepkg
    git config user.email makepkg@localhost

    git remote add up $_repourl

    git pull --no-edit up refs/pull/868/head # add -lreadline
    git pull --no-edit up refs/pull/793/head # subaddresses
}

build() {
    cd "$srcdir/$_srcdir"

    make -C src/zxcvbn-c

    qmake
    make
}

package() {
    install -D -m755 "$srcdir/$_srcdir/release/bin/monero-wallet-gui" "$pkgdir/usr/bin/monero-wallet-qt"
    install -D -m644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: redfish <redfish at galactica dot pw>
pkgname='monero-wallet-qt-git'
_monerover=0.16.0.0
pkgver=0.16.0.0
pkgrel=1
arch=('x86_64' 'i686')
url="https://getmonero.org/"
license=('custom:Cryptonote')

provides=('monero-wallet-qt' 'monero-gui')
conflicts=('monero-wallet-qt' 'monero-gui')

depends=("libmonero-wallet>=$_monerover"
'openssl' 'boost-libs>=1.45'  'libunwind' 'readline' 'unbound' 'hidapi' 'randomx'
'qt5-base' 'qt5-declarative' 'qt5-graphicaleffects'
'qt5-location' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-tools' 'qt5-webchannel'
'qt5-webengine' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-svg')

makedepends=('git' 'cmake' 'boost')

pkgdesc="Official QT GUI wallet for Monero, a private, secure, untraceable peer-to-peer currency"

_repourl=https://github.com/monero-project/monero-gui
source=("git+$_repourl"
	binaryfate.asc_::https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc
	fluffypony.asc_::https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/fluffypony.asc
	luigi1111.asc_::https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/luigi1111.asc
	)

sha256sums=('SKIP')

_srcdir=monero-gui

pkgver() {
    cd "$srcdir/$_srcdir"

    # Release tags might point to commits on a branch different than master,
    # so don't use them.
    #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "$(echo $pkgver | sed 's/\.r.*//').r%s.g%s" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_srcdir"

    echo "var GUI_VERSION = \"$pkgver\"" > version.js
    echo "var GUI_MONERO_VERSION = \"$_monerover\"" >> version.js

    mkdir -p monero/utils/gpg_keys
    for k in binaryfate fluffypony luigi1111
    do
        cp $srcdir/${k}.asc_ monero/utils/gpg_keys/${k}.asc
    done
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

sha256sums=('SKIP'
            '7dcb19c87d41a4399b4877054111f7dbfd30531545678bc2be218bd56903904c'
            'ff561ba4b4cea730645e1717836bba1445c1e022cb2dba9f3932e44554bf16a1'
            'a46965379e6edd1ecf4f2b804e3a96e9824512b5ca8e9351ee4a1d640d02ab51')

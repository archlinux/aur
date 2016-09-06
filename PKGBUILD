# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay

pkgname=copay
pkgver=2.6.0
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source=('copay.desktop')

md5sums=('e05610d1b08a2c688efccf9d687b8b92')
md5sums_x86_64=('7ff033094699afee187a9426758f51ee'
                'SKIP')

source_x86_64=("https://github.com/bitpay/copay/releases/download/v${pkgver}/Copay-linux.zip"
               "https://github.com/bitpay/copay/releases/download/v${pkgver}/Copay-linux.zip.sig"
              )


# gpg --recv-keys 9D17E656BB3B6163AE9D71725CD600A61112CFA1
validpgpkeys=('9D17E656BB3B6163AE9D71725CD600A61112CFA1')

# TODO: test 32 bit build (maybe)

package() {

    # Prep destination
    mkdir -p ${pkgdir}/opt/copay
    cd ${pkgdir}/opt/copay

    # Unzip the binary package
    unzip ${startdir}/Copay-linux.zip
    
    # Remove arch suffix 
    mv copay-linux/* .
    rmdir copay-linux

    # Fix file permissions
    find ${pkgdir}/opt/copay/ -type f -print0 | xargs -0 chmod a+r

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/Copay ${pkgdir}/usr/bin/copay

    # Create desktop icon
    install -Dm644 "$srcdir"/copay.desktop "$pkgdir/usr/share/applications/copay.desktop"
    install -Dm644 "$srcdir"/copay-linux/icon-256.png "$pkgdir/usr/share/pixmaps/copay.png"
}

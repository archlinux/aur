# Author: Jolly Mort <jm-zpp4hdgm(at)unseeni(dot)net>
# Based on copay AUR package, credit: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/Bitcoin-com/Wallet
#
# Signed upstream binaries dropped in favor of git build due to quality issues
# highlighted at https://github.com/bitpay/copay/issues/6204

pkgname=bitcoin-com
pkgver=4.5.0
pkgrel=1
pkgdesc="Bitcoin.com Bitcoin Wallet"
arch=('x86_64')
url="https://www.bitcoin.com/"
license=('MIT')
makedepends=('zip')
depends=('npm' 'python2')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source=('bitcoin-com.desktop')

md5sums=('a48078782a2a0650271317e9be091f4c')
md5sums_x86_64=('SKIP')

# Ideally the upstream git repo tags would signed, or the repo source snapshots were signed.
# Would be nice if anything was signed and worked.
# TODO: Try to verify the git tag we are about to build
source_x86_64=("${pkgname}-${pkgver}::git+https://github.com/Bitcoin-com/Wallet.git#tag=${pkgver}")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm run clean-all
    npm run apply:bitcoincom
    npm run build:desktop
}

#
# TODO: Placing the entire node-webkit build in /opt feels dirty if we just
#       built the package, but scattering it around /usr feels worse.  Is there
#       a recommended psuedo-webapps convention?
#
package() {
    # Prep destination
    mkdir -p ${pkgdir}/opt/bitcoin-com
    cd ${pkgdir}/opt/bitcoin-com

    # Unzip the binary package
    unzip "${srcdir}/${pkgname}-${pkgver}/webkitbuilds/Bitcoin.com-linux.zip"
    
    # Remove arch directory 
    mv Bitcoin.com-linux/* .
    rmdir Bitcoin.com-linux

    # Fix file permissions
    find ${pkgdir}/opt/bitcoin-com/ -type f -print0 | xargs -0 chmod a+r

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/bitcoin-com/Bitcoin.com ${pkgdir}/usr/bin/bitcoin-com

    # Create desktop icon
    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/bitcoin-com.desktop" "$pkgdir/usr/share/applications/bitcoin-com.desktop"
    ln -s "../../../opt/bitcoin-com/512x512.png" "$pkgdir/usr/share/pixmaps/bitcoin-com.png"
}

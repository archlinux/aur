# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay
#
# Signed upstream binaries dropped in favor of git build due to quality issues
# highlighted at https://github.com/bitpay/copay/issues/6204

pkgname=copay
pkgver=3.9.1
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('npm' 'python2')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source=('copay.desktop')

md5sums=('e05610d1b08a2c688efccf9d687b8b92')
md5sums_x86_64=('SKIP')

# Ideally the upstream git repo tags would signed, or the repo source snapshots were signed.
# Would be nice if anything was signed and worked.
# TODO: Try to verify the git tag we are about to build
source_x86_64=("${pkgname}-${pkgver}::git+https://github.com/bitpay/copay.git#tag=v${pkgver}")

# Previously used for signed binary releases
# gpg --recv-keys 9D17E656BB3B6163AE9D71725CD600A61112CFA1
#validpgpkeys=('9D17E656BB3B6163AE9D71725CD600A61112CFA1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm run clean-all
    npm run apply:copay
    npm run build:desktop
}

#
# TODO: Placing the entire node-webkit build in /opt feels dirty if we just
#       built the package, but scattering it around /usr feels worse.  Is there
#       a recommended psuedo-webapps convention?
#
package() {
    # Prep destination
    mkdir -p ${pkgdir}/opt/copay
    cd ${pkgdir}/opt/copay

    # Unzip the binary package
    unzip "${srcdir}/${pkgname}-${pkgver}/webkitbuilds/Copay-linux.zip"
    
    # Remove arch directory 
    mv Copay-linux/* .
    rmdir Copay-linux

    # Fix file permissions
    find ${pkgdir}/opt/copay/ -type f -print0 | xargs -0 chmod a+r

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/Copay ${pkgdir}/usr/bin/copay

    # Create desktop icon
    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/copay.desktop" "$pkgdir/usr/share/applications/copay.desktop"
    ln -s "../../../opt/copay/512x512.png" "$pkgdir/usr/share/pixmaps/copay.png"
}

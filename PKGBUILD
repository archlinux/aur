# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay
#
# Signed upstream binaries dropped in favor of git build due to quality issues
# highlighted at https://github.com/bitpay/copay/issues/6204

pkgname=copay
pkgver=5.9.4
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('npm')

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

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Fragile patch to change { "linux": "target": [ "snap" ] } to "tar.gz"
    # distribution instead of a snappy app
    sed -i -e 's:\(\s*\)"snap"$:\1"tar.gz":' package.json
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm run clean-all
    npm install
    #npm audit fix
    npm run apply:copay

    # Skip building Windows and MacOS distributions, default instructions
    # attempt this with `npm run final:desktop`

    npm run build:desktop-release
    ./node_modules/.bin/electron-builder --linux
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
    tar --strip 1 -xvf "${srcdir}/${pkgname}-${pkgver}/dist/Copay-linux.tar.gz"

    # Permissions out of tar.gz are a mess, all 777, wtf?
    find ${pkgdir}/opt/copay/ -print0 | xargs -0 chmod og-w
    find ${pkgdir}/opt/copay/ -type f -print0 | xargs -0 chmod a-x

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/copay ${pkgdir}/usr/bin/copay
    chmod a+x ${pkgdir}/opt/copay/copay

    # Create desktop icon
    install -D -m644 "${srcdir}/copay.desktop" "$pkgdir/usr/share/applications/copay.desktop"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/resources/copay/linux/icon.png" "$pkgdir/usr/share/pixmaps/copay.png"
}

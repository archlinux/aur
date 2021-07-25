# Maintainer: filips <projects at filips dot si>

_pkgname="FirefoxPWA"
pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver=0.5.0
pkgrel=1
url="https://github.com/filips123/FirefoxPWA"
arch=("x86_64" "i686")
license=("MPL2")

depends=("glibc>=2.18")
optdepends=("firefox: Support for browser extension")
provides=("firefox-pwa")
conflicts=("firefox-pwa")
install=package.install

source_x86_64=("https://github.com/filips123/FirefoxPWA/releases/download/v${pkgver}/firefoxpwa_${pkgver}_amd64.deb")
source_i686=("https://github.com/filips123/FirefoxPWA/releases/download/v${pkgver}/firefoxpwa_${pkgver}_i386.deb")
sha256sums_x86_64=('b465d329922fd721d8d807aa6071b8eca04b7231976054204bc9f1b8784b05e9')
sha256sums_i686=('7f1e112b647a9cb62f0fc7545c65d5f5e5fd0393222d38c3965075ed220dc3d2')
b2sums_x86_64=('ccb7a7b51af69bc6a67653cdb0342499384e056926879533f2634f65a26a89e0c0930a66371c24e8126864e9dab4782bab385086fd72054bdffa66508085eafb')
b2sums_i686=('fb0e2c9bd27ef5dd9022691f294c7cb5422783c7d0113db782e35bfb2034050211364d2cd021062b4f1b59b193f23100e85f5154de810b13ca10012b73e20754')

prepare() {
    # Extract data from DEB archive
    mkdir -p $srcdir/data/
    tar xf ${srcdir}/data.tar.xz -C $srcdir/data/

    # We don't use libexec on Arch
    sed -i "s@/usr/libexec/firefoxpwa-connector@/usr/lib/firefoxpwa/firefoxpwa-connector@g" $srcdir/data/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json
    mkdir -p $srcdir/data/usr/lib/firefoxpwa/
    mv $srcdir/data/usr/libexec/firefoxpwa-connector $srcdir/data/usr/lib/firefoxpwa/

    # Remove unnecessary directories
    rm -rf $srcdir/data/usr/libexec/
    rm -rf $srcdir/data/usr/lib64/
}

check() {
    cd $srcdir/data/
    [ "$(./usr/bin/firefoxpwa --version)" == "firefoxpwa $pkgver" ]
}

package() {
    cp -r $srcdir/data/ $pkgdir
}

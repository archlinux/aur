# Maintainer: filips <projects at filips dot si>

_pkgname="FirefoxPWA"
pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver=1.0.0
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
sha256sums_x86_64=('e52cd382a05172f85ed8a6fc5d5da278e58871112218c9e709059dc053d4dda1')
sha256sums_i686=('6cc9169ab746d2c240b14ba5909ba6460a23e15716f32b090cb4b8c0ee31ecc0')
b2sums_x86_64=('d05a393e95a582aff2e483862ecf0421ec1fe36f6f694a915038c70848e1adc7ee07e05a8ca5c677267e4a6e9a159efa2529fc92e1091f1e5b65aae4e0ffaa7e')
b2sums_i686=('dee7e70119fc2e2acb9e94ab1d90a5b5735d1386494eed67eb84d92e135323d61add363f046d1813d4541b6f80a2394811ad1b9b92e19e4d3f1536fb989196ab')

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

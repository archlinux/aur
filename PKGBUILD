# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=libfprint-goodix-53xc
pkgver=0.0.6
pkgrel=2
pkgdesc="Proprietary driver for the Goodix fingerprint reader 27c6:533c, from Dell driver"
arch=('x86_64')
url="http://dell.archive.canonical.com/updates/pool/public/libf/libfprint-2-tod1-goodix/"
_filename="libfprint-2-tod1-goodix_${pkgver}-0ubuntu1~somerville1_amd64.deb"
license=('custom')
depends=('libfprint-tod')
makedepends=('tar')
groups=('fprint')
source=("${_filename}::${url}${_filename}")
sha256sums=('b921e155fd35b06341a453b9c6f6c4c7101f199aee314403826c517156a4b038')

prepare() {
    cd "$srcdir"
    # Extract the deb file
    ar x "${_filename}"
    # Extract data archive
    tar -xf data.tar.*
}

package() {
    cd "$srcdir"
    
    # Adjust udev rules for Arch (replace plugdev with uaccess, rm unnecessary ATTRS{dev} (tested, works after rm))
    if [ -f "lib/udev/rules.d/60-libfprint-2-tod1-goodix.rules" ]; then
        sed -i 's/, ATTRS{dev}=="\*"//' lib/udev/rules.d/60-libfprint-2-tod1-goodix.rules
        sed -i 's/GROUP="plugdev"/TAG+="uaccess"/' lib/udev/rules.d/60-libfprint-2-tod1-goodix.rules
    fi
    
    # Install library files
    if [ -d "usr/lib/x86_64-linux-gnu/libfprint-2/tod-1" ]; then
        install -dm755 "$pkgdir/usr/lib/libfprint-2/tod-1/"
        install -Dm755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/*.so "$pkgdir/usr/lib/libfprint-2/tod-1/"
    fi
    
    # Install udev rules
    if [ -d "lib/udev/rules.d" ]; then
        install -dm755 "$pkgdir/usr/lib/udev/rules.d/"
        install -Dm644 lib/udev/rules.d/*.rules "$pkgdir/usr/lib/udev/rules.d/"
    fi
    
    # Install license if present
    if [ -f "usr/share/doc/${_debname}/copyright" ]; then
        install -Dm644 "usr/share/doc/${_debname}/copyright" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

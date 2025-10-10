# Maintainer: MLM-stuff gfxoxinzh@mozmail.com

pkgname=libfprint-2-tod1-goodix-v2
pkgver=0.0.11+2404
_debver="${pkgver}-0ubuntu1"
_debname="libfprint-2-tod1-goodix-550a"
pkgrel=1
pkgdesc="Proprietary driver for Goodix fingerprint readers from Ubuntu launchpad"
arch=('x86_64')
url="https://launchpad.net/~libfprint-tod1-group"
license=('custom')
conflicts=('libfprint-2-tod1-goodix')
depends=('libfprint-tod')
makedepends=('tar')
groups=('fprint')
source=("https://launchpad.net/~libfprint-tod1-group/+archive/ubuntu/ppa/+files/${_debname}_${_debver}_amd64.deb")
sha256sums=('8781ba581d7baa17fbeef2fb602e86fd0801e9f8846e20d27bd78a3067932bc6')

prepare() {
    cd "$srcdir"
    # Extract the deb file
    ar x "${_debname}_${_debver}_amd64.deb"
    # Extract data archive
    tar -xf data.tar.*
}

package() {
    cd "$srcdir"
    
    # Adjust udev rules for Arch (replace plugdev with uaccess, rm unnecessary ATTRS{dev})
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

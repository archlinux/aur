# Maintainer: Maxime Vincent <maxime.vince@gmail.com>

pkgname=sigfox-radio-signal-analyzer
pkgver=2.0.1
pkgrel=1
pkgdesc='Sigfox Radio Signal Analyser for use with Sigfox SDR stick'
arch=(i686 x86_64)
license=(GPL)
depends=('fftw' 'qt5-svg' 'alsa-lib')
makedepends=('squashfs-tools' 'cdrtools')
source=()
sha256sums=()

prepare() {
    mkdir -p  iso
    cd iso
    wget -c https://support.sigfox.com/files/5e6202f04f6f67c0396574bb -O sigfox_rsa.iso
    isoinfo -i sigfox_rsa.iso --find -name "FILESYSTEM.SQUASHFS*" -print 2>/dev/null | xargs isoinfo -i sigfox_rsa.iso -x > filesystem.squashfs
}

build() {
    echo Build
}

package() {
    if [ -d "$srcdir"/unsq ]; then
        echo "Already unsquashed. Skipping unsquashfs"
    else
        unsquashfs -d "$srcdir"/unsq iso/filesystem.squashfs
    fi
    mkdir -p "$pkgdir"/usr/
    mkdir -p "$pkgdir"/usr/local

    # Some /usr/local/bin paths are hardcoded in the binary, so we should copy them as well
    mkdir -p "$pkgdir"/usr/local/bin
    mkdir -p "$pkgdir"/usr/local/bin/sigfox_verified/
    cp -r "$srcdir"/unsq/usr/local/bin/sigfox_verified "$pkgdir"/usr/local/bin/

    # Copy from /usr/local to /usr
    cp -r "$srcdir"/unsq/usr/local/bin "$pkgdir"/usr/
    cp -r "$srcdir"/unsq/usr/local/lib "$pkgdir"/usr/
    cp "$srcdir"/unsq/usr/lib/librsvisa.so "$pkgdir"/usr/lib/

    # Re-create symlink
    rm -rf  "$pkgdir"/usr/bin/radio_signal_analyzer_pb
    ln -s  /usr/bin/sigfox_verified/radio_signal_analyzer_pb "$pkgdir"/usr/bin/radio_signal_analyzer_pb

    # Remove unused directories that got copied
    rm -rf "$pkgdir"/usr/lib/python2.7/site-packages
    rm -rf "$pkgdir"/usr/lib/python3.5/dist-packages
    rm -rf "$pkgdir"/usr/lib/python2.7/dist-packages
    rm -rf "$pkgdir"/usr/lib/python3.5
    rm -rf "$pkgdir"/usr/lib/python2.7

    #install -Dm644 bin/radio_signal_analyzer "$pkgdir"/usr/local/bin/radio_signal_analyzer
    #install -Dm644 bin/sigfox_verified "$pkgdir"/usr/local/bin/
    libtool --finish /usr/lib
}


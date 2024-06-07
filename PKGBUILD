pkgbase=amp-locker
pkgname=('amp-locker-data-bin' 'amp-locker-standalone-bin' 'amp-locker-lv2-bin' 'amp-locker-vst3-bin')
pkgver=1.1.6
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/collections/amp-locker-gear/products/amp-locker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
provides=('amp-locker')
source=('Amp Locker.desktop'
        'Amp Locker Linker'
        'amp-locker.png')
sha256sums=('bbeb596d62ed9943294ee5025ba690def02e263b5c9b3b88304ee84607c52f53'
            '858c84940f463f78e9b01866dd3f2cf4cb5208b0296400b668490222a28c2ef3'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/AmpLockerLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_amp-locker-data-bin() {
    ## Install Asset Data
    pkgdesc="Audio Assault Multamp Simulator (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/AmpLockerData/data"

    ## Copy assets to data directory
    cp -r "$srcdir/AmpLockerLinux/data/"* "$pkgdir/usr/lib/AmpLockerData"

    ## Remove empty folder
    rm -r "$pkgdir/usr/lib/AmpLockerData/data"

    ## Install Amp Locker Linker Script
    install -Dm755 "$srcdir/Amp Locker Linker" "$pkgdir/usr/bin/Amp Locker Linker"
}

package_amp-locker-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Audio Assault Multamp Simulator (LV2)"
    depends=('amp-locker-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/AmpLockerLinux/Amp Locker.lv2/Amp Locker.so" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/Amp Locker.so"
    install -Dm644 "$srcdir/AmpLockerLinux/Amp Locker.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/dsp.ttl"
    install -Dm644 "$srcdir/AmpLockerLinux/Amp Locker.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/manifest.ttl"
    install -Dm644 "$srcdir/AmpLockerLinux/Amp Locker.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Amp Locker.lv2/ui.ttl"
}

package_amp-locker-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Audio Assault Multamp Simulator (VST3)"
    depends=('amp-locker-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/AmpLockerLinux/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so" "$pkgdir/usr/lib/vst3/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so"
}

package_amp-locker-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault Multamp Simulator (Standalone)"
    depends=('amp-locker-data-bin')
    groups=('pro-audio')
    install -Dm644 "$srcdir/Amp Locker.desktop" "$pkgdir/usr/share/applications/Amp Locker.desktop"
    install -Dm644 "$srcdir/amp-locker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/amp-locker.png"
    install -Dm755 "$srcdir/AmpLockerLinux/Amp Locker Standalone" "$pkgdir/usr/bin/Amp Locker Standalone"
}

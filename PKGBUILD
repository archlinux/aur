pkgbase=echoverb
pkgname=('echoverb-data-bin' 'echoverb-lv2-bin' 'echoverb-vst3-bin')
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/plugin/EchoVerb"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
provides=('echoverb')
source=('EchoVerb Linker')
sha256sums=('341fb36de011892344b656a3da21e7a20ff1910052ccb488757fd40252390def')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/EchoVerbLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_echoverb-data-bin() {
    ## Install Asset Data
    pkgdesc="Original Algorithmic Reverb Plugin (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/5db5/EchoVerb/Presets"

    ## Copy assets to data directory
    cp -r "$srcdir/EchoVerbLinux/Presets"/* "$pkgdir/usr/lib/5db5/EchoVerb/Presets"

    ## Install EchoVerb Linker Script
    install -Dm755 "$srcdir/EchoVerb Linker" "$pkgdir/usr/bin/EchoVerb Linker"
}

package_echoverb-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Original Algorithmic Reverb Plugin (LV2)"
    depends=('echoverb-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/EchoVerbLinux/EchoVerb.lv2/EchoVerb.so" "$pkgdir/usr/lib/lv2/EchoVerb.lv2/EchoVerb.so"
    install -Dm644 "$srcdir/EchoVerbLinux/EchoVerb.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/EchoVerb.lv2/dsp.ttl"
    install -Dm644 "$srcdir/EchoVerbLinux/EchoVerb.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/EchoVerb.lv2/manifest.ttl"
    install -Dm644 "$srcdir/EchoVerbLinux/EchoVerb.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/EchoVerb.lv2/ui.ttl"
}

package_echoverb-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Original Algorithmic Reverb Plugin (VST3)"
    depends=('echoverb-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/EchoVerbLinux/EchoVerb.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/EchoVerb.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/EchoVerbLinux/EchoVerb.vst3/Contents/x86_64-linux/EchoVerb.so" "$pkgdir/usr/lib/vst3/EchoVerb.vst3/Contents/x86_64-linux/EchoVerb.so"
}

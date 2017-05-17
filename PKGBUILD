# Maintainer: Paul B Davis <paul@dangersalad.com>
# Based on traction-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=waveform-bundle
pkgver=8.1.2
pkgrel=4
pkgdesc="Proprietary Digital Audio Workstation (DAW) by Tracktion with bundled DAW Essentials, BioTek, and Collective plugins"
arch=('x86_64')
url="http://www.tracktion.com/"
license=('custom')
depends=(
  'alsa-lib' 'libgl' 'desktop-file-utils' 'shared-mime-info' 'curl' 'libx11'
  'libxext' 'libxinerama' 'freetype2' 'libcurl-gnutls' 'webkitgtk')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
)
source=(https://s3-us-west-2.amazonaws.com/tracktion-marketplace-public/archive/waveform/812/Waveform-bundle-linux-$pkgver.zip)
md5sums=('6d0bff76b42780ff54769c4d42c614d1')
install=waveform.install

package() {
    ar x "Waveform Installer (64-bit) $pkgver.deb"
    tar -x -f 'DAW Essentials Collection.tar.gz'
    tar -x --lzma -f data.tar.lzma -C "${pkgdir}"
    plugin_dir="DAW Essentials Collection"
    # install all the DAW Essentials Collection plugin files
    for file in "$plugin_dir"/*.so
    do
        install -D -m 755 "$file" "$pkgdir/usr/lib/vst/$file"
    done
    # install docs for plugins
    for file in "$plugin_dir"/*.pdf
    do
        install -D -m 755 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done
    # install the biotek and collective pugins, put other files in
    # /opt to be copied to the home directory
    install -D -m 755 "BioTek/BioTek.so" "$pkgdir/usr/lib/vst/BioTek.so"
    install -D -m 755 "Collective/Collective.so" "$pkgdir/usr/lib/vst/Collective.so"

    plugin_dir="BioTek/Instruments"
    for file in "$plugin_dir"/*.biotekinstrument
    do
        install -D -m 644 "$file" "$pkgdir/opt/$pkgname/$file"
    done
    
    plugin_dir="BioTek/Samples"
    for file in "$plugin_dir"/*.acktionsample
    do
        install -D -m 644 "$file" "$pkgdir/opt/$pkgname/$file"
    done
    
    plugin_dir="Collective/Instruments"
    for file in "$plugin_dir"/*.collinst "$plugin_dir"/**/*.collinst
    do
        install -D -m 644 "$file" "$pkgdir/opt/$pkgname/$file"
    done

    plugin_dir="Collective/Samples"
    for file in "$plugin_dir"/*.collsample "$plugin_dir"/*/*/*.collsample
    do
        install -D -m 644 "$file" "$pkgdir/opt/$pkgname/$file"
    done
    
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

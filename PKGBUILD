# Maintainer: Paul B Davis <paul@dangersalad.com>
# Based on traction-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=waveform-bundle
pkgver=8.1.2
pkgrel=1
pkgdesc="Proprietary Digital Audio Workstation (DAW) by Tracktion with bundled DAW Essentials, BioTek, and Collective plugins"
arch=('x86_64')
url="http://www.tracktion.com/"
license=('custom')
depends=(
  'alsa-lib' 'libgl' 'desktop-file-utils' 'shared-mime-info' 'curl' 'libx11'
  'libxext' 'libxinerama' 'freetype2' 'libcurl-gnutls')
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
    # install all the plugin files
    for file in "$plugin_dir"/*.so
    do
        install -D -m 644 "$file" "$pkgdir/usr/lib/vst/$file"
    done
    # install docs for plugins
    for file in "$plugin_dir"/*.pdf
    do
        install -D -m 644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done
    # install the biotek and collective pugins, put other files in
    # /opt to be copied to the home directory
    install -D -m 644 "BioTek/BioTek.so" "$pkgdir/usr/lib/vst/BioTek.so"
    mkdir -p "$pkgdir/opt/$pkgname/BioTek/Documentation"
    cp -r BioTek/Instruments BioTek/Samples "$pkgdir/opt/$pkgname/BioTek"
    cp -r "BioTek/Biotek Manual.pdf" "$pkgdir/opt/$pkgname/BioTek/Documentation"
    install -D -m 644 "Collective/Collective.so" "$pkgdir/usr/lib/vst/Collective.so"
    
    mkdir -p "$pkgdir/opt/$pkgname/Collective/Documentation"
    cp -r Collective/Instruments Collective/Samples "$pkgdir/opt/$pkgname/Collective"
    cp -r "Collective/Collective Manual.pdf" "$pkgdir/opt/$pkgname/Collective/Documentation"
    chmod -R 644 "$pkgdir/opt/$pkgname"
    
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

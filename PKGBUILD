# Maintainer: Leo Schwarz (evotopid) <mail@leoschwarz.com>
# Based on PKGBUILDs:
# • `firefox-developer` by John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# • `firefox-developer-es-mx` by Icaro Perseo <icaroperseo[at]protonmail[dot]com>
#
# Hinweis: Es ist notwendig den PGP Schlüssel von "Mozilla Software Releases <release@mozilla.com>"
#   zu importieren. Mehr Information unter: https://wiki.archlinux.org/index.php/GnuPG#Import_a_public_key
#   $ gpg --keyserver pgp.mit.edu --recv-keys 14F26682D0916CDD81E37B6D61B7B526D98F0353

_name=firefox
_channel=developer

_release_year=2016
_release_month=12
_release_day=24
_release_time=00-40-04
_release_version=52.0a2

pkgname="${_name}-${_channel}-de"
pkgdesc='Standalone web browser from mozilla.org, developer build - German'
url='http://www.mozilla.org/firefox/developer'
pkgver="${_release_version}_${_release_year}${_release_month}${_release_day}"
pkgrel=1
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_release_version}.de.linux-x86_64"
_release_dir="${_release_year}-${_release_month}-${_release_day}-${_release_time}-mozilla-aurora-l10n"
source=("firefox_$pkgver.tar.bz2::https://ftp.mozilla.org/pub/firefox/nightly/$_release_year/$_release_month/$_release_dir/$_file.tar.bz2"
        "firefox_$pkgver.checksums::https://ftp.mozilla.org/pub/firefox/nightly/$_release_year/$_release_month/$_release_dir/$_file.checksums"
        "firefox_$pkgver.checksums.asc::https://ftp.mozilla.org/pub/firefox/nightly/$_release_year/$_release_month/$_release_dir/$_file.checksums.asc"
        "firefox-$_channel.desktop"
        "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
provides=(firefox-developer)
conflicts=(firefox-developer)

validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')

prepare() {
    # Check if the hash provided in this PKGBUILD equals the one provided and signed by upstream.
    valid_hash=$(grep -e "sha512.*linux-x86_64\.tar\.bz2" "firefox_$pkgver.checksums" | cut -d " " -f1)
    actual_hash=${sha512sums[0]}

    if [ "$valid_hash" != "$actual_hash" ];
    then
        error "SHA512 hash in this PKGBUILD was not correctly signed."
        exit 1
    else
        echo "SHA512 hash in this PKGBUILD was signed correctly."
    fi
}

package() {
    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox $pkgdir/opt/firefox-$_channel

    ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
    install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/firefox-${_channel}-icon.png
    install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

sha512sums=('acbf2f32e4af6223fbdcfbed4ed95b2165ff8f81dfc0fec17ca0df52307e1af792748d7082cba9e7363d628bec6dc93abe18d8ae1cbc16e2a1044838b230d44e'
            '5299f20fcdf0417ac736de2e6f61c1b80e494de6522bdab6f9dac4c887f10899bdc78b0636784a5eb0b9ddd0a780a24087ebf5c09c2dd96aa2de29d94f9d2367'
            'SKIP'
            'b109b884ed79e9e214541750a0fcac8d7d8891cc7f0e0d472b717a5b71e569ab5852534bceaab045a5b13a9290a7905604d08fe97e28c675a2266c30fe719cb6'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')


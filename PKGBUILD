# Maintainer:  Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Maxwell Anselm <silverhammermba+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-hg
_pkgname=firefox
pkgver=r591370+.fdd919d10609+
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (mozilla-unified hg, release branding)"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 mozilla-common libxt mime-types dbus-glib
         ffmpeg nss-hg ttf-font libpulse xorg-server-xwayland
         libvpx libpng libjpeg zlib icu libevent libpipewire02)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust mercurial clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm libpipewire02)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'xdg-desktop-portal: Required for screen sharing'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs !makeflags !strip)
_repo=https://hg.mozilla.org/mozilla-unified
conflicts=('firefox')
provides=('firefox')
source=("hg+$_repo"
        '0001-Use-remoting-name-for-GDK-application-names.patch'
        '0002-Pipewire.patch'
        '0003-Disable-netwerk-test-http3server.patch'
        $_pkgname.desktop $_pkgname-symbolic.svg)
sha512sums=('SKIP'
            '6ee43f89227e2ff5cbb1bee7f1bee58f15ea6e868926660d265c2267890b35f1b9cbac637f4516603199d13457dbe205139c28d2a0942f339ce9332bfd0004b1'
            '44165f754d7ff05a23390e453654fb93b328cb6168724e24325e688da284b355ef2629e3eaa70456157e0fe086fb6243ab240f39c90b935d611bd5d4f025daea'
            'c8aeaa17bdb6564eb9c3e5cec60a0d09b8537f6b53a6daa4df47e4b09fca66c289dcc3656fa849be081dd6f252d2e286d8d1f3012c1f9307b1a6ab37b03c9308'
            'a2b36adff18d1108023cd31f420681f9adea3cfb337183e425dbeaa17e4a0271ed182e54bda19a3a2e11feed35cd040411be1795f5c1487331130bcb321c474d'
            'ba7db9a7c95a051bcd84e4c09c802fc55ee3c0d1d06ec1b169b04e414259b75bbe92fe584aee41a1e3f71e71c160df8bedf5393449e5024110ed27dbc0579ea8')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

pkgver() {
    cd mozilla-unified
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    mkdir -p mozbuild
    cd mozilla-unified

    # https://bugzilla.mozilla.org/show_bug.cgi?id=1547595
    hg export -r 372abda7c202 | patch -Rp1

    # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
    patch -Np1 -i ../0001-Use-remoting-name-for-GDK-application-names.patch

    # https://bugzilla.mozilla.org/show_bug.cgi?id=1430775
    # source: https://github.com/xhorak/firefox-devedition-flatpak/tree/master/org.mozilla.FirefoxNightly
    patch -Np1 -i ../0002-Pipewire.patch

    # https://aur.archlinux.org/packages/firefox-wayland-hg/#comment-737331
    patch -Np1 -i ../0003-Disable-netwerk-test-http3server.patch

    echo -n "$_google_api_key" >google-api-key
    echo -n "$_mozilla_api_key" >mozilla-api-key

    #
    # If you want to disable LTO/PGO (compile too long, it needs working
    # xorg-server-xvfb), delete the lines below beginning with
    # `ac_add_options --enable-lto' and ending with 'export RANLIB=llvm-ranlib`
    #

    cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-lto
export MOZ_PGO=1
export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=${_pkgname//-/}
export MOZ_TELEMETRY_REPORTING=1
export MOZ_REQUIRE_SIGNING=1

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libvpx
ac_add_options --with-system-libevent
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-jpeg
ac_add_options --with-system-png

# Features
ac_add_options --enable-pulseaudio
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
END
}

build() {
    cd mozilla-unified

    export MOZ_SOURCE_REPO="$_repo"
    export MOZ_NOSPAM=1
    export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

    # LTO/PGO needs more open files
    ulimit -n 4096
 
    xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build
    ./mach buildsymbols
}

package() {
    cd mozilla-unified
    DESTDIR="$pkgdir" ./mach install
    find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

    _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
    install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

    _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
    install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

    for i in 16 22 24 32 48 64 128 256; do
        install -Dm644 browser/branding/official/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
    done
    install -Dm644 browser/branding/official/content/about-logo.png \
        "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
    install -Dm644 browser/branding/official/content/about-logo@2x.png \
        "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
    install -Dm644 ../firefox-symbolic.svg \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

    install -Dm644 ../$_pkgname.desktop \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Install a wrapper to avoid confusion about binary path
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

    # Replace duplicate binary with wrapper
    # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
    ln -srf "$pkgdir/usr/bin/$_pkgname" \
        "$pkgdir/usr/lib/$_pkgname/firefox-bin"
}

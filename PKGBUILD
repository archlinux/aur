pkgname=basilisk
pkgver=2018.04.13
pkgrel=2
pkgdesc="Standalone web browser forked from mozilla.org, UXP version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://github.com/MoonchildProductions/UXP"
depends=(gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils xorg-server-xvfb
             autoconf2.13 rust)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags)
com=8a95c03dcd2a7f2c6d64b6ee917f6cb363e9ca60
# there is nothing magic about that commit, it's just the most recent
source=("basil2::git+https://github.com/MoonchildProductions/UXP.git#commit=$com"
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/basilisk.desktop https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/basilisk-symbolic.svg
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/fix-wifi-scanner.diff
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/glibc-2.26-fix.diff
        https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-location.services.mozilla.com.patch
        https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/modified-install-dir.patch
        https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/nss_mozbuild.patch)

sha256sums=('SKIP'
            '1fdc855349da4e3728b202f411ad1d1c3fdc01e616161603175ab1573df1e6a9'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'ebaa84b1e108390cd1042cce7eaad6a7c0053c7b2b4d0b961d4a98732b3c93ac'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            'cd7ff441da66a287f8712e60cdc9e216c30355d521051e2eaae28a66d81915e8'
            'a7d4a4c240772d27c35aa27d711c0eec909700073c8b9488707f60d6e4b81a5e'
            'fe918de6def5136482e177209a52e6d1e596b36c0f24285cbcd97dbe848f14dd'
            '5f0252c51ecb806bbfb857f25a25df58a786b60c190e12bd00d68dca538f72da')



prepare() {
  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

  cd basil2

msg2 'firefox-52-disable-location.services.mozilla.com.patch'
patch -Np1 -i ../firefox-52-disable-location.services.mozilla.com.patch || return 1

msg2 'fix-wifi-scanner.diff'
# https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
patch -Np1 -i ../fix-wifi-scanner.diff || return 1

msg2 '0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch'
# https://bugs.archlinux.org/task/54395 // https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
patch -Np1 -i ../0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch || return 1
# note, sed -i 's/\ \-lcrmf//g' old-configure.in would do the same
# but the patch was here anyway so we may as well use it

msg2 'also remove -lcrmf reference from nss build, rather crudely'
patch -Np1 -i ../nss_mozbuild.patch || return 1
# I'd have used sed here, but either it barfs on escaping single quotes for no adequately explained reason that some dolt probably regards as a feature, or I'm just too stupid to get it to work and the dolt is me

msg2 'modified-install-dir.patch'
patch -Np1 -i ../modified-install-dir.patch || return 1
# this was in other Firefox installations, and it's still needed

# note that I've enabled some optimizations your CPU might not like
# also, we will not be drinking the GTK3 koolaid at this time
# also also, enabling branding/distribution failed for some reason
  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2 -msse -msse2 -msse3 -mmmx -mfpmath=sse"
ac_add_options --enable-default-toolkit=cairo-gtk2

export MOZ_TELEMETRY_REPORTING=0

#ac_add_options --enable-official-branding
#ac_add_options --enable-update-channel=release
#ac_add_options --with-distribution-id=org.archlinux
export MOZ_DATA_REPORTING=0
export MOZILLA_OFFICIAL=0
export MOZ_TELEMETRY_REPORTING=0
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater

ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater


# Imported from Waterfox
ac_add_options --disable-stylo


# If you want to have text-to-speech support, comment this line:
ac_add_options --disable-webspeech

# If you want to have geolocation support, comment this line:
ac_add_options --disable-necko-wifi 

# If you have some problems with Skype Web or other web chat, comment this line:
ac_add_options --disable-webrtc

# If you want to have gamepad support, comment this line:
ac_add_options --disable-gamepad


# please put 1.25 times your number of threads

mk_add_options MOZ_MAKE_FLAGS="-j10"

ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility
ac_add_options --disable-tests
 

END
}

build() {
  cd basil2

  # _FORTIFY_SOURCE causes configure failures
  # again note that these are my own optimizations, ymmv
  # and don't trust it blindly because I might be stupid
  CPPFLAGS+=" -O2 -msse -msse2 -msse3 -mmmx -mfpmath=sse"
  CFLAGS+=" -msse -msse2 -msse3 -mmmx -mfpmath=sse"
  CXXFLAGS+=" -msse -msse2 -msse3 -mmmx -mfpmath=sse"

  # Hardening
  # this is already in my makepkg.conf anyway so I'm leaving it out
#  LDFLAGS+=" -Wl,-z,now"

  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  #  ./mach buildsymbols
  # I have no idea what this is but I'm afraid of purging it

  # Ordinarily, one would use "mach build" but this is a suggested workaround for an Assertion Error, see https://github.com/MoonchildProductions/UXP/issues/110
msg2 'All right, attempting to build now'
  DESTDIR="$pkgdir" make -f client.mk build
  # ./mach build
}

package() {
  cd basil2

msg2 'Fixing  bugs as always lol'
# you and me both, mate
mkdir -p browser/branding
cp -r application/palemoon/branding/unofficial/ browser/branding/official

msg2 'Going to try running make install now'
# this "mach" business may just be b0rked, trying analogous workaround
  DESTDIR="$pkgdir" make -f client.mk install
#  DESTDIR="$pkgdir" ./mach install

msg2 'Now installing a bunch of icons'
  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/basilisk.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"
  install -Dm644 ../basilisk-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/basilisk-symbolic.svg"
  install -Dm644 ../basilisk.desktop \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  # Use system-provided dictionaries
  # took this from an old Firefox PKGBUILD, not sure if it will work
msg2 'using system-provided dictionaries'
  rm -rf "$pkgdir"/usr/lib/basilisk/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/basilisk/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/basilisk/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
msg2 'all the weird stuff about duplicates needs to be corrected'
  ln -srf "$pkgdir/usr/bin/basilisk" \
    "$pkgdir/usr/lib/basilisk/basilisk-bin"

}

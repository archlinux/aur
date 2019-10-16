# Maintainer: Figue <ffigue at gmail>
# Contributor: Figue <ffigue at gmail>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Thank you very much to the older contributors:
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com> 

pkgname=icecat
pkgver=60.9.0
_pkgver=6634ee332979f7a78b11cbf09a77364143a981ed
pkgrel=2
pkgdesc="GNU version of the Firefox browser."
arch=(x86_64)
url="http://www.gnu.org/software/gnuzilla/"
license=('GPL' 'MPL' 'LGPL')
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'ffmpeg'
         'icu' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'autoconf2.13'
             'libpulse' 'gst-plugins-base-libs' 'inetutils' 'rust' 'llvm' 'clang' 'bzr' 'wget' 'mercurial' 'perl-rename')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')

source=(http://git.savannah.gnu.org/cgit/gnuzilla.git/snapshot/gnuzilla-${_pkgver}.tar.gz
        icecat.desktop icecat-safe.desktop
        rust_133-part0.patch 'rust_133-part1.patch::https://bugzilla.mozilla.org/attachment.cgi?id=9046663' 'rust_133-part2.patch::https://bugzilla.mozilla.org/attachment.cgi?id=9046664'
        deny_missing_docs.patch patch_makeicecat_stuff.patch fix-addons.patch)

sha256sums=('2655c3a8f656435e636fcc7774f3fa6e62bf1f98056a64b8b84fbec9a03f7b0c'
            '88a2bfdc78e320fc53dcdc732991d305122ea4eecbbea1dc1723538baa6cd8e2'
            '190577ad917bccfc89a9bcafbc331521f551b6f54e190bb6216eada48dcb1303'
            'c10521badc262b476e844d3f3045ddf27e28d83d49b5db0d0e19431f06386e4d'
            '8b37332dd205946ea95c606103b5b0e1e8498819051ea1c1bce79f04fd88ebca'
            '08ab4293d6008524a38e20b428c750c4c55a2f7189e9a0067871ad723c1efab5'
            'cb1116c783995b8187574f84acb8365681aedaa2c76222cf060d31fedcb063c4'
            '49f7c5cb5a15a30f3fa524960a4ea273c76b191703899db68002f3194c175632'
            '15b381ff8d8296bbf61036401ba774a9b44aaefdc13b2c0627ef6d44e055b00e')

#validpgpkeys=(A57369A8BABC2542B5A0368C3C76EED7D7E04784) # Ruben Rodriguez (GNU IceCat releases key) <ruben@gnu.org>

prepare() {
  cd gnuzilla-${_pkgver}
  patch -Np1 -i ../patch_makeicecat_stuff.patch
  sed -e '/sha256sum/d' -i makeicecat
  sed -e "s/^FFMAJOR.*/FFMAJOR=${pkgver:0:2}/g" -i makeicecat
  sed -e "s/^FFMINOR.*/FFMINOR=${pkgver:(-3):(-2)}/g" -i makeicecat
  sed -e "s/^FFSUB.*/FFSUB=${pkgver:(5)}/g" -i makeicecat
  rm -rf output  # Clean output just in case is already an old build there
  bash makeicecat
  cd output/icecat-${pkgver}

  # Patch to move files directly to /usr/lib/icecat. No more symlinks.
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME);g' -i config/baseconfig.mk
  sed -e 's;$(libdir)/$(MOZ_APP_NAME)-devel-$(MOZ_APP_VERSION);$(libdir)/$(MOZ_APP_NAME)-devel;g' -i config/baseconfig.mk

  # Bug 1521249 --enable-rust-simd fails to build using Rust 1.33
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1521249
  patch -Np1 -i ${srcdir}/rust_133-part0.patch
  patch -Np1 -i ${srcdir}/rust_133-part1.patch || true
  patch -Np1 -i ${srcdir}/rust_133-part2.patch
  patch -Np1 -i ${srcdir}/deny_missing_docs.patch

  # fixes installation of those addons which don't have ID on IceCat ("Cannot find id for addon" error). Thanks to kitsunyan.
  patch -Np1 -i ${srcdir}/fix-addons.patch

  # Fix for error: static declaration of 'gettid' follows non-static declaration
  sed -i -e "s/static inline pid_t gettid/inline pid_t gettid/" tools/profiler/core/platform.h

  printf '%b' "  \e[1;36m->\e[0m\033[1m Starting build...\n"
  
  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --libdir=/usr/lib
ac_add_options --enable-linker=gold
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
# Branding
ac_add_options --enable-official-branding
ac_add_options --with-distribution-id=org.gnu

# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi

# Features
ac_add_options --enable-alsa
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests
ac_add_options --disable-eme
ac_add_options --disable-gconf
ac_add_options --disable-stylo  # Workaround to fix build with rustc 1.38

ac_add_options --with-app-basename=icecat
ac_add_options --with-app-name=icecat
END
}

build() {
  cd gnuzilla-${_pkgver}/output/icecat-${pkgver}
  ICECATDIR="/usr/lib/${pkgname}" && export ICECATDIR

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm
  export RANLIB=llvm-ranlib

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  ./mach buildsymbols
}

package () {
  cd gnuzilla-${_pkgver}/output/icecat-${pkgver}
  DESTDIR="$pkgdir" ./mach install

  _vendorjs="$pkgdir/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Opt all of us into e10s, instead of just 50%
pref("browser.tabs.remote.autostart", true);
END

  printf '%b' "  \e[1;36m->\e[0m\033[1m Finishing...\n"
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/pixmaps

  for i in 16 32 48; do
      install -Dm644 browser/branding/official/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/icecat.png"
  done
  install -Dm644 browser/branding/official/default48.png ${pkgdir}/usr/share/pixmaps/icecat.png
  install -Dm644 ${srcdir}/icecat.desktop ${pkgdir}/usr/share/applications/
  install -Dm644 ${srcdir}/icecat-safe.desktop ${pkgdir}/usr/share/applications/
}

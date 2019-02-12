# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
pkgver=1.25.0
pkgrel=1
_cqzchannel=release
_cqzbuildid=$(curl "http://repository.cliqz.com.s3.amazonaws.com/dist/${_cqzchannel}/${pkgver}/lastbuildid")
pkgdesc="Firefox-based privacy aware web browser, build from sources"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg nss
         ttf-font libpulse sqlite libvpx icu)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake
             inetutils xorg-server-xvfb autoconf2.13 rust clang llvm
             jack gtk2 python nodejs python2-psutil cbindgen nasm libnotify
             wget pulseaudio)
optdepends=('hunspell-en_US: Spell checking, American English')
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/$pkgver.tar.gz")
sha256sums=('bfd19dc7f23603a4e63d33acbfbe8a60fb039325720dcd0a6422ed96fa93fef2')
options=(!emptydirs !makeflags)

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver/mozilla-release/toolkit/mozapps/installer"
  # Do not try to upload anything anywhere
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' upload-files.mk

  cd linux/rpm
  # Patch future desktop file, which does not seems to be embed
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$pkgname/g" mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" mozilla.desktop
  sed -i "s|^Exec=${pkgname}$|Exec=/usr/lib/${pkgname}/${pkgname} %u|" mozilla.desktop

  cat >> mozilla.desktop <<END
Actions=new-forget-window;

[Desktop Action new-forget-window]
Name=New Forget Window
Name[de]=Neues Vergessen Fenster
Name[en_US]=New Forget Window
Name[fr]=Nouvelle fenêtre en mode oubli
Exec=/usr/lib/cliqz/cliqz --private-window %u
END

  cd "$srcdir/${_pkgname}-$pkgver/mozilla-release"

  # Remove -lcrmf from old configure scripts
  sed -i 's/NSS_LIBS="$NSS_LIBS -lcrmf"/NSS_LIBS="$NSS_LIBS"/' old-configure.in

  # Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
  # Note: These are for Arch Linux use ONLY. For your own distribution, please
  # get your own set of keys. Feel free to contact foutrelis@archlinux.org for
  # more information.
  echo -n "AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM" > browser/google-desktop-api.key

  # Mozilla API keys (see https://location.services.mozilla.com/api)
  # Note: These are for Arch Linux use ONLY. For your own distribution, please
  # get your own set of keys. Feel free to contact heftig@archlinux.org for
  # more information.
  echo -n "16674381-f021-49de-8622-3021c5942aff" > browser/mozilla-desktop-geoloc-api.key

  cat >> browser/config/cliqz-release.mozconfig <<END

# Archlinux specific additions
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --prefix=/usr
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

# System libraries
ac_add_options --enable-pulseaudio
ac_add_options --enable-system-ffi
ac_add_options --enable-system-sqlite
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libvpx
ac_add_options --with-system-png
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-zlib

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-updater
ac_add_options --disable-gconf
END

  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's|^./mach build$|xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build|' magic_build_and_package.sh
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  export CQZ_RELEASE_CHANNEL="$_cqzchannel"
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID="$_cqzbuildid"

  # Uncomment the following line to have a german build
  # export CQZ_BUILD_DE_LOCALIZATION=1

  export MOZ_NOSPAM=1
  # LTO needs more open files
  ulimit -n 4096

  ./magic_build_and_package.sh
}

package() {
  install -d -m755 ${pkgdir}/usr/{bin,lib}

  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir"
  mv "${_pkgname}-$pkgver/obj/dist/$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2" .
  tar xjf "$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2"
  cp -R "$pkgname" "$pkgdir/usr/lib/"

  cd "${_pkgname}-$pkgver"
  for size in 16 22 24 32 48 256; do
    install -D -m644 "mozilla-release/browser/branding/cliqz/default$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -d -m755 "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences"
  _vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -D -m644 /dev/stdin "$_vendorjs" <<END
// Disable update check
pref("app.update.enabled", false);
// Do not update/overwrite search engines
pref("browser.search.update", false);

// Use the classical backspace action
pref("browser.backspace_action", 0);
pref("browser.urlbar.insertMethod", 0);
pref("browser.urlbar.clickSelectsAll", false);

// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m644 mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
}

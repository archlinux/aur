# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
pkgver=1.22.0
pkgrel=1
_cqzbuildid=$(curl "http://repository.cliqz.com.s3.amazonaws.com/dist/release/$pkgver/lastbuildid")
pkgdesc="Firefox-based privacy aware web browser, build from sources"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk2 gtk3 libxt startup-notification dbus-glib nss libvpx libevent
         hunspell hunspell-en_US)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm libnotify gtk2 gtk3 wget pulseaudio)
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/$pkgver.tar.gz"
        init.configure.patch)
sha256sums=('bcb598df874ba5c3fd904ea4f33b05600037062eed33a12899af1f96bda1245f'
            '531ced6caeb57877e2b39d7aeb2eba3c03e15a1aaa5a27df3391e59b7d592549')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver/mozilla-release"
  # Do not try to upload anything anywhere
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk

  # Patch future desktop file, which does not seems to be embed
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s|^Exec=${pkgname}$|Exec=/usr/lib/${pkgname}/${pkgname} %u|" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

  # rust.configure problem
  patch build/moz.configure/init.configure ../../init.configure.patch

  cat >> toolkit/mozapps/installer/linux/rpm/mozilla.desktop <<END
Actions=new-forget-window;

[Desktop Action new-forget-window]
Name=New Forget Window
Name[de]=Neues Vergessen Fenster
Name[en_US]=New Forget Window
Name[fr]=Nouvelle fenêtre en mode oubli
Exec=/usr/lib/cliqz/cliqz --private-window %u
END

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

  # Please enable stylo!
  sed -i '/^ac_add_options --disable-stylo$/d' browser/config/cliqz-release.mozconfig

  cat >> browser/config/cliqz-release.mozconfig <<END

# Archlinux specific additions
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --prefix=/usr
ac_add_options --enable-linker=gold
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd

# Speed up buildtime (thanks bm456)
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests
ac_add_options --disable-parental-controls

# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-libevent
ac_add_options --with-system-png
ac_add_options --enable-pulseaudio
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-updater
END

  # Symbols are build only for windows. Have them back now
  sed -i '/^.\/mach build$/ a ./mach buildsymbols' ../magic_build_and_package.sh
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  export CQZ_RELEASE_CHANNEL=release
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID="$_cqzbuildid"

  # Uncomment the following line to have a german build
  # export CQZ_BUILD_DE_LOCALIZATION=1

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

// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
pref("extensions.shield-recipe-client.enabled", false);
END

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m644 mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# Maintainer: Étienne Deparis <etienne@depar.is>
# This is an ENGLISH ONLY build of the cliqz browser.
# - To build the official deutsch version, read this PKGBUILD and
#   uncomment related lines in build and package function.
# - To build any other l10n version, please refer to my own custom
#   french pkgbuild here: https://git.deparis.io/pkgbuilds/tree/cliqz_work/PKGBUILD?id=17ec1716c90dd08
pkgname=cliqz
_pkgname=browser-f
pkgver=1.29.3
pkgrel=1
_cqzchannel=release
_cqzbuildid=$(curl -s "http://repository.cliqz.com.s3.amazonaws.com/dist/${_cqzchannel}/${pkgver}/lastbuildid")
#_cqzbuildid=20190507112044
pkgdesc="Firefox-based privacy aware web browser, build from sources"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg nss
         ttf-font libpulse sqlite icu)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake
             inetutils xorg-server-xvfb autoconf2.13 rust clang llvm
             jack gtk2 python nodejs python2-psutil cbindgen nasm libnotify
             wget pulseaudio rsync gconf)
optdepends=('hunspell-en_US: Spell checking, American English')
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/$pkgver.tar.gz"
        '0001-Use-remoting-name-for-GDK-application-names.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Use-remoting-name-for-GDK-application-names.patch?h=packages/firefox&id=3dac00b6aefd97b66f13af0ad8761a3765094368')
sha256sums=('05881a2890a3248f7d9e6b38de3784a07e42b1555bd783045976ccb8f42ae24f'
            'ab07ab26617ff76fce68e07c66b8aa9b96c2d3e5b5517e51a3c3eac2edd88894')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver/mozilla-release/toolkit/mozapps/installer"
  # Do not try to upload anything anywhere
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' upload-files.mk

  cd linux/rpm
  # Patch future desktop file, which does not seems to be modified by compilation
  sed -i "s/@MOZ_APP_DISPLAYNAME@/Cliqz/g" mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" mozilla.desktop
  sed -i "s/@MOZ_APP_REMOTINGNAME@/$pkgname/g" mozilla.desktop
  sed -i "s|^Exec=${pkgname}$|Exec=/usr/lib/${pkgname}/${pkgname} %u|" mozilla.desktop
  sed -i 's|^MimeType=.*$|MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;|' mozilla.desktop

  cat >> mozilla.desktop <<END
Keywords=Internet;WWW;Browser;Web;Explorer
Keywords[de]=Internet;WWW;Browser;Web;Explorer;Webseite;Site;surfen;online;browsen
Keywords[fr]=Internet;WWW;Browser;Web;Explorer;Fureteur;Surfer;Navigateur
GenericName[fr]=Navigateur Web
GenericName[de]=Webbrowser
Actions=new-forget-window;

[Desktop Action new-forget-window]
Name=New Forget Window
Name[de]=Neues Vergessen Fenster
Name[en_US]=New Forget Window
Name[fr]=Nouvelle fenêtre en mode oubli
Exec=/usr/lib/cliqz/cliqz --private-window %u
END

  cd "$srcdir/${_pkgname}-$pkgver/mozilla-release"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1530052
  patch -Np1 -i "$srcdir/0001-Use-remoting-name-for-GDK-application-names.patch"

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
  echo -n "e05d56db0a694edc8b5aaebda3f2db6a" > browser/mozilla-desktop-geoloc-api.key

  cat >> browser/config/cliqz-release.mozconfig <<END

# Archlinux specific additions
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --prefix=/usr
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-lto
export MOZ_APP_NAME=cliqz
export MOZ_APP_DISPLAYNAME=Cliqz
export MOZ_APP_REMOTINGNAME=Cliqz
export MOZ_PGO=1
export CC='clang --target=x86_64-unknown-linux-gnu'
export CXX='clang++ --target=x86_64-unknown-linux-gnu'
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
ac_add_options --with-system-png
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-zlib

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-gconf
ac_add_options --disable-updater
ac_add_options --disable-tests
END

  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's|^./mach build$|xvfb-run -a -n 97 -s "-screen 0 1600x1200x24" ./mach build|' magic_build_and_package.sh
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  export CQZ_RELEASE_CHANNEL="$_cqzchannel"
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID="$_cqzbuildid"

  # Uncomment the following line to have a deutsch build
  # Also, change the target object name bellow
  #export CQZ_BUILD_DE_LOCALIZATION=1

  export MOZ_NOSPAM=1
  # LTO needs more open files
  ulimit -n 4096

  ./magic_build_and_package.sh
}

package() {
  install -d -m755 ${pkgdir}/usr/{bin,lib}

  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir"
  # Uncomment the two following lines and comment the en-US ones if you
  # want to build a deutsch version of cliqz.
  #mv "${_pkgname}-$pkgver/obj/dist/$pkgname-$pkgver.de.linux-x86_64.tar.bz2" .
  #tar xjf "$pkgname-$pkgver.de.linux-x86_64.tar.bz2"
  mv "${_pkgname}-$pkgver/obj/dist/$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2" .
  tar xjf "$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2"

  cp -R "$pkgname" "$pkgdir/usr/lib/"

  cd "${_pkgname}-$pkgver"
  for size in 16 22 24 32 48 256; do
    install -D -m644 "mozilla-release/browser/branding/cliqz/default$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -d -m755 "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences"
  cp "$srcdir/${_pkgname}-$pkgver/mozilla-release/toolkit/mozapps/installer/linux/rpm/no-updates.js" vendor.js
  cat >> vendor.js <<END

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
  _vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -D -m644 vendor.js "$_vendorjs"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m644 mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"
}

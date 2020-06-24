# Maintainer: Étienne Deparis <etienne@depar.is>
# This is an ENGLISH ONLY build of the cliqz browser.
# - To build the official deutsch version, read this PKGBUILD and
#   uncomment related lines in build and package function.
# - To build any other l10n version, please refer to my own custom
#   french pkgbuild here: https://git.deparis.io/pkgbuilds/tree/cliqz_work/PKGBUILD?id=17ec1716c90dd08
pkgname=cliqz
_gitname=browser-f
pkgver=1.36.0
pkgrel=1
_cqzchannel=release
_cqzbuildid=$(curl -s "http://repository.cliqz.com.s3.amazonaws.com/dist/${_cqzchannel}/${pkgver}/lastbuildid")
#_cqzbuildid=20190507112044
pkgdesc="Firefox-based privacy aware web browser, built from sources"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg nss
         ttf-font libpulse sqlite icu)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake
             inetutils xorg-server-xvfb autoconf2.13 rust clang llvm
             jack gtk2 python nodejs python2-psutil cbindgen nasm libnotify
             wget pulseaudio rsync)
optdepends=('hunspell-en_US: Spell checking, American English')
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/$pkgver.tar.gz"
        '0001-Bug-1624128-Update-CK_GCM_PARAMS-uses-for-PKCS11-v3..patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Bug-1624128-Update-CK_GCM_PARAMS-uses-for-PKCS11-v3..patch?h=packages/firefox&id=b4b266ae186a92a0516b69a33f2f0e17c31a6d9f'
        '0001-Use-remoting-name-for-GDK-application-names.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Use-remoting-name-for-GDK-application-names.patch?h=packages/firefox&id=b4b266ae186a92a0516b69a33f2f0e17c31a6d9f')
sha256sums=('712e28b767da88bb3defcab9c65b21af85c439aa2fb503161ce53b17903a048e'
            '215ca2cd2994d787c4748b8e76acdc21932700ab43fa6a32aa8de3ce4b380111'
            '5f7ac724a5c5afd9322b1e59006f4170ea5354ca1e0e60dab08b7784c2d8463c')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd "$srcdir/${_gitname}-$pkgver/mozilla-release/toolkit/mozapps/installer"
  # Do not try to upload anything anywhere
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' upload-files.mk

  cd linux/rpm
  # Patch future desktop file, which does not seems to be modified by compilation
  sed -i "s/@MOZ_APP_DISPLAYNAME@/Cliqz/g" mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" mozilla.desktop
  sed -i "s/@MOZ_APP_REMOTINGNAME@/$pkgname/g" mozilla.desktop
  sed -i "s|^Exec=${pkgname}$|Exec=/usr/lib/${pkgname}/${pkgname} %u|" mozilla.desktop
  sed -i 's|^MimeType=.*$|MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;application/pdf;application/json;|' mozilla.desktop

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

  cd "$srcdir/${_gitname}-$pkgver/mozilla-release"

  # https://bugs.archlinux.org/task/66549
  patch -Np1 -i "$srcdir/0001-Bug-1624128-Update-CK_GCM_PARAMS-uses-for-PKCS11-v3..patch"

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

  cd "$srcdir/${_gitname}-$pkgver"
  sed -i 's|^./mach build$|xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" ./mach build|' magic_build_and_package.sh
}

build() {
  cd "$srcdir/${_gitname}-$pkgver"

  export CQZ_RELEASE_CHANNEL="$_cqzchannel"
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID="$_cqzbuildid"

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  # LTO needs more open files
  ulimit -n 4096

  # -fno-plt with cross-LTO causes obscure LLVM errors
  # LLVM ERROR: Function Import: link error
  CFLAGS="${CFLAGS/-fno-plt/}"
  CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  # Add --de switch to have a deutsch build. Also change the target
  # object name bellow.
  ./magic_build_and_package.sh --clobber
}

package() {
  install -d -m755 ${pkgdir}/usr/{bin,lib}

  cd "$srcdir"
  # Uncomment the two following lines and comment the en-US ones if you
  # want to build a deutsch version of cliqz.
  #mv "${_gitname}-$pkgver/obj/dist/$pkgname-$pkgver.de.linux-x86_64.tar.bz2" .
  #tar xjf "$pkgname-$pkgver.de.linux-x86_64.tar.bz2"
  mv "${_gitname}-$pkgver/obj/dist/$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2" .
  tar xjf "$pkgname-$pkgver.en-US.linux-x86_64.tar.bz2"

  cp -R "$pkgname" "$pkgdir/usr/lib/"
  ln -srf "$pkgdir/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "${_gitname}-$pkgver"
  for size in 16 22 24 32 48 256; do
    install -D -m644 "mozilla-release/browser/branding/cliqz/default$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -d -m755 "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences"
  cp "$srcdir/${_gitname}-$pkgver/mozilla-release/toolkit/mozapps/installer/linux/rpm/no-updates.js" vendor.js
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
  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -D -m644 vendor.js "$vendorjs"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m644 mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srf "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}

# Local Variables:
# sh-basic-offset: 2
# End:

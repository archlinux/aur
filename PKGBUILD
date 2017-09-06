# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
pkgver=1.15.0
pkgrel=1
_cqzbuildid=20170830153152
pkgdesc="Firefox-based privacy aware web browser, build from sources"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell sqlite ttf-font libpulse icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf inetutils xorg-server-xvfb
             autoconf2.13 rust)
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/${pkgver}.tar.gz"
        'no-crmf.diff'
        'fix-wifi-scanner.diff')
sha256sums=('52b7a3c91ef4d6751a48ced5cb7bc6f1e3b4a13311ffbef7e008233936530ed3'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd $srcdir/${_pkgname}-${pkgver}/mozilla-release
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s|^Exec=${pkgname}$|Exec=/usr/lib/${pkgname}/${pkgname} %u|" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

  cat >> toolkit/mozapps/installer/linux/rpm/mozilla.desktop <<END
Actions=new-forget-window;

[Desktop Action new-forget-window]
Name=New Forget Window
Name[de]=Neues Vergessen Fenster
Name[en_US]=New Forget Window
Name[fr]=Nouvelle fenêtre en mode oubli
Exec=/usr/lib/cliqz/cliqz --private-window %u
END

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i $srcdir/no-crmf.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i $srcdir/fix-wifi-scanner.diff

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

# Milouse Archlinux specific additions
ac_add_options --prefix=/usr
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"

# System libraries
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
ac_add_options --disable-updater
ac_add_options --enable-default-toolkit=cairo-gtk3

STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd $srcdir/${_pkgname}-$pkgver

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  CPPFLAGS+=" -O2"

  export CQZ_RELEASE_CHANNEL=release
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID=$_cqzbuildid

  ./magic_build_and_package.sh
}

package() {
  install -d -m755 ${pkgdir}/usr/{bin,lib}

  ln -s /usr/lib/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  cd $srcdir
  mv ${_pkgname}-${pkgver}/obj/dist/${pkgname}-${pkgver}.en-US.linux-x86_64.tar.bz2 .
  tar xjf ${pkgname}-${pkgver}.en-US.linux-x86_64.tar.bz2
  cp -R $pkgname ${pkgdir}/usr/lib/

  cd ${_pkgname}-$pkgver
  for size in 16 22 24 32 48 256; do
	install -D -m644 mozilla-release/browser/branding/cliqz/default$size.png \
	                 ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
  done

  install -d -m755 ${pkgdir}/usr/lib/${pkgname}/browser/defaults/preferences
  _vendorjs=${pkgdir}/usr/lib/${pkgname}/browser/defaults/preferences/vendor.js
  install -D -m644 /dev/stdin "$_vendorjs" <<END
// Disable update check
pref("app.update.enabled", false);

// Disable tracking (don't know if still used)
pref("beacon.enabled", false);

// Use the classical backspace action
pref("browser.backspace_action", 0);

// Weird disabled options
pref("browser.search.update", true);

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);
END

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -D -m644 mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

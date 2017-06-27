# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
pkgver=1.14.0
pkgrel=2
_cqzbuildid=20170625170852
pkgdesc="Firefox-based privacy aware web browser"
arch=(i686 x86_64)
url="https://cliqz.com/"
license=(MPL2)
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         nss hunspell sqlite ttf-font libpulse icu libvpx)
makedepends=(unzip zip diffutils python2 yasm mesa gconf inetutils xorg-server-xvfb
             autoconf2.13 cargo gcc5)
conflicts=(cliqz-bin)
source=("https://github.com/cliqz-oss/browser-f/archive/${pkgver}.tar.gz"
        "fix-wifi-scanner.diff")
sha256sums=('7ee4ef2ce237a38b29ddae7c44201b8ba26f06a08e62376fe30b10d01848a317'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd $srcdir/$_pkgname-$pkgver/mozilla-release
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

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

  cat >.mozconfig <<END
ac_add_options --prefix=/usr
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-updater

STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd $srcdir/$_pkgname-$pkgver

  # Rewrite to avoid multiple -pipe
  march=$(gcc -Q --help=target | grep march | sed -nr 's/^.*\s+([^\s]+)$/\1/p')
  CFLAGS="-march=${march} -mtune=generic -O2 -fstack-protector-strong"

  # Hardening is currently deactivated as it hangs on my current machine
  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # Ugly graphic glitches if compiled with gcc7
  export CXX=/usr/bin/g++-5
  export CC=/usr/bin/gcc-5

  export CQZ_RELEASE_CHANNEL=release
  export CQZ_VERSION=$pkgver
  export CQZ_BUILD_ID=$_cqzbuildid

  ./magic_build_and_package.sh
}

package() {
  cd $srcdir

  install -d -m755 ${pkgdir}/usr/{bin,lib}

  ln -s /usr/lib/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  mv $_pkgname-$pkgver/obj/dist/${pkgname}-${pkgver}.en-US.linux-x86_64.tar.bz2 .
  tar xjf ${pkgname}-${pkgver}.en-US.linux-x86_64.tar.bz2
  cp -R $pkgname ${pkgdir}/usr/lib/

  for size in 16 22 24 32 48 256; do
	install -D -m644 $_pkgname-$pkgver/mozilla-release/browser/branding/cliqz/default$size.png \
	                 ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
  done

  install -D -m644 $_pkgname-$pkgver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -D -m644 $_pkgname-$pkgver/mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

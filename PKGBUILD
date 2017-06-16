# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
_vendorname=CLIQZ
pkgver=1.13.6
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser"
arch=('i686' 'x86_64')
url="https://cliqz.com/"
license=('MPL2')
depends=('alsa-lib' 'dbus-glib' 'ffmpeg' 'gtk2' 'gtk3' 'hunspell'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification'
         'ttf-font')
makedepends=('python2' 'zip' 'autoconf2.13' 'yasm' 'libidl2'
             'linux-api-headers' 'rust' 'cargo' 'gcc5')
conflicts=('cliqz-bin')
source=("https://github.com/cliqz-oss/browser-f/archive/${pkgver}.tar.gz"
        "fix-wifi-scanner.diff")
sha256sums=('00889950244c53baeaf6617ed26de3d2bee1a960aaaa0eb74b1fc9e554d49658'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd $srcdir/$_pkgname-$pkgver/mozilla-release
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$_vendorname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

  # We get a 403 on this one
  sed -i 's|CLIQZ_EXT_URL = "http://cdn2.cliqz.com/update/browser/Cliqz.1.13.0.xpi"|CLIQZ_EXT_URL = "http://repository.cliqz.com.s3.amazonaws.com/dist/release/1.13.6/20170522183742/cliqz%40cliqz.com.xpi"|' config/rules.mk

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i $srcdir/fix-wifi-scanner.diff

  # Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
  # Note: These are for Arch Linux use ONLY. For your own distribution, please
  # get your own set of keys. Feel free to contact foutrelis@archlinux.org for
  # more information.
  echo -n "AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM" > google-api-key
  sed -i "s|/builds/google-desktop-api.key|${PWD@Q}/google-api-key|" browser/config/cliqz-release.mozconfig

  # Mozilla API keys (see https://location.services.mozilla.com/api)
  # Note: These are for Arch Linux use ONLY. For your own distribution, please
  # get your own set of keys. Feel free to contact heftig@archlinux.org for
  # more information.
  echo -n "16674381-f021-49de-8622-3021c5942aff" > mozilla-api-key
  sed -i "s|/builds/mozilla-desktop-geoloc-api.key|${PWD@Q}/mozilla-api-key|" browser/config/cliqz-release.mozconfig

  cat >.mozconfig <<END
ac_add_options --prefix=/usr
ac_add_options --enable-gold
ac_add_options --enable-pie

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-alsa
ac_add_options --disable-updater

STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd $srcdir/$_pkgname-$pkgver

  # Rewrite to avoid multiple -pipe
  march=$(gcc -Q --help=target | grep march | sed -nr 's/^.*\s+([^\s]+)$/\1/p')
  CFLAGS="-march=${march} -mtune=generic -O2 -fstack-protector-strong"

  # No need for this one, already in CFLAGS
  # CPPFLAGS+=" -O2"

  # Hardening is currently deactivated as it hangs on my current machine
  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # Ugly graphic glitches if compiled with gcc7
  export CXX=/usr/bin/g++-5
  export CC=/usr/bin/gcc-5

  export CQZ_RELEASE_CHANNEL=release

  ./magic_build_and_package.sh
}

package() {
  cd $srcdir

  install -d -m755 ${pkgdir}/usr/{bin,lib}

  ln -s /usr/lib/${_vendorname}/${_vendorname} ${pkgdir}/usr/bin/${pkgname}

  mv $_pkgname-$pkgver/obj/dist/$_vendorname-$pkgver.en-US.linux-x86_64.tar.bz2 .
  tar xjf $_vendorname-$pkgver.en-US.linux-x86_64.tar.bz2
  cp -R $_vendorname ${pkgdir}/usr/lib/

  for size in 16 22 24 32 48 256; do
	install -D -m644 $_pkgname-$pkgver/mozilla-release/browser/branding/cliqz/default$size.png \
	                 ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png
  done

  install -D -m644 $_pkgname-$pkgver/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -D -m644 $_pkgname-$pkgver/mozilla-release/toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

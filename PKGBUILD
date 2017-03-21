# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
_vendorname=CLIQZ
pkgver=1.11.1
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser"
arch=('i686' 'x86_64')
url="https://cliqz.com/"
license=('MPL2')
depends=('alsa-lib' 'dbus-glib' 'ffmpeg' 'gtk2' 'gtk3' 'hunspell'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification'
         'ttf-font')
makedepends=('python2' 'zip' 'autoconf2.13' 'yasm' 'libidl2' 'linux-api-headers')
conflicts=('cliqz-bin')
source=("https://github.com/cliqz-oss/browser-f/archive/${pkgver}.tar.gz")
sha256sums=('653df00962403baada8632cd07a129601d43b77dbc0ca025521fd84a567c9681')
options=(!emptydirs !makeflags !strip)

prepare() {
  cd $srcdir/$_pkgname-$pkgver/mozilla-release
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$_vendorname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

  cat >.mozconfig <<END
ac_add_options --prefix=/usr
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-rust

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

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

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

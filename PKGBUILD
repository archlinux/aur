# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_pkgname=browser-f
_vendorname=CLIQZ
pkgver=1.11.0
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
source=("https://github.com/cliqz-oss/browser-f/archive/${pkgver}.tar.gz"
        "mozconfig"
        "cliqz")
sha256sums=('ae35e3ac2ac6df6e53fdee30b0053bdf7c79c77f174632b58bdcfcbac99f5cf4'
            'ebb68a51d1289f53e1adb9501d4309db9a0cc73d6eb8da6dc86143f0879b6fc7'
            'cd07bf42ad08a626250572890f1a038a85bc7715637371b23c11b39690ab9c7a')


prepare() {
  cd $srcdir/$_pkgname-$pkgver/mozilla-release
  sed -i 's/ifeq ($(OS_ARCH), Linux)/ifeq ($(OS_ARCH), Nope)/' toolkit/mozapps/installer/upload-files.mk
  sed -i "s/@MOZ_APP_DISPLAYNAME@/$_vendorname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop
  sed -i "s/@MOZ_APP_NAME@/$pkgname/g" toolkit/mozapps/installer/linux/rpm/mozilla.desktop

  cp ../../mozconfig .mozconfig
}

build() {
  cd $srcdir/$_pkgname-$pkgver

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-schedule-insns2"

  ./magic_build_and_package.sh
}

package() {
  cd $srcdir

  install -d -m755 ${pkgdir}/usr/lib
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

  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

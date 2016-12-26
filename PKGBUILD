# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz
_vendorname=CLIQZ
pkgver=1.9.1
_pkgver=20161215122513
_mozver=50.1.0
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser"
arch=('x86_64')
url="https://cliqz.com/"
license=('unknown')
depends=('alsa-lib' 'dbus-glib' 'ffmpeg' 'gtk2' 'gtk3' 'hunspell'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification'
         'ttf-font')
source=("http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/pool/main/c/cliqz/${_vendorname}-${pkgver}-release.${_pkgver}.x86_64.deb"
        "cliqz")
sha256sums=('f0276a2415cf412e794cb00fb1bb1c0320de2a271df676e1810b1e8aa2448543'
            'e0f3000d58d25c3393f4dc9af1a1061e5abfbd29bfaac68093417f153a15d5a2')

prepare() {
  cd $srcdir
  sed -i "s/MOZVER/${_mozver}/" cliqz

  tar xJf data.tar.xz
  sed -i "s/Exec=CLIQZ/Exec=cliqz/" usr/local/share/applications/${_vendorname}.desktop
}

package() {
  cd $srcdir

  install -D -m644 usr/local/share/applications/${_vendorname}.desktop \
		  ${pkgdir}/usr/share/applications/${_vendorname}.desktop

  for size in 16x16 22x22 24x24 32x32 48x48 256x256; do
	install -D -m644 usr/local/share/icons/hicolor/${size}/apps/${_vendorname}.png \
			${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_vendorname}.png
  done

  # License
  install -D -m644 usr/share/doc/cliqz/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -d -m755 ${pkgdir}/usr/lib
  cp -R usr/local/lib/${_vendorname}-${_mozver} ${pkgdir}/usr/lib/

  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

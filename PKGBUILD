# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz-bin
_pkgname=cliqz
_vendorname=CLIQZ
pkgver=1.12.1
_pkgver=20170330140409
_mozver=52.0.2
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser, build from debian package"
arch=('x86_64')
url="https://cliqz.com/"
license=('MPL2')
provides=('cliqz')
conflicts=('cliqz')
depends=('alsa-lib' 'dbus-glib' 'ffmpeg' 'gtk2' 'gtk3' 'hunspell'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification'
         'ttf-font')
source=("http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/pool/main/c/cliqz/${_vendorname}-${pkgver}-release.${_pkgver}.x86_64.deb"
        "https://raw.githubusercontent.com/cliqz-oss/browser-f/${pkgver}/LICENSE")
sha256sums=('30bffd8e7cdda0d074bd04f8bf4f9ee85a50141283fae7d33ed6cb384a69d565'
            '684cef8a799f7f9a3dbffaaad9398b5cd7fd89b2c162cef0d02195bbf18fbe36')

prepare() {
  cd $srcdir

  tar xJf data.tar.xz
  sed -i "s/Exec=CLIQZ/Exec=cliqz/" usr/local/share/applications/${_vendorname}.desktop
}

package() {
  cd $srcdir

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

  install -D -m644 usr/local/share/applications/${_vendorname}.desktop \
		  ${pkgdir}/usr/share/applications/${_vendorname}.desktop

  for size in 16x16 22x22 24x24 32x32 48x48 256x256; do
	install -D -m644 usr/local/share/icons/hicolor/${size}/apps/${_vendorname}.png \
			${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_vendorname}.png
  done

  install -d -m755 ${pkgdir}/usr/lib
  cp -R usr/local/lib/${_vendorname}-${_mozver} ${pkgdir}/usr/lib/${_vendorname}

  install -d -m755 ${pkgdir}/usr/bin
  ln -s /usr/lib/${_vendorname}/${_vendorname} ${pkgdir}/usr/bin/${_pkgname}
}

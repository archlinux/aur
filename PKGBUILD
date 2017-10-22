# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz-bin
_vendorname=cliqz
pkgver=1.16.0
_cqzbuildid=20171017104524
_mozver=56.0.1
pkgrel=2
pkgdesc="Firefox-based privacy aware web browser, repackaged from debian official cliqz repository"
arch=('x86_64')
url="https://cliqz.com/"
license=('MPL2')
provides=('cliqz')
conflicts=('cliqz')
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell sqlite ttf-font libpulse)
source=("http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/pool/main/c/cliqz/${_vendorname}-${pkgver}-release.${_cqzbuildid}.x86_64.deb"
        "https://raw.githubusercontent.com/cliqz-oss/browser-f/master/LICENSE")
sha256sums=('ce090e193359dcd1514bf19fcfb6f561d500cefdc1679786c8089cc628e7dd2c'
            '866824541983ecabc2a8de3296d780e6a22dccba12f3b74ef9abf4f87d71bcbf')

prepare() {
  cd $srcdir
  tar xJf data.tar.xz
  sed -i "s|^Exec=${_vendorname}$|Exec=/usr/lib/${_vendorname}/${_vendorname} %u|" usr/local/share/applications/cliqz.desktop
}

package() {
  cd $srcdir

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_vendorname}/LICENSE

  install -D -m644 usr/local/share/applications/${_vendorname}.desktop \
		  ${pkgdir}/usr/share/applications/${_vendorname}.desktop

  for size in 16x16 22x22 24x24 32x32 48x48 256x256; do
	install -D -m644 usr/local/share/icons/hicolor/${size}/apps/${_vendorname}.png \
			${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_vendorname}.png
  done

  install -d -m755 ${pkgdir}/usr/lib
  cp -R usr/local/lib/${_vendorname}-${_mozver} ${pkgdir}/usr/lib/${_vendorname}

  install -d -m755 ${pkgdir}/usr/bin
  ln -s /usr/lib/${_vendorname}/${_vendorname} ${pkgdir}/usr/bin/${_vendorname}
}

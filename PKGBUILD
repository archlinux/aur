# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz-bin
_vendorname=cliqz
pkgver=1.15.0
_cqzbuildid=20170830153152
_mozver=55.0.3
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser, repackaged from debian official cliqz repository"
arch=('x86_64')
url="https://cliqz.com/"
license=('MPL2')
provides=('cliqz')
conflicts=('cliqz')
depends=('alsa-lib' 'dbus-glib' 'ffmpeg' 'gtk2' 'gtk3' 'hunspell'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types'
         'mozilla-common' 'nss' 'sqlite' 'startup-notification'
         'ttf-font')
source=("http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/pool/main/c/cliqz/${_vendorname}-${pkgver}-release.${_cqzbuildid}.x86_64.deb"
        "https://raw.githubusercontent.com/cliqz-oss/browser-f/master/LICENSE")
sha256sums=('8f9d48e8a0d0d224b5d734605d1b45a2efdf93a5358b2bd4a54c3baad525611d'
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

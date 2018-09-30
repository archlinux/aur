# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=cliqz-bin
_vendorname=cliqz
pkgver=1.22.2
_cqzbuildid=$(curl "http://repository.cliqz.com.s3.amazonaws.com/dist/release/$pkgver/lastbuildid")
pkgrel=1
pkgdesc="Firefox-based privacy aware web browser, repackaged from debian official cliqz repository"
arch=('x86_64')
url="https://cliqz.com/"
license=('MPL2')
provides=('cliqz')
conflicts=('cliqz')
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell ttf-font libpulse)
source=("http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/pool/main/c/cliqz/${_vendorname}-${pkgver}-release.${_cqzbuildid}.x86_64.deb"
        "https://raw.githubusercontent.com/cliqz-oss/browser-f/master/LICENSE")

deb_sha=$(curl -s http://repository.cliqz.com.s3.amazonaws.com/dist/debian-release/dists/stable/main/binary-amd64/Packages | sed -n 's/^SHA256: \(.*\)$/\1/p')
sha256sums=("$deb_sha"
            '7827ad0dcea64dde261a0def466acf701ace81c5b31b4f2f69403c6502411581')

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

  for size in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
	install -D -m644 usr/local/share/icons/hicolor/${size}/apps/${_vendorname}.png \
			${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_vendorname}.png
  done

  install -d -m755 ${pkgdir}/usr/lib
  cp -R usr/local/lib/${_vendorname} ${pkgdir}/usr/lib/${_vendorname}

  install -d -m755 ${pkgdir}/usr/bin
  ln -s /usr/lib/${_vendorname}/${_vendorname} ${pkgdir}/usr/bin/${_vendorname}
}

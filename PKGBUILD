# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=musixmatch-bin
_pkgname=musixmatch
pkgver=0.16.1
pkgrel=1
pkgdesc='Lyrics platform where users can search and share lyrics'
arch=('x86_64')
url='https://www.musixmatch.com/'
license=('custom')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libnotify' 'libxtst' 'nss')
optdepends=('spotify: Display the lyrics of the currently playing song')
source=('eula.html')
sha256sums=('cfbc4ad07b1566e0ebf88927349f35f5064ecf71d363027614ec18ec293f8664')

prepare() {
  curl 'https://download-app.musixmatch.com/' -A 'Linux x86_64' -D headers.txt -OJ
  ar vx ./${_pkgname}_*_amd64.deb
}

pkgver() {
  # Exctract the version from the filename.
  grep -oiP 'content-disposition: attachment; filename=musixmatch_\K([0-9.]+)(?=_amd64.deb.*)' headers.txt
}

package() {
  tar xaf data.tar.xz -C "$pkgdir"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/Musixmatch/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  install -D -m644 eula.html "$pkgdir/usr/share/licenses/$pkgname/eula.html"
}

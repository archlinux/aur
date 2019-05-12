# Maintainer: Brad Erhart <brae.04+aur@gmail.com>
# Contributor: Adriaan Zonnenberg <amz@adriaan.xyz>

pkgname=musixmatch-bin
_pkgname=musixmatch
pkgver=3.2.0
pkgrel=1
pkgdesc='Lyrics platform where users can search and share lyrics'
arch=('x86_64')
url='https://www.musixmatch.com/'
license=('custom')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libnotify' 'libxtst' 'nss')
optdepends=('spotify: Display the lyrics of the currently playing song')
source=('eula.html')
sha256sums=('988119d55691f5bdc91da81d31f2cc460de9c0d74312f4739f813ded7efdf03c')

prepare() {
  curl 'https://download-app.musixmatch.com/' -A 'Linux x86_64' -D headers.txt -Lf -o linux_amd64.deb
}

pkgver() {
  # Extract the version from the filename.
  grep -oiP 'content-disposition: attachment; filename=.*musixmatch_\K([0-9.]+)(?=_amd64.deb.*)' headers.txt
}

package() {
  ar vx "./linux_amd64.deb"
  tar xaf data.tar.xz -C "$pkgdir"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/Musixmatch/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  install -D -m644 eula.html "$pkgdir/usr/share/licenses/$pkgname/eula.html"
}

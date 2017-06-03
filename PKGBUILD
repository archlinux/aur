# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: dacoit <dacoit at tuta dot io>

pkgname=tutanota
pkgver=2.14.4
pkgrel=1
pkgdesc="Web-based client for Tutanota's end-to-end encrypted mail service"
url="https://tutanota.com"
arch=('any')
license=('GPL3')
makedepends=('npm' 'gulp')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "update-karma.patch")
sha256sums=('f0ff0feae83494ce2eb84abdce35c22d16a5d589e42d5044238ca72f1eeb5cfc'
            '5772735c89d935d0511b00b22e50d5424a81ffc682fb473f13810c77e60dea75')

# Set to any value to install a symlink from the document root to the webapp
_doc_root_symlink=
_doc_root="/srv/http"

prepare() {
  cd "$srcdir"
  patch -Np0 < update-karma.patch
}

build() {
  cd "$pkgname-$pkgname-release-$pkgver/web"
  npm install
  gulp dist
}

package() {
  mkdir -p "$pkgdir/usr/share/webapps"
  cp -a "$pkgname-$pkgname-release-$pkgver/web/build" "$pkgdir/usr/share/webapps/$pkgname"

  if [ -n "$_doc_root_symlink" ]; then
    mkdir -p "$pkgdir/$_doc_root"
    ln -s "/usr/share/webapps/$pkgname" "$pkgdir/$_doc_root/$pkgname"
  fi
}

# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: dacoit <dacoit at tuta dot io>

pkgname=tutanota
pkgver=2.14.6
pkgrel=1
pkgdesc="Web-based client for Tutanota's end-to-end encrypted mail service"
url="https://tutanota.com"
arch=('any')
license=('GPL3')
makedepends=('npm' 'gulp')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "update-karma.patch")
sha256sums=('d9af7d3e418c7190c9bfd4735230aece1245605bb508e94346465332c52bb21d'
            '358b76cdfae84faffbdefd6a12c612ac8b95d9a128ef0326d707f70fbde2073f')

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

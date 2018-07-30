# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: dacoit <dacoit at tuta dot io>

pkgname=tutanota
pkgver=2.15.2
pkgrel=1
pkgdesc="Web-based client for Tutanota's end-to-end encrypted mail service"
url="https://tutanota.com"
arch=('any')
license=('GPL3')
makedepends=('npm' 'gulp')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "update-karma.patch")
sha256sums=('5d5ef69b3264e314b6d19a0269628711e16d799e27c46a76d3ad49a022fb2d84'
            '888670d1c21308dae183639179655a0f23e3ec778a3f429a76c745e42f4e01a7')

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

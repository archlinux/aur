# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-git
pkgver=r4065
pkgrel=4
pkgdesc="A Bible study tool -- git version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('dbus-glib' 'webkit2gtk' 'libgsf' 'sword>=1.8.1' 'gtkhtml4' 'biblesync-git')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'git' 'python2' 'docbook-utils')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=(git+https://github.com/crosswire/xiphos.git "http://deb.debian.org/debian/pool/main/x/xiphos/xiphos_4.1.0.1+dfsg1-1.debian.tar.xz")
sha512sums=('SKIP' '7438bc523b8a6d50a2474e43d9057081667436b8292eef9164a5478471e8dc3380f75a84c736ff95ce4ba29bc99588f1a48cf9dfbf5c7c431dd0d53374bfeeb6')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s" $(git rev-list --count HEAD)
}

prepare () {
  cd ${pkgname%-git}
  sed -i 's+src/gnome2/+src/gtk/+g' "$srcdir"/debian/patches/0017*
  patch -Np1 < "$srcdir"/debian/patches/0016*
  patch -Np1 < "$srcdir"/debian/patches/0017*
}

build() {
  cd ${pkgname%-git}
  python2 ./waf --prefix=/usr --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --enable-webkit2 build 
}

package() {
  cd ${pkgname%-git}
  python2 ./waf --destdir="$pkgdir" --no-post-install install 
}

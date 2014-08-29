# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=edgar
pkgname=$_pkgname-git
pkgver=0.2.0.r5.af2bd6a
pkgrel=1
pkgdesc="Enlightenment module: Load Python gadgets"
arch=('i686' 'x86_64')
url="https://git.enlightenment.org/enlightenment/modules/edgar.git"
license=('GPL3' 'LGPL3')
depends=('enlightenment' 'python-efl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  find "$srcdir/$_pkgname/GADGETS" -name Makefile -exec sed -i '/^gadget_folder/ s/ = /&${DESTDIR}/' {} \;
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make

  pushd GADGETS
  for _gadget in *; do
    pushd $_gadget
    make
    popd
  done
  popd
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  pushd GADGETS
  for _gadget in *; do
    pushd $_gadget
    make DESTDIR="$pkgdir" install
    popd
  done
  popd

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README
}

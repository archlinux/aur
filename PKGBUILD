# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=econcentration
pkgname=$_pkgname-git
pkgver=0.1.0alpha.r28.3257d79
pkgrel=1
pkgdesc="Game to improve you concentration and memory skills based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'FDL' 'LGPL' 'GPL')
depends=('elementary' 'etrophy')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/games/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  v_ver=$(awk -F , -v v_ver=$v_ver '/^AC_INIT/ {gsub(/v_ver/, v_ver); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README

# install license files
  install -Dm644 COPYING_IMAGES "$pkgdir/usr/share/licenses/$pkgname/COPYING_IMAGES"
}

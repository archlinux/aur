# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=etui
pkgname=$_pkgname-git
pkgver=0.0.2.r183.b2ebc49
pkgrel=1
pkgdesc="Multi-document rendering application and library using the EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3' 'AGPL3')
depends=('elementary' 'freetype2' 'openjpeg' 'libarchive' 'djvulibre' 'ewebkit' 'ghostscript')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("git://github.com/vtorri/etui.git")
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

  export CFLAGS="$CFLAGS -fvisibility=hidden -I/usr/include/ghostscript"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README
}

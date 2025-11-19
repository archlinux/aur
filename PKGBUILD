# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom:ISC')
depends=('glibc')
makedepends=('git' 'bmake' 'libseccomp' 'libmd')
_commit='0bc8a1114d76e8deec7857c76cd8faac516e096d'
source=("git+https://github.com/kristapsdz/kcgi.git#commit=$_commit")
b2sums=('3fa6c236f272d0a034ba05be36bdc776fb23d10f68a978a837b2f0d2acde8ecf2196a1df79c8d3dc0f7033fc380906b8e2e5a0be5612b636c449250a340032f2')

pkgver() {
  cd kcgi

  git describe --tags | sed -e 's/VERSION_//' -e 's/_/./g'
}

prepare() {
  cd kcgi

  ./configure \
    PREFIX=/usr \
    MANDIR=/usr/share/man \
    SBINDIR=/usr/bin \
    LDFLAGS="$LDFLAGS"

  # This is a bit hackish, but it manages to add the linker flags for kfcgi.
  # The "configure" script picks LDFLAGS from the environment, but then it
  # does not use the variable in the target ¯\_(ツ)_/¯
  echo 'LDADD_LIB_SOCKET += $(LDFLAGS)' >> Makefile.configure

  # enable seccomp filter
  sed -i 's/#CPPFLAGS/CPPFLAGS/' Makefile
}

build() {
  cd kcgi

  bmake
}

check() {
  cd kcgi

  bmake regress
}

package() {
  cd kcgi

  bmake DESTDIR="$pkgdir" install

  strip -x --strip-unneeded "$pkgdir/usr/bin/kfcgi"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}

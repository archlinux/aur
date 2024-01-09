# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=0.13.3
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom:ISC')
depends=('glibc')
makedepends=('git' 'bmake' 'libseccomp' 'libmd')
_commit='e97370540b4917c78bf3405ddc821ffad8407d69'
source=("git+https://github.com/kristapsdz/kcgi.git#commit=$_commit")
b2sums=('SKIP')

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

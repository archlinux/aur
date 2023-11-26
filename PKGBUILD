# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>

pkgname=kcgi
pkgver=0.13.2
pkgrel=1
pkgdesc="Minimal CGI and FastCGI library"
arch=('i686' 'x86_64')
url="http://kristaps.bsd.lv/kcgi/"
license=('custom:ISC')
depends=('glibc')
makedepends=('git' 'bmake' 'libseccomp' 'libmd')
_commit='b5e880fd47041d9f2f88f6e62c54b6e6689de4d5'
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

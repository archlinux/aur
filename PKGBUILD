# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Maintainer: Shang Yuanchun <idealities@gmail.com>

pkgname=systemtap-git
pkgver=4.0.102.g1832b8f51
pkgrel=1
pkgdesc="provides infrastructure to simplify the gathering of information about the running Linux system."
url="https://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'json-c' 'avahi' 'readline' 'nspr')
makedepends=('git' 'python-setuptools' 'xmlto' 'cpio')
optdepends=('sqlite')
provides=(systemtap=4.0)
conflicts=(systemtap)
_gitroot=https://sourceware.org/git/systemtap.git
_gitname=systemtap
source=("git+$_gitroot")
md5sums=('SKIP')
install=systemtap.install

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed 's/release-//;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  msg "Starting make..."

  # docs failed to build
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-python3 \
    --enable-pie \
    --disable-docs \
    --enable-htmldocs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install

  # glibc 2.30-2 already provides these two files
  rm -f "$pkgdir"/usr/include/sys/sdt-config.h
  rm -f "$pkgdir"/usr/include/sys/sdt.h

  cd "${pkgdir}"
  pushd var >/dev/null
  rmdir -p run/stap-server log
  popd >/dev/null
  rmdir var
}

# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Maintainer: Shang Yuanchun <idealities@gmail.com>

pkgname=systemtap-git
pkgver=4.0.83.gaacee6563
pkgrel=1
pkgdesc="provides infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'json-c' 'avahi')
makedepends=('git' 'python-setuptools' 'xmlto' 'cpio')
optdepends=('sqlite3' 'linux-fedora: for debug enabled kernel' 'linux-lily-debug: for debug enabled kernel')
provides=(systemtap=4.0)
conflicts=(systemtap)
_gitroot=git://sourceware.org/git/systemtap.git
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
    --libdir=/usr/lib/"${_gitname}" \
    --libexecdir=/usr/lib/"{${_gitname}" \
    --with-python3 \
    --enable-pie \
    --disable-docs \
    --enable-htmldocs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"
  pushd var >/dev/null
  rmdir -p run/stap-server log
  popd >/dev/null
  rmdir var
}

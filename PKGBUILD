# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=systemtap-git
pkgver=3.0.240.g2c58b79
pkgrel=1
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'avahi')
makedepends=('git')
optdepends=('sqlite3' 'linux-fedora: for debug enabled kernel' 'linux-lily-debug: for debug enabled kernel')
provides=(systemtap=3.0)
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
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --libexecdir=/usr/lib \
    --with-python3 \
    --disable-docs
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

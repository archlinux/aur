# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Maintainer: Shang Yuanchun <idealities@gmail.com>

pkgname=systemtap-git
pkgver=4.0.84.g68bd23fd0
pkgrel=1
pkgdesc="provides infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('elfutils' 'nss' 'python' 'json-c' 'avahi')
makedepends=('git' 'python-setuptools' 'xmlto' 'cpio')
optdepends=('sqlite')
provides=(systemtap=4.0)
conflicts=(systemtap)
_gitroot=git://sourceware.org/git/systemtap.git
_gitname=systemtap
source=("git+$_gitroot"
        remove-install-exec-hook.patch)
md5sums=('SKIP'
         '6db56245ab316134c9a487e16ea52084')
install=systemtap.install

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed 's/release-//;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir"/remove-install-exec-hook.patch
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
    --libexecdir=/usr/lib/"${_gitname}" \
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

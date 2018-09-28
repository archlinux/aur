# Maintainer: Joe Hillenbrand <joehillen@gmail.com>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guix-git
pkgver=v0.15.0.r2025.g02817df07
pkgrel=2
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
depends=('bzip2'
         'glibc'
         'gnutls'
         'graphviz'
         'guile'
         'guile-json'
         'guile-gcrypt'
         'guile-git-lib'
         'guile-sqlite3'
         'libgcrypt'
         'patch'
         'sqlite'
         'xz')
makedepends=('autoconf'
             'automake'
             'gettext'
             'git'
             'help2man'
             'm4'
             'make'
             'pkg-config')
optdepends=('emacs: emacs interface')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
source=(git://git.sv.gnu.org/guix.git)
sha256sums=('SKIP')
provides=('guix')
conflicts=('guix')
install=guix.install

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}

  _compl="--with-bash-completion-dir=\"$(pkg-config --variable=completionsdir bash-completion)\"" || _compl=""

  msg2 'Building...'
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/guix \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/guix \
    --localstatedir=/var/lib/guix \
    $_compl \
    --disable-rpath \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

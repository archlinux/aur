# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guix-git
pkgver=20160111
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
depends=('bzip2'
         'glibc'
         'gnutls'
         'graphviz'
         'guile'
         'guile-json'
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
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  _compl_dir="$(pkg-config --variable=completionsdir bash-completion)"

  msg2 'Building...'
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/guix \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/guix \
    --localstatedir=/var/lib/guix \
    --with-bash-completion-dir="$_compl_dir" \
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

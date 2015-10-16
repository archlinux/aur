# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cvsync
pkgver=0.24.19
pkgrel=1
pkgdesc="portable CVS repository synchronization utility"
arch=('i686' 'x86_64')
depends=('libgcrypt')
url="http://www.cvsync.org/"
license=('BSD')
source=('cvsync.conf' 'cvsyncd.conf' 'cvsyncd.service' 'cvsync.service' 'cvsync.timer')
post_install=cvsync.install
noextract=("${source[@]%%::*}")
md5sums=('7ccdb0492c98733a00d7e53b3394082a'
         '0436a56ad2d25661977d6286b304339d'
         '3317d5b6bbde39ff5f512b8b69b21ea2'
         '70d3e4f6dce199a8b3246f0d1a7d9514'
         '0cb407af2e9a818a6ed3087c9130f2db')

_gitroot=https://github.com/cvsync/cvsync
_gitname=cvsync

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make HASH_TYPE=libgcrypt
}

package() {
  cd "$pkgdir"
  mkdir -p "etc" "usr/bin" "usr/man/man1" "usr/lib/systemd/system"
  cd "$srcdir/$_gitname-build"
  make HASH_TYPE=libgcrypt PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

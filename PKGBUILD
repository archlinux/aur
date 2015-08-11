# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=pwexec-git
pkgver=20120419
pkgrel=1
pkgdesc="Replace command line argument with a password stored in GNOME Keyring and execute."
arch=('i686' 'x86_64')
url="https://github.com/dayflower/pwexec"
license=('MIT')
groups=()
depends=(libgnome-keyring)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/dayflower/pwexec
_gitname=pwexec

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

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

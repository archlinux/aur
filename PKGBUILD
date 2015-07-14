# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname='bsdwhois-drizztbsd-git'
pkgver=20111104
pkgrel=1
pkgdesc='FreeBSD Whois Client - Git Version (drizztbsd version)'
url='https://github.com/drizztbsd/bsdwhois'
arch=('i686' 'x86_64')
license=('BSD')

_gitroot='https://github.com/drizztbsd/bsdwhois.git'
_gitname='bsdwhois'

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

  autoreconf -i
  ./configure --prefix=/usr --program-prefix=bsd
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

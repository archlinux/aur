# Contributor: Camille <onodera@rizon>
# Contributor: Alad <alad@archlinux.info>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wmutils-git
pkgver=1.1.r0.g7b86e8b
pkgrel=1
pkgdesc="A set of tools for X windows manipulation."
url="https://github.com/wmutils/core"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libxcb')
conflicts=('wmutils')
source=("$pkgname::git+https://github.com/wmutils/core.git"
        'git+https://github.com/wmutils/opt.git'
        'git+https://github.com/wmutils/contrib.git')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "$srcdir/$pkgname"
  make
  cd "$srcdir/opt"
  make
  cd "$srcdir/contrib/killwa"
  make
}

package() {
  prefix="/usr"
  manprefix="$prefix/share/man"
  licenseprefix="/usr"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="$prefix" MANPREFIX="$manprefix" install
  install -Dm644 LICENSE $pkgdir/$licenseprefix/share/licenses/$pkgname/LICENSE
  cd "$srcdir/opt"
  make DESTDIR="$pkgdir" PREFIX="$prefix" MANPREFIX="$manprefix" install
  mkdir -p "$pkgdir/$prefix/share/doc/wmutils/examples"
  install -Dm644 ../contrib/*.sh $pkgdir/$prefix/share/doc/wmutils/examples
  install -m755 ../contrib/killwa/killwa $pkgdir/$prefix/bin/killwa
}


# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=task-git
pkgver=v2.6.1.r44.g4fa1c0bcf
pkgrel=1
pkgdesc="A command-line todo list manager"
arch=('i686' 'x86_64')
url="http://taskwarrior.org/"
license=('MIT')
depends=('gcc-libs' 'util-linux' 'gnutls')
makedepends=('git' 'cmake')
optdepends=('bash-completion'
 'python: for python export addon'
 'ruby: for ruby export addon'
 'perl: for perl export addon'
 'perl-json: for perl export addon'
 'rsync: synchronisation via rsync'
 'curl: synchronisation via http(s)/ftp'
 'openssh: synchronisation via ssh')
provides=('task=2.6.1')
conflicts=('task')
install="task.install"
source=("$pkgname"::'git+https://github.com/GothenburgBitFactory/taskwarrior.git#branch=develop')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  msg "Starting cmake..."

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ./

  msg "Starting make..."
  make CXXFLAGS="$CXXFLAGS" || return 1
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --match "[1-9vs]*" | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install/strip
  mkdir -p $pkgdir/usr/share/zsh/site-functions
  cp scripts/zsh/_task $pkgdir/usr/share/zsh/site-functions/
}

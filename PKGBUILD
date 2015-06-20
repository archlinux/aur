# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=task-git
pkgver=s2.4.5.r2.g5b675ea
pkgrel=1
pkgdesc="A command-line todo list manager"
arch=('i686' 'x86_64')
url="http://taskwarrior.org/projects/show/taskwarrior/"
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
provides=('task=2.4.4')
conflicts=('task')
install="task.install"
source=("$pkgname"::'git+https://git.tasktools.org/scm/tm/task.git#branch=2.4.5')
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
  git describe --match "[1-9vs]*" | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install/strip
  mkdir -p $pkgdir/usr/share/zsh/site-functions
  cp scripts/zsh/_task $pkgdir/usr/share/zsh/site-functions/
}

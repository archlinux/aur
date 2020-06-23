# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyssh-git
pkgver=20190101.r14.g7e2b402
pkgrel=1
pkgdesc="Minimalistic SSH server"
arch=('i686' 'x86_64')
url="https://tinyssh.org/"
license=('custom:Public Domain')
depends=('glibc')
makedepends=('git')
provides=('tinyssh')
conflicts=('tinyssh')
source=("git+https://github.com/janmojzis/tinyssh.git"
        "tinyssh@.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/tinyssh@.service?h=packages/tinyssh"
        "tinyssh@.socket::https://git.archlinux.org/svntogit/community.git/plain/trunk/tinyssh@.socket?h=packages/tinyssh"
        "tinysshgenkeys.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/tinysshgenkeys.service?h=packages/tinyssh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "tinyssh"

  echo "/usr/bin" > "conf-bin"
}

pkgver() {
  cd "tinyssh"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tinyssh"

  make
}

package() {
  cd "tinyssh"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/tinyssh"

  install -Dm644 "$srcdir"/{tinysshgenkeys.service,tinyssh@.service,tinyssh@.socket} \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm644 "LICENCE" -t "$pkgdir/usr/share/licenses/tinyssh"
}

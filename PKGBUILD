# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup-git
_pkgname=borg
pkgver=0.23.0.r86.g3be55be
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups."
url="https://borgbackup.github.io/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'openssl'
         'python-msgpack')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: mounting backups as a FUSE filesystem')
makedepends=('cython'
             'git'
             'python-sphinx')
provides=('borgbackup')
conflicts=('borgbackup')
source=("git+https://github.com/borgbackup/borg")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/docs"
  PYTHONPATH=.. make man
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 "docs/_build/man/borg-deduplicatingarchiver.1" "$pkgdir/usr/share/man/man1/borg.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py -q install --root="$pkgdir" --optimize=1
}

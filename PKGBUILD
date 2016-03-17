# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=borgbackup-git
_pkgname=borg
pkgver=1.0.0.r27.gf0cb637
pkgrel=1
pkgdesc="Deduplicating backup program with compression and authenticated encryption"
url="https://borgbackup.github.io/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'lz4'
         'openssl'
         'python-msgpack'
         'python-setuptools'
         'xz')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: mounting backups as a FUSE filesystem')
makedepends=('cython'
             'git'
             'python-sphinx')
provides=('borgbackup')
conflicts=('borgbackup')
source=("${_pkgname}::git+https://github.com/borgbackup/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
  cd docs
  make man
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 "docs/_build/man/borg.1" "$pkgdir/usr/share/man/man1/borg.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py -q install --root="$pkgdir" --optimize=1
}

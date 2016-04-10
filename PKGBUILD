# Maintainer: Lauri Niskanen <ape@ape3000.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=borg-git
_pkgname=borg
pkgver=1.0.1.r74.gd4aac62
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
provides=('borg' 'borgbackup-git')
conflicts=('borg' 'borgbackup-git')
source=("${_pkgname}::git+https://github.com/borgbackup/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=borgbackup-git
_pkgname=borg
pkgver=0.27.0.r246.g44083f7
pkgrel=1
pkgdesc="A deduplicating backup program for efficient and secure backups"
url="https://borgbackup.github.io/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('acl'
         'lz4'
         'openssl'
         'python-msgpack'
         'xz')
optdepends=('openssh: repositories on remote hosts'
            'python-llfuse: mounting backups as a FUSE filesystem')
makedepends=('cython'
             'git'
             'python-mock'
             'python-sphinx')
provides=('borgbackup')
conflicts=('borgbackup')
source=("${_pkgname}::git+https://github.com/borgbackup/borg.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py -q build
  cd docs; make man html
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 "docs/_build/man/borg-deduplicatingarchiver.1" \
    "${pkgdir}/usr/share/man/man1/borg.1"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}

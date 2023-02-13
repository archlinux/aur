# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap-improved
_pkgname=namcap
pkgver=3.3.1+r28+g96e0041
pkgrel=1
pkgdesc="Improved Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'python-pyelftools')
#checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
conflicts=("namcap=$pkgver")
provides=("namcap")
_commit=96e0041a6edadebbaad8cbad114d78889f17f8db
source=("git+https://gitlab.archlinux.org/pacman/namcap.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Warn about transitive dependencies
  git cherry-pick -n 0eae4544f05832fe05970c7b7e4b7d0f5acdaab3
  git cherry-pick -n 37c05449863e0077e7775e1599a2f44f231c4654

  # pydepends: Various improvements
  git cherry-pick -n b68d0c7c0c6d124cbcb0e79eb9791c556af451cb

  # sodepends: Fix soname detection
  git cherry-pick -n 6a38ddb3516ccc2841eed9cf5e1659a87bb50269
}

build() {
  cd $_pkgname
  python setup.py build
}

#check() {
#  cd $_pkgname
#  env PARSE_PKGBUILD_PATH="${srcdir}/$_pkgname" \
#      PATH="${srcdir}/$_pkgname/scripts:$PATH" \
#      pytest
#}

package() {
  cd $_pkgname
  python setup.py install --root="${pkgdir}"
}

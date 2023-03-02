# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap-improved
_pkgname=namcap
pkgver=3.3.1+r35+ge9ee31d
pkgrel=7
pkgdesc="Improved Pacman package analyzer"
arch=('any')
url='https://gitlab.archlinux.org/pacman/namcap'
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'python-pyelftools')
#checkdepends=('systemd' 'python-pytest' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
conflicts=("namcap=$pkgver")
provides=("namcap")
_commit=e9ee31db235e0e64a5de3f509ef3bc14f7539afc
source=("git+https://gitlab.archlinux.org/pacman/namcap.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # pydepends: Various improvements
  git cherry-pick -n e944c5927dee39cfebc70a98888213b1bdd7c945

  # New checks for optdepends and sodepends
  git cherry-pick -n 0023454b0eff2a422722fb1340e1652374e9100f

  # Add support for symlinked license dir
  git cherry-pick -n 1f61dcebcffb6b4f1072b61b8677a2e1a33c39ae

  # Add pcdepends rule
  git cherry-pick -n ac1c60c67fc5a3c2686a392f5370777f7f1e2da8
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

# Maintainer : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=namcap-improved
_pkgname=namcap
pkgver=3.3.1
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
_commit=c4958720dc8b077e1c0b1f3cec38e20822e73039  # tags/3.3.1^0
source=("git+https://gitlab.archlinux.org/pacman/namcap.git#commit=$_commit"
	ec070f25882f6dadc8fdfcd268dddcd8253cb300.patch
	437768dddb71dbb9bd866102852b9d1b0f6c7183.patch)
sha512sums=('SKIP'
            '3a3da0c6aa981a13778afc9eed8f30144b5071348a8839f8328a52fa1856d2ec790bd6b6d6d5c6979a9a645d675d5fd8a748436195fce0f7d824cdb2aa35087e'
            '16111ccb256b9dcb7e1d695664efc276b3e9a447e12c35d831c0412c9ec67e717727fbc58411742dadab40de98e7635806519842ea56e65d1d275b6f09ded7f9')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # runpath: use list instead of generator
  git cherry-pick -n 5c20538fd5eda8d1bbc4651267f0f7c0b03b1a28

  # Warn about transitive dependencies
  git cherry-pick -n 0e1fe1c5bf785ed3c01f4d4c214ca90e44ebdc49

  # Fix handling debug packages
  git cherry-pick -n 26b5d1884210db6965801bd57503572abdf62cda

  # sodepends: fix listing binaries, check libdepends, libprovides
  git cherry-pick -n c9089c4560e05e84546bdf3b5d04e9d4afa94362
  git cherry-pick -n fca659af183369b3ff31ceb837b3e58e813937f5
  git cherry-pick -n f251e9c358ebab23311e531bca088023c3f2de2f

  # Add basic colored output
  git cherry-pick -n 9d32286ee510a0a2cc8fbcd16485f9be0fa77673

  #pydepends: Various improvements
  git cherry-pick -n 9d5f383d5ad91dadadc3cfc2c28ac0dc08202c6e

  # sodepends: Read DT_RUNPATH too
  git cherry-pick -n 78521a7e6661b2f35619b75be41e3343fb25dcf0
#  git cherry-pick -n ec070f25882f6dadc8fdfcd268dddcd8253cb300
  git apply -3 ../ec070f25882f6dadc8fdfcd268dddcd8253cb300.patch

  # Print list of files needed by uninstalled library
#  git cherry-pick -n 437768dddb71dbb9bd866102852b9d1b0f6c7183
  git apply -3 ../437768dddb71dbb9bd866102852b9d1b0f6c7183.patch
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

# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=commit-patch
pkgver=2.6.2
pkgrel=1
pkgdesc="Commit partial patches to version control"
arch=('any')
url="http://www.porkrind.org/${pkgname}"
_repourl="https://github.com/caldwell/${pkgname}"
license=('GPL-2.0-or-later')
depends=('perl' 'patch' 'patchutils')
makedepends=('git')
checkdepends=('mercurial' 'subversion' 'darcs')
optdepends=('git' 'mercurial' 'subversion' 'darcs')
source=("${pkgname}::git+${_repourl}.git#tag=${pkgver}"
        *.patch)
b2sums=('SKIP'
        'ecb9ebce304c9691aac3009ef64ca7528d14f7262e39b81ce337856a100ae46d1bc8572f36fe49214d1db83b1275ce97a7f05ae4304f9b362dce7a26b5136905'
        '9d5870390cc38af40e6e7b0043ec3430e2ec2a632ccb5c789fb771828ef47ce5299f15945c0816f4e36afae84610ddfacf71ded59df0f74b9d75486d6424d115'
        '624e5e0c81af864b3ec0189e7f1c93301ce2c186b1d647b0112635223a51032d7ffdb073eef721b020b04cca4db33e5f04f0a11507bbb3bfc2c96e1e720343e3'
        '1973a026c1baa67bc19511dcf93b4aaab8ab683e89830cde4544c0bc170cdb233c063e6f92ec7050117037b5f813c68a8547ed425950951beaec4d7f6a83bc9c')

prepare() {
  cd "${srcdir}/${pkgname}"

  echo "Reverting Makefile commit that broke the installation (a33567f)..."
  git revert --no-edit --no-commit a33567f5df04eeefc707f4ba8ea6aff32fd1a1e7
  echo "Done."

  git apply -p1 --verbose ../*.patch
}

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="$pkgdir"/usr install
}

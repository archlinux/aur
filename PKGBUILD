# Maintainer: envolution
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=commit-patch
pkgver=2.6.2
pkgrel=3
pkgdesc="Commit partial patches to version control"
arch=('any')
url="http://www.porkrind.org/${pkgname}"
_repourl="https://github.com/caldwell/${pkgname}"
license=('GPL-2.0-or-later')
depends=('perl' 'patch' 'patchutils')
makedepends=('git')
checkdepends=('perl-ipc-run' 'mercurial' 'subversion' 'darcs')
optdepends=('git' 'mercurial' 'subversion' 'darcs')
source=("${pkgname}::git+${_repourl}.git#tag=${pkgver}"
  fix-git-test.patch remove-bzr.patch remove-cvs.patch remove-monotone.patch)
sha1sums=('79c6ba9a7607ceca8811a600d47a8c90edb35cb4'
          'c7415ac561b427ce2b93e58b0090c01332f6b7a0'
          '539f2ba4d76f494611dc6d2586b505a742337a70'
          'e387de5636abfe7953ee5f64363fcbc4ee093fce'
          '68362c243f5f35313eb825037d81d247dc035299')
prepare() {
  cd "${srcdir}/${pkgname}"
  if [ $pkgver == 2.6.2 ]; then
    echo "Reverting Makefile commit that broke the installation (a33567f)..."
    git revert --no-edit --no-commit a33567f5df04eeefc707f4ba8ea6aff32fd1a1e7
    echo "Done."
  fi
  git apply -p1 --verbose ../fix-git-test.patch
  git apply -p1 --verbose ../remove-bzr.patch
  git apply -p1 --verbose ../remove-cvs.patch
  git apply -p1 --verbose ../remove-monotone.patch
}
check() {
  cd "${srcdir}/${pkgname}"
  make test
}
package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
  make PATH="/usr/bin/core_perl:$PATH" PREFIX="$pkgdir"/usr install
}
# vim:set ts=2 sw=2 et:

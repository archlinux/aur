# Maintainer: envolution
# Contributor: Martin Rys <rys.pw/contact>
# shellcheck shell=bash disable=SC2034,SC2154
# Previous maintainer: navigaid <navigaid@gmail.com>

pkgname=proot
pkgver=5.4.0
pkgrel=2
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup"
arch=('i686' 'x86_64')
url="https://proot-me.github.io/"
license=('GPL-2.0-only')
depends=('python' 'talloc')
makedepends=('git' 'python-docutils' 'libxslt')
#pulling this tag due to chdir functionality failure and inactivity in branch (2 years)
_tag='5f780cba57ce7ce557a389e1572e0d30026fcbca'
source=(
  git+https://github.com/cedric-vincent/${pkgname}.git#commit=${_tag}
  tracee_include.patch::https://github.com/proot-me/proot/pull/397.patch
  py313-imp-importlib.patch::https://github.com/proot-me/proot/pull/398.patch
)
sha256sums=('27e88869a8394fd7f5b81b806e2ed612e714d8eaf6888b203c0b70846738201e'
            'a2daf48cf4042c2e949ef827a0f2554dd2a513c25e3567eaa65fb0900bb9b19b'
            '4c1149819e5aafc088b0dadbd8a9ddf6ca8e6b9ceb10b9574704f68f5a8549a2')

prepare() {
  cd ${pkgname}
  git apply ../tracee_include.patch
  git apply ../py313-imp-importlib.patch
#  sed -i \
#    -e "s/^GIT_VERSION :=.*/GIT_VERSION := ${pkgver}/" \
#    -e "s/^GIT_COMMIT :=.*/GIT_COMMIT := unknown/" \
#    src/GNUmakefile
}

check() {
  local _path="${srcdir}/${pkgname}"
  cd ${_path}/test; make -f GNUmakefile
}

build() {
  export PREFIX="/usr"
  local _path="${srcdir}/${pkgname}"
  cd ${_path}/src; make -f GNUmakefile
  cd ${_path}/doc; make -f GNUmakefile
}

package() {
  local _path="${srcdir}/${pkgname}"
  cd ${_path}/src; DESTDIR="${pkgdir}" make -f GNUmakefile install proot

  install -Dm644 -T ${_path}/doc/proot/man.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 ${_path}/CHANGELOG.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ${_path}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a ${_path}/doc/care/* "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:

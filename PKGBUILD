# Maintainer: libele <libele@disroot.org>

pkgname=inform-git
_gitpkg=inform6unix
pkgver=6.41.r4.0.g3ab2ba2
pkgrel=1
pkgdesc="The Inform 6 compiler, standard library, and PunyInform library (git version)"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/DavidGriffith/inform6unix"
license=('Artistic2.0' 'MIT')
provides=('inform')
conflicts=('inform')
groups=(inform)
depends=('perl' 'ruby')
makedepends=('git')
provides=('punyinform=4.0')
source=('git+https://gitlab.com/DavidGriffith/inform6unix.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkg}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

prepare() {
  cd "${srcdir}/${_gitpkg}"
  git worktree add "${srcdir}/${_gitpkg}-dev" dev

  make submodules

  cd "${srcdir}/${_gitpkg}-dev"
  make submodules
}

build() {
  cd "${srcdir}/${_gitpkg}"
  make PREFIX=/usr MAN_PREFIX=/usr/share

  cd "${srcdir}/${_gitpkg}-dev"
  make PREFIX=/usr MAN_PREFIX=/usr/share
}

package() {
  cd "${srcdir}/${_gitpkg}"
  make REAL_PREFIX=/usr PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install

  cd "${srcdir}/${_gitpkg}-dev"
  make REAL_PREFIX=/usr PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install-alt

  cd "${pkgdir}"/usr/share/inform/std/lib
  install -Dm644 ARTISTIC "${pkgdir}"/usr/share/licenses/inform-git/inform/ARTISTIC

  cd "${pkgdir}"/usr/share/inform/punyinform
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/inform-git/punyinform/LICENSE

  cd "${pkgdir}"/usr/man/man1
  install -Dm644 inform.1 "${pkgdir}"/usr/share/man/man1/inform.1
  rm -rf "${pkgdir}"/usr/man

  cd "${pkgdir}"/usr/bin
  rm pblorb scanblorb
}

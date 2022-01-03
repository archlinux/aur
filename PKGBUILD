# maintainer: libele <libele@disroot.org>

pkgname=inform-git
_gitpkg=inform6unix
pkgver=6.35.r8.0.g81e7788
pkgrel=1
pkgdesc="Interactive fiction compiler (git version)"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="http://www.inform-fiction.org/"
license=('Artistic2.0' 'MIT')
provides=('inform')
conflicts=('inform')
groups=(inform)
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

  cd "${pkgdir}"/usr/bin
  rm pblorb scanblorb
}

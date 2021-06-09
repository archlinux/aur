# maintainer: libele <libele@disroot.org>

pkgname=inform-git
_gitpkg=inform6unix
pkgver=6.35.r1.0.gf72cb72
pkgrel=2
pkgdesc="Interactive fiction compiler (git version)"
arch=(i686 x86_64)
url="http://www.inform-fiction.org/"
license=('custom:"freeware"')
depends=('glibc')
provides=('inform')
conflicts=('inform')
groups=(inform)
source=('git+https://gitlab.com/DavidGriffith/inform6unix.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkg}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

prepare(){
  cd "${srcdir}"/"${_gitpkg}"
  make submodules
}

build(){
  cd "${srcdir}"/"${_gitpkg}"
  make PREFIX=/usr MAN_PREFIX=/usr/share
}

package() {
  cd "${srcdir}"/"${_gitpkg}"
  make PREFIX="${pkgdir}"/usr MAN_PREFIX="${pkgdir}"/usr/share install

  sed 's,^LIBPATH.*,LIBPATH=/usr/share/inform,g' "${srcdir}"/"${_gitpkg}"/punyinform.sh > "${pkgdir}"/usr/bin/punyinform.sh
  rm "${pkgdir}"/usr/bin/punyinform
  mv "${pkgdir}"/usr/bin/punyinform.sh "${pkgdir}"/usr/bin/punyinform
}

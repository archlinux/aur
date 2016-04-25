# Maintainer: Noel Maersk <veox at wemakethings dot net>
# Contributors: https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/pcb

pkgname=pcb-git
_gitname=pcb
pkgver=20160425
pkgrel=1
pkgdesc='Interactive printed circuit board editor'
url='http://pcb.geda-project.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtkglext' 'gd' 'gts')
optdepends=('tk: additional tools'
            'tcl: additional tools'
            'perl: additional tools'
	    'desktop-file-utils: desktop integration')
makedepends=('autoconf' 'automake' 'bison' 'flex' 'git' 'intltool' 'tk')
provides=('pcb')
conflicts=('pcb')
source=("git://git.geda-project.org/${_gitname}.git"
       'fix-gts-search-missing-libm.patch')
md5sums=('SKIP'
         '85ba1f0766697fdec313aa4d84f11d99')
install=pcb.install

pkgver() {
  cd "${_gitname}"
  echo $(date +%Y%m%d)  # format used by `pcb` in [community]
  #echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_gitname}"
  patch -p1 < "$srcdir/fix-gts-search-missing-libm.patch"
  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --enable-dbus \
      --disable-doc \
      --disable-update-mime-database \
      --disable-update-desktop-database \
      --disable-gl  # FIXME: `configure` looks for weird libs
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make -j1 prefix="$pkgdir/usr" install
}

# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vegastrike-data-svn
_pkgname=vegastrike
pkgver=13681
pkgrel=1
pkgdesc="SVN version of a 3D OpenGL Action-Space-Sim allowing players to trade and bounty hunt in a vast universe."
arch=('i686' 'x86_64')
url="http://vegastrike.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'vegastrike')
makedepends=('subversion')
optdepends=('vegastrike-svn: development version of the game binaries')
conflicts=('vegastrike-data')
install=${pkgname}.install

source=($pkgname.desktop)
md5sums=('4ccd4180c57a5544841e3365330a61d9')

_svntrunk=https://vegastrike.svn.sourceforge.net/svnroot/vegastrike/trunk/data
_svnmod=data

package() {
  cd "${srcdir}"

#data files
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Vegastrike DATA SVN checkout done or server timeout"

#data files install
  install -d "${pkgdir}"/usr/share
  cp -a "${srcdir}"/data "${pkgdir}"/usr/share
  mv "${pkgdir}"/usr/share/data "${pkgdir}"/usr/share/${_pkgname}

#install man page, .desktop file and icon
  install -D -m644 "${pkgdir}"/usr/share/${_pkgname}/documentation/${_pkgname}.1 \
    "${pkgdir}"/usr/share/man/man1/${_pkgname}.1
  install -D -m644 "${srcdir}"/${pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -D -m644 "${pkgdir}"/usr/share/${_pkgname}/${_pkgname}.xpm \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.xpm

#removing unneeded
  rm -rf `find "${pkgdir}"/usr/share -type d -name .svn`
#find "${pkgdir}"/usr/share -type d -name '.svn' | xargs rm -rf
}

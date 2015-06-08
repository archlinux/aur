# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Skottish <skottish97215@gmail.com>

pkgname=ario-svn
pkgver=779
pkgrel=1
pkgdesc="A lightweight GTK+ client for MPD and XMMS2 inspired by Rhythmbox."
arch=('i686' 'x86_64')
url="http://ario-player.sourceforge.net/"
license=('GPL')
depends=('avahi' 'curl' 'libglade' 'libsoup>=2.4' 'taglib')
makedepends=('intltool' 'libnotify' 'perl-xml-parser' 'pkgconfig' 'subversion' 'automake-1.9')
provides=('ario')
conflicts=('ario')
options=('!libtool')

_svntrunk="https://ario-player.svn.sourceforge.net/svnroot/ario-player/trunk"
_svnmod="ario"

package() {
  cd "${srcdir}"

  msg "Connecting to the $_svnmod SVN server..."
  if [ -d "$_svnmod/.svn" ]; then
    cd $_svnmod && svn up -r $pkgver
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf "${srcdir}/$_svnmod-build"
  cp -r "${srcdir}/$_svnmod" "${srcdir}/$_svnmod-build"
  cd "${srcdir}/$_svnmod-build"

  msg "Starting make..."
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  ln -sf /usr/share/icons/hicolor/48x48/apps/ario.png \
    "${pkgdir}/usr/share/pixmaps/ario.png"
  install -Dm644 data/ario.desktop "${pkgdir}/usr/share/applications/ario.desktop"
}

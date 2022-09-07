# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-spydr-git
pkgver=20201115
pkgrel=1
pkgdesc="Image display tool in yorick"
arch=('any')
license=('GPL')
url="https://github.com/frigaut/yorick-spydr"
groups=('science' 'yorick-all')
depends=('yorick' 'pygtk' 'yorick-yao-git' 'python2')
makedepends=('git' 'yorick')
provides=('yorick-spydr')
conflicts=('yorick-spydr')
replaces=('yorick-spydr')

_gitroot="https://github.com/frigaut/yorick-spydr.git"
_gitname="yorick-spydr"

package() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  yorick -batch make.i || return 1
  make DESTDIR=${pkgdir} install || return 1
  # sed -i -e "s|env python|env python2|" ${pkgdir}/usr/share/yorick/2.2/python/spydr.py
  mkdir -p ${pkgdir}/usr/bin
  echo 's=sum(strtok(Y_VERSION,".",3)(1)+"."+strtok(Y_VERSION,".",3)(2))' > /tmp/get_yversion
  echo 'f=open("/tmp/yversion","w"); write,f,format="%s",s; close,f;' >> /tmp/get_yversion
  yorick -batch /tmp/get_yversion
  yversion=`cat /tmp/yversion`
  ln -s /usr/lib/yorick/${yversion}/bin/spydr ${pkgdir}/usr/bin/spydr
}

# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-yao-git
pkgver=20201115
pkgrel=1
pkgdesc="Adaptive Optics simulation tool in yorick"
arch=('i686' 'x86_64')
license=('GPL')
url="https://frigaut.github.io/yao/"
groups=('science' 'yorick-all')
depends=('yorick' 'pygtk' 'yorick-imutil-git' 'fftw' 'yorick-soy-git' 'python2')
makedepends=('git' 'yorick')
provides=('yorick-yao')
conflicts=('yorick-yao')
replaces=('yorick-yao')

_gitroot="https://github.com/frigaut/yao.git"
_gitname="yao"

build() {
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
  cp Makefile.template Makefile

  yorick -batch make.i || return 1
  make || return 1
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install || return 1
  # sed -i -e "s|env python|env python2|" ${pkgdir}/usr/share/yorick/2.2/python/yao.py
  mkdir -p ${pkgdir}/usr/bin
  echo 's=sum(strtok(Y_VERSION,".",3)(1)+"."+strtok(Y_VERSION,".",3)(2))' > /tmp/get_yversion
  echo 'f=open("/tmp/yversion","w"); write,f,format="%s",s; close,f;' >> /tmp/get_yversion
  yorick -batch /tmp/get_yversion
  yversion=`cat /tmp/yversion`
  ln -s /usr/lib/yorick/${yversion}/bin/yao ${pkgdir}/usr/bin/yao
}

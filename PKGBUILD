# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Frédéric Mangano <fmang+aur mg0 fr>
pkgname=kanatest
pkgver=20150706.4f504fc
pkgrel=1
pkgdesc="A simple Hiragana and Katakana drill tool"
arch=('i686' 'x86_64')
url="http://www.clayo.org/kanatest/"
license=('GPL')
depends=('gtk2' 'libxml2')
optdepends=('ttf-freefont: for using FreeSerif or FreeSans fonts'
            'ttf-arphic-uming: for using AR PL ShanHeiSun Uni font'
            'ttf-arphic-ukai: for using AR PL ZenKai Uni font')
install='kanatest.install'

_gitroot="https://git.code.sf.net/p/kanatest/code"
_gitname=kanatest-code


pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf build
  mv "${_gitname}" build
  cd build

  sed -i configure.ac -e 's/-Werror//'
  sh autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install || return 1
}

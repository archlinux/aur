# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vegastrike-svn
_pkgname=vegastrike
pkgver=13681
pkgrel=1
pkgdesc="SVN version of an Open Source 3D Action-Space-Sim allowing players to trade and bounty hunt in a vast universe."
arch=('i686' 'x86_64')
url="http://vegastrike.sourceforge.net/"
license=('GPL')
depends=('expat' 'ffmpeg' 'freeglut' 'gtk2' 'libjpeg' 'libpng' 'libxcb' 'libxmu' 'openal' 'python2' 'sdl' 'xvidcore' 'glu')
optdepends=('vegastrike-data: original dataset'
            'vegastrike-data-svn: original dataset, svn version'
            'paralleluniverse: revival of Privateer')
makedepends=('subversion' 'cmake')
provides=('vegastrike')
conflicts=('vegastrike')
install=$pkgname.install
options=(!makeflags)

source=($pkgname-gcc44.diff)
md5sums=('286cdfd30eb37d8e716f812851abbced')

_svntrunk=https://vegastrike.svn.sourceforge.net/svnroot/vegastrike/trunk/vegastrike
_svnmod=vegastrike

build() {
  cd "${srcdir}"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co --ignore-externals $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Vegastrike BIN SVN checkout done or server timeout"

  msg "Setting up build environment..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."

#patching for GCC 4.4.0
#  patch -Np1 -i "${srcdir}"/$pkgname-gcc44.diff
#building
#  ./bootstrap-sh
#  ./configure --prefix=/usr --with-data-dir=/usr/share/vegastrike --enable-debug

#build system on cmake now
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package(){
  cd $_svnmod-build

  make DESTDIR="${pkgdir}" install

#move objconv dir to right path + avoiding conflict with mysql's 'replace' file
  install -d "${pkgdir}"/usr/share/${_pkgname}
  mv -f "${pkgdir}"/usr/objconv "${pkgdir}"/usr/share/${_pkgname}/objconv
  mv "${pkgdir}"/usr/bin/replace "${pkgdir}"/usr/bin/vsreplace

#removing unneeded
  rm -rf `find "${pkgdir}"/usr/share -type d -name .svn`
#find "${pkgdir}"/usr/share -type d -name '.svn' | xargs rm -rf || return 1

#removig huge build directory
  rm -r "${srcdir}"/$_svnmod-build
}

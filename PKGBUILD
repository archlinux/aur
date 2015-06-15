# Maintainer: jrobb <jrobb at proton mail dot ch>
#   thanks, speps!
pkgname=pumpa-git
pkgver=git
pkgrel=2
pkgdesc="A simple pump.io client written in C++ and Qt, git version"
arch=('i686' 'x86_64')
url="https://pumpa.branchable.com/"
license=('GPL3')
depends=('qt5-base' 'aspell' 'tidyhtml' 'libxkbcommon-x11')
makedepends=('git')
install="$pkgname.install"
source=("$pkgname.desktop")
md5sums=('SKIP')
_appname=pumpa
_gitRepo=${_appname}.branchable.com

prepare() {
  cd ${srcdir}
  _statusfile=${srcdir}/status.txt
  msg "Connecting to the server...."
    
  #check if the clone directory already exists:
  if [ ! -d ./${_gitRepo} ]; then
    msg "repo doesn't exist-- cloning..."
    git clone git://${_gitRepo}
    echo "clone" > ${_statusfile}
  else
    msg "git pull-ing..."
    cd ${_gitRepo}
    git pull origin master > ${_statusfile}
  fi
  
  msg "git checkout done or server timeout"
}

build() {  
  #_statusfile=${srcdir}/status.txt
  #msg "$_statusfile"
  #_status=$(grep 'Already' $_statusfile &> /dev/null ; echo $?)
  #msg "$_status"
  #if [ "$_status" == "0" ] ; then
  #  msg "already up-to-date"
  #else  
    msg "Starting make..."
	cd ${_gitRepo}
	
    # icon path fix
    sed -i 's|/.*/||' ${_appname}.desktop
    
    qmake
    make
  #fi
}

package() {
  cd ${_gitRepo}
  #_statusfile=${srcdir}/status.txt
  #_status=$(grep Already ${_statusfile} &> /dev/null ; echo $?)

  #if [ "$_status" == "0" ] ; then
    # bin
    install -Dm755 ${_appname} \
      "$pkgdir/usr/bin/${_appname}"

    # desktop file
    install -Dm644 ${_appname}.desktop \
      "$pkgdir/usr/share/applications/${_appname}.desktop"

    # icon
    install -Dm644 images/${_appname}.png \
      "$pkgdir/usr/share/pixmaps/${_appname}.png"
  #fi
}

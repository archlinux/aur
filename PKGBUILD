# Maintainer: Mesmer  <mesmer@fisica.if.uff.br>

pkgname=deezer-desktop-linux-git
pkgver=r29.cb487e7
pkgrel=1
pkgdesc='deezer desktop from git'
arch=('any')
url='https://github.com/baptistedonaux/deezer-desktop-linux'
license=('MIT')
source=('deezer-desktop-linux.sh')
install=pos.install
md5sums=('2f48f029c76a6633a1c0bb50cde7a800')

name=deezer-desktop-linux

_depends=(
  gcc-libs        lib32-gcc-libs
  pepper-flash
)

makedepends=(
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  git   npm
)


if [[ $CARCH == i686 ]]; then
  # Strip lib32 etc. on i686
  _depends=(${_depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/} ${_depends[@]})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  makedepends=(${makedepends[@]} ${_depends[@]})
fi
prepare(){
    rm $name -Rvif 
    git clone https://github.com/baptistedonaux/$name.git 
}

pkgver() {
  cd "$name"
  ( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package(){
    mkdir $pkgdir/opt -p
    mv $srcdir/$name $pkgdir/opt/
    install -Dm 755 deezer-desktop-linux.sh $pkgdir/usr/bin/deezer-desktop-linux
    
}



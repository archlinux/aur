# Maintainer: Mesmer  <mesmer@fisica.if.uff.br>

pkgname=deezer-desktop-linux-git
pkgver=r29.cb487e7
pkgrel=1
pkgdesc='deezer desktop from git'
arch=('any')
url='https://github.com/baptistedonaux/deezer-desktop-linux'
license=('MIT')
source=('deezer-desktop-linux.sh')
md5sums=('eee6a71bebc74dddc4b422fdf51c7598')

name=deezer-desktop-linux

_depends=(
  gcc-libs        lib32-gcc-libs
  pepper-flash
)

makedepends=(
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  git   npm
  readline
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
    printf "need to symlink readline.so.6, so need a sudo, dont worry \n"
    sudo ln -sf /usr/lib/libreadline.so.7.0  /usr/lib/libreadline.so.6
}

pkgver() {
  cd "$srcdir/$name"
  ( 
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
cd $srcdir/$name                                                                                                         
npm install
cd app 
npm install 
cd ..
npm run build
npm run dist


}
package(){
    mkdir -p $pkgdir/opt/
    mv $srcdir/$name/$name-linux-x64 $pkgdir/opt/
    install -Dm 755 deezer-desktop-linux.sh $pkgdir/usr/bin/deezer-desktop-linux
    
}



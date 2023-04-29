# Maintainer: sum01 <sum01@protonmail.com>
pkgname=serious-engine-git
pkgver=r462.4c0b882
_srcname="Serious-Engine"
pkgrel=1
pkgdesc="A game engine developed by Croteam for the classic Serious Sam games."
arch=('i686' 'x86_64')
url="https://github.com/ptitSeb/Serious-Engine"
license=('GPL2')
depends=('sdl2' 'python' 'bash')
makedepends=('cmake' 'make' 'sed' 'git' 'flex' 'bison')
source=("git+https://github.com/ptitSeb/Serious-Engine.git")
sha512sums=('SKIP')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

pkgver(){
  cd "$srcdir/$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux$_bits.sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux$_bits.sh > build-linux$_bits-tfe.sh
  chmod 755 "build-linux$_bits-tfe.sh"
}

build(){
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux$_bits.sh
  cp cmake-build/ssam ../Bin/
  cp cmake-build/Debug/* ../Bin/
  rm -rf cmake-build
  ./build-linux$_bits.sh -DTFE=TRUE
  cp cmake-build/ssam-tfe ../Bin/
  cp cmake-build/Debug/* ../Bin/
}

package(){
  mkdir -p "$pkgdir"/usr/{bin,share}/
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkgname"
  ln -s /usr/share/$pkgname/Bin/ssam "$pkgdir/usr/bin/ssam"
  ln -s /usr/share/$pkgname/Bin/ssam-tfe "$pkgdir/usr/bin/ssam-tfe"
}

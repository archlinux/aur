# Maintainer: Bug <bug2000@gmail.com>
# Contributor: Bug <bug2000@gmail.com>
pkgname=jpcsp-git
pkgver=r3741.e28be06
pkgrel=1
pkgdesc="JAVA PSP Emulator"
arch=('i686' 'x86_64')
url="http://jpcsp.org/"
license=('GPL')
depends=(jogl)
makedepends=('git' 'apache-ant')
provides=('jpcsp')
conflicts=('jpcsp' 'jpcsp-svn')
install=jpcsp.install
source=(
    'git+https://github.com/jpcsp/jpcsp.git'
    'jpcsp.sh'
    'jpcsp.desktop'
)

md5sums=(SKIP
         'd2551a7c28d10151caf535d8a035124f'
         'cd39aad03798576eb5228ed4184885c8')

_gitname=jpcsp

pkgver() {
    cd $_gitname
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd $_gitname
  mv build.xml build-bkp.xml
  mv build-auto.xml build.xml
  /usr/bin/ant jar
}

package() {
  cd $_gitname
  mkdir -p $pkgdir/opt/jpcsp/lib
  rm -R bin/class
  cp -a bin $pkgdir/opt/jpcsp/
  rm -R lib/{macosx,macosx-64,windows-x86,windows-amd64}
  if [ $CARCH == x86_64 ] ; then
    rm -R lib/linux-x86
    cp lib/linux-amd64/liblwjgl64.so lib/linux-amd64/liblwjgl.so
  else #32bit
    rm -R lib/linux-amd64
  fi
   
  cp -a lib/ $pkgdir/opt/jpcsp/
  install -D ../../jpcsp.sh $pkgdir/usr/bin/jpcsp
  install -D ../../jpcsp.desktop $pkgdir/usr/share/applications/jpcsp.desktop
}

# vim:set ts=2 sw=2 et:

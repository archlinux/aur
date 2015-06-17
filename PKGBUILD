#Mantainer: M0Rf30
pkgname=ultimate-backup-tool-git
pkgver=20130104
pkgrel=1
pkgdesc="Tool to backup android without root"
arch=('i686' 'x86_64')
url="https://github.com/UltimateBackuptool"
license=('GPL3')
depends=('android-sdk-platform-tools' 'bash') 
makedepends=('git' 'dos2unix')
install=$pkgname.install

_gitroot="https://github.com/UltimateBackuptool/UBT.git"
_gitname="ubt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cd Mac*
  sed 's#<Path_to_ADB_Binary>#/opt/android-sdk/platform-tools/adb#g' -i backup_android_to_mac.sh
}

package(){
  cd "$srcdir/$_gitname-build"
  cd Mac*
  install -D backup_android_to_mac.sh $pkgdir/usr/bin/backup_android_to_linux
  dos2unix $pkgdir/usr/bin/backup_android_to_linux
  chmod u+x $pkgdir/usr/bin/backup_android_to_linux  
} 

# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=apk2gold-git
pkgver=20141108
pkgrel=2
pkgdesc="CLI tool for decompiling Android apps to Java"
arch=('any')
url="https://github.com/lxdvs/apk2gold"
license=('Apache')
makedepends=('python2' 'git' 'maven' 'mercurial')
depends=('java-environment')
source=('git+https://github.com/lxdvs/apk2gold.git')
sha256sums=('SKIP')

build(){
  cd $srcdir/apk2gold
  git submodule update --init
  cd jd-cmd
  SYS="$(uname)" ARCH="$(uname -m)" mvn clean package -Dmaven.repo.local=$srcdir/.m2
  cp jd-cli/target/jd-cli.jar ..
  sed -i 's/^python /python2 /' ../apk2gold
}

package(){
  mkdir -p $pkgdir/usr/share
  cp -R $srcdir/apk2gold $pkgdir/usr/share/apk2gold
  rm $pkgdir/usr/share/apk2gold/make.sh
  rm -fr $pkgdir/usr/share/apk2gold/.git*
  rm -fr $pkgdir/usr/share/apk2gold/jd-cmd/.git*
  mkdir -p $pkgdir/usr/bin
  echo -e '#!/bin/bash\n/usr/share/apk2gold/apk2gold "$@"' >$pkgdir/usr/bin/apk2gold
  chmod +x $pkgdir/usr/bin/apk2gold
}

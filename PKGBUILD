# Maintainer:   Ilgrim    <ilgrim at gmail dot com>

pkgname=squirrel
pkgver=3.0.4
pkgrel=1
pkgdesc="A light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games."
arch=('i686' 'x86_64')
url="http://www.squirrel-lang.org/"
source=("http://squirrel.googlecode.com/files/${pkgname}_3_0_4_stable.tar.gz"
        "patch-0.2.diff")
md5sums=('e75feaed79c203d027708e2067ca1dcc'
         'af31d80d92f6f30eae4871f389c95a15')
license=('MIT')
options=('strip')
build() {
  # Patching source of libsquirrel Makefile. Added -fPIC param to make command.
  patch -Np1  < patch-0.2.diff
  cd ${srcdir}/SQUIRREL3
  # If $arch is x86_64, compile for 64bits. Else do it for 32.
  if [ $CARCH=='x86_64' ]; then
    make sq64 
  else
    make sq32 
  fi
}

package() {
  # Install squirrel Interpreter.
  install -Dm755 ${srcdir}/SQUIRREL3/bin/sq ${pkgdir}/usr/bin/squirrel
  # Install Includes and various headers.
  for _file in $(ls ${srcdir}/SQUIRREL3/include)
  do
     install -Dm755 ${srcdir}/SQUIRREL3/include/$_file ${pkgdir}/usr/include/$_file
  done
  # Install all static libraries & others.
  for _file in $(ls ${srcdir}/SQUIRREL3/lib)
  do
     install -Dm755 ${srcdir}/SQUIRREL3/lib/$_file ${pkgdir}/usr/lib/$_file
  done
  # Install docs & examples. 
  for _file in $(ls ${srcdir}/SQUIRREL3/doc)
  do
     install -Dm755 ${srcdir}/SQUIRREL3/doc/$_file ${pkgdir}/usr/share/$pkgname/doc/$_file
  done
  for _file in $(ls ${srcdir}/SQUIRREL3/samples)
  do
     install -Dm755 ${srcdir}/SQUIRREL3/samples/$_file ${pkgdir}/usr/share/$pkgname/samples/$_file
  done
  # Install Other docs.
  install -Dm755 ${srcdir}/SQUIRREL3/HISTORY ${pkgdir}/usr/share/$pkgname/HISTORY
  install -Dm755 ${srcdir}/SQUIRREL3/README ${pkgdir}/usr/share/$pkgname/README
  for _file in $(ls ${srcdir}/SQUIRREL3/etc)
  do
     install -Dm755 ${srcdir}/SQUIRREL3/etc/$_file ${pkgdir}/usr/share/$pkgname/embebing/$_file
  done 
}

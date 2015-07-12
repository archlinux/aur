# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=2.4.0
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('i686' 'x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('nodejs' 'gnuplot' 'libgcrypt15' 'nss' 'gconf' 'libudev.so.0')
source=('staruml.sh')
source_i686=("http://staruml.io/download/release/v$pkgver/StarUML-v$pkgver-32-bit.deb")
source_x86_64=("http://staruml.io/download/release/v$pkgver/StarUML-v$pkgver-64-bit.deb")
md5sums=('9e14e38e0b2054353eab13e9f028bd74')
md5sums_i686=('dd378f46cb452c1227ee570d81d2c530')
md5sums_x86_64=('345930d4ef6fe046b6a60c30b2fec241')
install=${pkgname}.install

prepare() {
  rm control.tar.gz
  rm debian-binary
  tar xJf data.tar.xz
}

package() {
  # the original symlink is wrong, still pointing to the original brackets binary
  ln -fs /opt/staruml/StarUML $srcdir/usr/bin/staruml

  # add the directory to PATH
  mkdir -p $pkgdir/etc/profile.d
  cp -f $srcdir/staruml.sh $pkgdir/etc/profile.d/

  # move icons to the correct folder
  for size in 32 48 128 256
  do
    dir=$pkgdir/usr/share/icons/hicolor/${size}x${size}
    mkdir -p $dir
    mv $srcdir/opt/staruml/appshell${size}.png $dir/
  done

  # and the desktop entry, too
  dir=$pkgdir/usr/share/applications
  mkdir -p $dir
  mv $srcdir/opt/staruml/staruml.desktop $dir/

  # finally, the directories
  cp -Rfp $srcdir/opt $srcdir/usr $pkgdir/
}

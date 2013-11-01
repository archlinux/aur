# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>

pkgname=gputest
pkgver=0.6.0
pkgrel=0
pkgdesc="cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark"
arch=('x86_64')
url="http://www.geeks3d.com/gputest/"
license=('custom:freeware')
depends=()
#source=("http://www.ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip")
#noextract=("GpuTest_Linux_x64_${pkgver}.zip")
md5sums=('7ea5b52fe0d3ce0a904806a5a4a1abdc')

prepare() {
  cd $srcdir
  # Fetch
  echo $md5s
  wget -c --referer "http://www.geeks3d.com/20131028/gputest-0-6-0-opengl-benchmark-for-windows-mac-os-x-and-linux-downloads/" \
  "http://www.ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip"
  echo ${md5sums[0]} GpuTest_Linux_x64_${pkgver}.zip | md5sum -c --quiet 
  rm -rf "$srcdir/gputest"
  mkdir "$srcdir/gputest"
  cd "$srcdir/gputest"
  unzip "$srcdir/GpuTest_Linux_x64_${pkgver}.zip"

  cd "$srcdir/gputest"
  sed -i '2icd /opt/gputest/' *.sh
  sed -i 's#./GpuTest#/opt/gputest/GpuTest#' ./gputest_gui.py 
  sed -i '1s"^#!.\+$"#!/usr/bin/python2"' ./gputest_gui.py

}

package () {
  cd "$srcdir/gputest"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "./EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/opt/gputest/data/"
  install -m 755 GpuTest "$pkgdir/opt/gputest/"
  install -m 644 ./data/* "$pkgdir/opt/gputest/data/"
  install -m 644 ./data/.DS_Store "$pkgdir/opt/gputest/data/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 {*.sh,*.py} "$pkgdir/usr/bin/"
}

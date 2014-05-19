# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>

pkgname=gputest
pkgver=0.7.0
pkgrel=0
pkgdesc="cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark"
arch=('x86_64')
url="http://www.geeks3d.com/gputest/"
license=('custom:freeware')
depends=()
makedepends=('unzip')
#source=("http://www.ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip")
#noextract=("GpuTest_Linux_x64_${pkgver}.zip")
md5sums=('54bdaa11c73fa08f2e0a47d639f4bdb8')

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

  cd "$srcdir/gputest/GpuTest_Linux_x64_${pkgver}"
  sed -i '2icd /opt/gputest/' *.sh
  sed -i 's#./GpuTest#/opt/gputest/GpuTest#' ./gputest_gui.py
  sed -i '1s"^#!.\+$"#!/usr/bin/python2"' ./gputest_gui.py

}

package () {
  cd "$srcdir/gputest/GpuTest_Linux_x64_${pkgver}"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "./EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/opt/gputest/data/"
  install -m 755 GpuTest "$pkgdir/opt/gputest/"
  install -m 755 ./*.so "$pkgdir/opt/gputest/"
  install -m 644 ./data/* "$pkgdir/opt/gputest/data/"
  install -m 644 ./data/.DS_Store "$pkgdir/opt/gputest/data/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 {*.sh,*.py} "$pkgdir/usr/bin/"
}

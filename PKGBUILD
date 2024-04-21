# Maintainer: Swift Geek <swifgeek É google m Ä0m>
# Contributor: Nick Ã˜stergaard <oe.nick at gmail dot com>
DLAGENTS=('https::/usr/bin/curl -e "https://www.geeks3d.com/20140304/gputest-0-7-0-opengl-benchmark-win-linux-osx-new-fp64-opengl-4-test-and-online-gpu-database/" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=gputest
pkgver=0.7.0
pkgrel=1
pkgdesc="cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark"
arch=('x86_64')
url="http://www.geeks3d.com/gputest/"
license=('custom:freeware')
depends=(gcc-libs mesa) # multilib?
optdepends=('python2: tkinter gui'
            'tk: tkinter gui')
makedepends=('unzip')
source=("https://ozone3d.net/gputest/dl/GpuTest_Linux_x64_${pkgver}.zip" 'gputest.sh')
sha256sums=('a6cbddfb40dc203735d63bc9609b24abde8613fbb649d0ef7d0d4515842ba263'
            'SKIP')

prepare() {
  cd "$srcdir/GpuTest_Linux_x64_${pkgver}"
  sed -i '2icd /opt/gputest/' *.sh
  sed -i 's#./GpuTest#/opt/gputest/GpuTest#' ./gputest_gui.py
#  sed -i '1s"^#!.\+$"#!/usr/bin/python2"' ./gputest_gui.py # They deleted that with 0.7
  sed -i '1s".*"#!/usr/bin/python2"' ./gputest_gui.py
}

package () {
  cd "$srcdir/GpuTest_Linux_x64_${pkgver}"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  cp "./EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  install -d "$pkgdir/opt/gputest/data/"
  install -m 755 GpuTest "$pkgdir/opt/gputest/"
  install -m 755 ./*.so "$pkgdir/opt/gputest/"
  install -m 644 ./data/* "$pkgdir/opt/gputest/data/"
  install -m 644 ./data/.DS_Store "$pkgdir/opt/gputest/data/"
  install -d "$pkgdir/usr/bin/"
  install -m 755 {*.sh,*.py} "$pkgdir/usr/bin/"
  install -m 755 ${srcdir}/gputest.sh "$pkgdir/usr/bin/gputest"
}

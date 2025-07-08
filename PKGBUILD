# Maintainer: insmtr <insmtr@insmtr.cn>
pkgname=ros2-humble-mavlink
pkgver=dev
pkgdesc="Marshalling / communication library for drones"
url='https://mavlink.io/'
arch=('x86_64')
pkgrel=1
license=('LGPL v3')
makedepends=('python')
depends=('ros2-humble')
source=("mavlink::git+https://github.com/mavlink/mavlink.git"
        "pymavlink::git+https://github.com/ardupilot/pymavlink.git"
        "mavlink-config.cmake"
        "mavlink.pc")
sha256sums=('SKIP'
            'SKIP'
            '368c9fc36260e7cda49678146be75dba6ed66e32b0f46f028a6703a1a1af34b0'
            '9cf68c122541b320f88c67bfd7feba26240dc034617c299853da7e3737bba291')

pkgver() {
    cd mavlink
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  _msgdir=mavlink/message_definitions/v1.0
  _mavgen=pymavlink/tools/mavgen.py
  for xml in all.xml matrixpilot.xml paparazzi.xml
  do
    $_mavgen --lang=C++11 --wire-protocol=2.0 -o v2.0 $_msgdir/$xml
    $_mavgen --lang=C -o v1.0 $_msgdir/$xml
  done
}

package() {
  mkdir -p $pkgdir/opt/ros/humble/{include/mavlink,lib/pkgconfig}
  cd $pkgdir/opt/ros/humble
  mv $srcdir/v1.0 $srcdir/v2.0 include/mavlink
  echo "#define MAVLINK_VERSION \"$pkgver\"" > include/mavlink/config.h
  sed "s/_ver_/$pkgver/" $srcdir/mavlink.pc > lib/pkgconfig/mavlink.pc
  install -Dm644 $srcdir/mavlink-config.cmake share/mavlink/cmake/mavlink-config.cmake
}

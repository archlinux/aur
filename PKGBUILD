# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: David Edmundson <david@davidedmundson.co.uk>

_pkgname=xembed-sni-proxy
pkgname=${_pkgname}-white-git
pkgver=r105.11e8648
pkgrel=1
pkgdesc="Convert XEmbed system tray icons to SNI icons. With white background."
arch=('i686' 'x86_64')
url="https://github.com/davidedmundson/${_pkgname}"
license=('GPL2')
depends=(qt5-{base,x11extras} kwindowsystem)
makedepends=('extra-cmake-modules' 'git')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    if [ -d build ] ; then
        rm build -rf
    fi
    cd $_pkgname
    sed -i 's:screen->black_pixel:screen->white_pixel:g' sniproxy.cpp
    sed -i 's:xembedsniproxy$:xembedsniproxy delay 10:g' xembedsniproxy.desktop
}

build() {
    mkdir build && cd build
    cmake ../${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DSYSCONF_INSTALL_DIR=/etc
    make  -j4
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/xembedsniproxy" "${pkgdir}/usr/bin/xembedsniproxy.bin"
  echo '#!/bin/sh' > "${pkgdir}/usr/bin/xembedsniproxy"
  echo '[ "z${1}" = "zdelay" ] && sleep ${2}' >> "${pkgdir}/usr/bin/xembedsniproxy"
  echo 'killall -9 xembedsniproxy.bin' >> "${pkgdir}/usr/bin/xembedsniproxy"
  #echo 'exec /usr/bin/xembedsniproxy.bin "`echo $@ | sed "s/delay  *[0-9]*//g" `"' >> "${pkgdir}/usr/bin/xembedsniproxy"
  echo 'while true;do /usr/bin/xembedsniproxy.bin "`echo $@ | sed "s/delay  *[0-9]*//g" `";done' >> "${pkgdir}/usr/bin/xembedsniproxy"
  chmod +x "${pkgdir}/usr/bin/xembedsniproxy"
}

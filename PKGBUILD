# Contributor: Josh Rickmar <joshua.rickmar@gmail.com>
# Contributor: Joshua Gonzales <jgonzales6@ucmerced.edu>
# Contributor: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>
# Maintainer: Titiwu  <matthias.busl@googlemail.com>

pkgname=lejos-nxj
_betaver=3
_pkgver=0.9.1
pkgver=0.9.1.beta${_betaver}
pkgrel=4
pkgdesc="A firmware replacement and toolchain for programming the Lego NXT in Java"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'APACHE')
url="http://lejos.sourceforge.net/"
depends=('java-environment' 'java-runtime' 'bluez' 'libusb-compat'
         'java-bluecove' 'java-commons-cli' 'java-bcel' 'lego-udev-rules')
makedepends=('apache-ant')
replaces=('lejos_nxj')
conflicts=('lejos-nxj-svn')
source=(http://downloads.sourceforge.net/sourceforge/lejos/leJOS_NXJ_${_pkgver}beta-${_betaver}.tar.gz)
md5sums=('c1d76a89f075d6404b724ea88137c521')

install=${pkgname}.install

build() {
    # Compile libnxt
    cd leJOS_NXJ_${_pkgver}beta-${_betaver}/build
    ant
    cd ..
}
package() {
    cd leJOS_NXJ_${_pkgver}beta-${_betaver}

    # Install Files to /opt
    install -d -m755 ${pkgdir}/opt/lejos-nxj/{bin,lib}
    install -d -m755 ${pkgdir}/opt/lejos-nxj/lib/{nxt,pc}
    install -d -m755 ${pkgdir}/opt/lejos-nxj/lib/pc/{native,3rdparty}
    install -m644 -t ${pkgdir}/opt/lejos-nxj/lib/nxt \
                     lib/nxt/{*.jar,*.zip}
    install -m644 -t ${pkgdir}/opt/lejos-nxj/lib/pc \
                     lib/pc/{*.jar,*.zip}
    install -m644 -t ${pkgdir}/opt/lejos-nxj/lib/pc/3rdparty \
                     lib/pc/3rdparty/{*.jar,*.zip}

    _arch="$CARCH"
    [[ "$CARCH" == i686 ]] && _arch=x86

    install -m755 -t ${pkgdir}/opt/lejos-nxj/lib/pc/native \
                     lib/pc/native/linux/${_arch}/*.so
    install -m755 -t ${pkgdir}/opt/lejos-nxj/bin \
                     bin/*
    # Copy docs (copied source zip instead)
    #cp -r   docs/* \
    #        ${pkgdir}/opt/lejos-nxj/docs/
    # Link Scripts to /usr/bin
    install -d -m755 ${pkgdir}/usr/bin
    cd ${pkgdir}/opt/lejos-nxj/bin
    for i in nxj*; do ln -sf /opt/lejos-nxj/bin/${i} ${pkgdir}/usr/bin/; done
}

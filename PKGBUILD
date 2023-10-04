# Maintainer: Murtuza Akhtari <murtuza dot akhtari at gmail dot com>
# Contributor: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='omada-controller'
pkgver=5.12.7
pkgrel=2
pkgdesc='Omada SDN Controller'
_basepkgname='Omada_SDN_Controller'
_basepkgpath='upload/software/2023/202309/20230920'
_baseos='Linux_x64'
arch=('x86_64')
url='https://www.tp-link.com/us/support/download/omada-software-controller/#Controller_Software'
license=('custom')
depends=('java-runtime>=8' 'java-jsvc' 'curl' 'mongodb>=3' 'mongodb<5')
makedepends=('git')
#provides=('sdn-controller')
conflicts=('omada-sdn-controller')
source=(
    "https://static.tp-link.com/${_basepkgpath}/${_basepkgname}_v${pkgver}_${_baseos}.deb"
    "git+http://github.com/murtuzaakhtari/omada-controller-scripts.git"
)
noextract=(${_basepkgname}_v${pkgver}_${_baseos}.deb)
sha256sums=('28a004ae360d68de463265b65b7335124fcf6be99f02e69047c2644f4c678aa0'
            'SKIP')

prepare(){
    mkdir -p tp_source
    bsdtar -O -xf ${_basepkgname}_v${pkgver}_${_baseos}.deb data.tar.xz | bsdtar -C tp_source -xJf -
}
package() {

    # Install required source files.
    local TP_SRC="tp_source/opt/tplink/EAPController"
    local DEST="$pkgdir/opt/omada-controller"
    install -dm 755 $DEST
    install -Dm644 $TP_SRC/lib/* -t $DEST/lib
    install -Dm755 $TP_SRC/bin/* -t $DEST/bin
    install -Dm644 $TP_SRC/properties/* -t $DEST/properties

    ln -sf /usr/bin/mongod "$DEST/bin/mongod"


    # Install omada-controller-scripts.
    local SCRIPT_SRC="$srcdir/omada-controller-scripts"
    install -Dm644 $SCRIPT_SRC/omada-controller.service "$pkgdir/usr/lib/systemd/system/omada-controller.service"
    install -Dm644 $SCRIPT_SRC/omada-controller.conf "$pkgdir/usr/lib/sysusers.d/omada-controller.conf"
    install -Dm644 $SCRIPT_SRC/omada-init-user-dirs.hook "$pkgdir/usr/share/libalpm/hooks/omada-init-user-dirs.hook"
    install -Dm755 $SCRIPT_SRC/omada-init-user-dirs.sh "$pkgdir/usr/share/libalpm/scripts/omada-init-user-dirs"
}

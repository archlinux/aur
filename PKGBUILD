# Maintainer: Emil Sauer Lynge <emillynge24 at gmail dot com>
pkgname=mesh-agent
pkgver=0.9.16
pkgrel=1
pkgdesc="The MeshCentral Agent is the software that runs on remote devices and connects to the MeshCentral server to allow for remote device management"
arch=('x86_64')
url="https://www.meshcentral.com/"
license=('Apache')
depends=( 'glibc' )
makedepends=( 'nasm' 'libx11' 'libxtst' 'libxext' )
install=${pkgname}.install
options=(!buildflags)  # mesh agent Makefile *really* wants full control over CFLAGS
changelog=
source=(
    "https://github.com/Ylianst/MeshAgent/archive/refs/tags/MeshCentral_v${pkgver}.tar.gz"
    'https://deac-fra.dl.sourceforge.net/project/libjpeg-turbo/1.4.2/libjpeg-turbo-1.4.2.tar.gz'
    'meshagent.msh'
    'mesh-agent.service'
)
backup=(
    'etc/meshagent.msh'
)
noextract=()
sha512sums=(
    '64b8fd064b6cbe139b1c6c99761c3cc968d8ef364ea1888e3f5f6e48c59cf8725f871cc4cdbe5b3577caea2d19a7791d7e3eff90247680fec0bb872df9a3fa0c'
    '9bd27c917c29125c425469eb0fdf99b802f25095f187fb416bd7c05e4af95a32404bbb0d06b77343d35d3461029500decf3481337b2eade9e57b58dea69719ee'
    '01c4ea28c283abe5aa85677ea1bfc2ba643a29de138fe499f4637b1e118546743a4105d5375424af0f60daa5cb6b876126e7c8c94b25e7a334f6a944d795e266'
    'a435f4fbd1f26c44324884a33e86d36c2bb0fc2e5988cfcdcfaa3a8813ba297d685b514fa6368cdd6a4d18b0f62468121ec4ad00ba6f5819c773fb7579167ffe'
)
validpgpkeys=()

prepare() {
	cd "MeshAgent-MeshCentral_v$pkgver"
	cd "../libjpeg-turbo-1.4.2"
	./configure

}

build() {
    cd "libjpeg-turbo-1.4.2"
    make -j8
    cp -f .libs/libturbojpeg.a ../MeshAgent-MeshCentral_v${pkgver}/lib-jpeg-turbo/linux/x86-64/libturbojpeg.a
    cp -f *.h ../MeshAgent-MeshCentral_v${pkgver}/
	cd "../MeshAgent-MeshCentral_v$pkgver"
	make linux ARCHID=6 -j8
}

# check() {
# }

package() {
    # Below folder structure feels very "icky", but meshagent demands to have executable, config file and database in
    # the same folder.
    # to mitigate:
    #    - config is actually located in etc and symlinked to shared folder
    #    - executable is symlinked from /usb/bin to allow calling from cli
	mkdir -p ${pkgdir}/var/lib/meshagent/
	mkdir -p ${pkgdir}/etc
	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	mkdir -p ${pkgdir}/usr/bin

 	install -m 755 MeshAgent-MeshCentral_v$pkgver/meshagent_x86-64 ${pkgdir}/var/lib/meshagent/meshagent
 	install -m 644 meshagent.msh ${pkgdir}/etc/meshagent.msh
 	install -m 644 mesh-agent.service ${pkgdir}/usr/lib/systemd/system/mesh-agent.service

 	ln -s  ../../../etc/meshagent.msh ${pkgdir}/var/lib/meshagent/meshagent.msh
 	ln -s  ../../var/lib/meshagent/meshagent ${pkgdir}/usr/bin/meshagent
}

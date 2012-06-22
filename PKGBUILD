# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python
pkgver=0.2.3
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python binding)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('orocos-kdl' 'sip')
makedepends=('cmake')

build() {
	# the archive contains a timestamp that is updated for each download
	# this makes the md5sum invalid, so we download the archive manually
	if [ ! -f "${pkgname}-${pkgver}.tgz" ]
	then
		wget "http://git.mech.kuleuven.be/?p=robotics/orocos_kinematics_dynamics.git;a=snapshot;h=ffdeaadc5a2af179a83dd50e4dc221a15aeccccc;sf=tgz" -O${pkgname}-${pkgver}.tgz
	fi
	tar zxf ${pkgname}-${pkgver}.tgz -C "${srcdir}"
	
	cd ${srcdir}/orocos_kinematics_dynamics-ffdeaad/python_orocos_kdl
	
	# determine python's site-package directory
	_packagesdir=`python -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))"`
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_SITE_PACKAGES_INSTALL_DIR=${_packagesdir} .
	make
}

package() {
	cd ${srcdir}/orocos_kinematics_dynamics-ffdeaad/python_orocos_kdl
	
	make DESTDIR="${pkgdir}" install
}


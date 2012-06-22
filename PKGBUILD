# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-kdl-python2
pkgver=0.2.3
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains (Python2 binding)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=('orocos-kdl' 'python2-sip')
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
	_packagesdir=`python2 -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))"`
	
	# specify python2 manually
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPython_ADDITIONAL_VERSIONS="2.7;2.6;2.5;2.4;2.3;2.2;2.1;2.0" -DPYTHON_SITE_PACKAGES_INSTALL_DIR=${_packagesdir} .
	make
}

package() {
	cd ${srcdir}/orocos_kinematics_dynamics-ffdeaad/python_orocos_kdl
	
	make DESTDIR="${pkgdir}" install
}


# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=gsas2-svn
_pkgname=gsas2
pkgver=5319
pkgrel=1
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xray.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python python-scipy python-matplotlib python-opengl python-numpy python-pillow python-h5py python-wxpython python-numpy python-requests ipython)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion scons gcc-fortran)

source=("${_pkgname}::svn+https://subversion.xray.aps.anl.gov/pyGSAS/trunk"
	"GSASII.desktop"
	"rungsas2")

md5sums=('SKIP'
	'06d168ec9ef40e2eaee88845a2626aed'
	'e5b00536edb13ae59cf2226c406e31f7')

pkgver() {
	  cd "${SRCDEST}/${_pkgname}"
	  svnversion | tr -d [A-z]
}


build() 
{
	cd ${srcdir}/${_pkgname}/fsource
	sed -i 's/fno-range-check/fno-range-check -fallow-argument-mismatch/g' SConstruct
	scons
}


package()
{
	mkdir -p "${pkgdir}/opt/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}/"
	mkdir -p "${pkgdir}/usr/share/applications/"

	#install gsas-2 files:
	cp -a ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}

	#remove unecessary libraries for other platforms
	( cd ${pkgdir}/opt/${_pkgname}
	rm -r fsource
	#already in depends
	rm -rf PyOpenGL-3.0.2a5.zip 
	)
	
	#install Desktop files:
	install -m 644 -D "${srcdir}/GSASII.desktop" "${pkgdir}/usr/share/applications/GSASII.desktop"
	
	#install and link executables:
	cp "${srcdir}/rungsas2" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/gsas2"

	mkdir -p "${pkgdir}/usr/bin"
	
	#linking executable
	( cd "${pkgdir}/usr/bin"
	ln -s ../../opt/${_pkgname}/gsas2 gsas2 )
}

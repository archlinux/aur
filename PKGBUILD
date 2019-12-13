# Maintainer: anon at sansorgan.es 
_pkgname=paraview-nightly
pkgname=paraview-nightly-bin
pkgver=5.7.0.r662.g3e20962
pkgrel=1
epoch=1
pkgdesc='Open-source, multi-platform data analysis and visualization application.'
arch=('x86_64')
license=('BSD')
url="https://www.paraview.org"
conflicts=('paraview')
# dependencies need to be narrowed down
depends=('boost-libs' 'qt5-tools' 'qt5-x11extras' 'intel-tbb' 'openmpi'
         'ffmpeg' 'ospray' 'python-matplotlib' 'python-numpy'
         'cgns' 'protobuf' 'python-pygments'
         'double-conversion' 'expat' 'freetype2' 'glew' 'hdf5' 
         'libjpeg' 'jsoncpp' 'libxml2' 'lz4' 'xz' 'python-mpi4py' 'netcdf'
         'libogg' 'libpng' 'pugixml' 'libtheora' 'libtiff' 'zlib')
#source=("$pkgname.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=nightly&type=binary&os=Linux&downloadFile=ParaView-latest-MPI-Linux-64bit.tar.gz")
source=("$pkgname.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=nightly&type=binary&os=Linux&downloadFile=ParaView-latest-MPI-Linux-Python3.7-64bit.tar.gz")
noextract=("$pkgname.tar.gz")
md5sums=("SKIP")

_prefix="ParaView-"
_suffix="-MPI-Linux-Python3.7-64bit"
prepare() {
	cd "$srcdir"
	#bsdtar -xf $pkgname.tar.gz --strip-components=1
	bsdtar -xf $pkgname.tar.gz
}

pkgver() {
	cd "$srcdir"
	# If anyone knows a better way of getting the version please tell me
	# All of the executables require an Xsession
	echo $(ls -d ${_prefix}* | sed -e "s/$_prefix\|$_suffix//g" | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

package() {
	subfolder=$(ls -d ${_prefix}*)
	cd "$srcdir/$subfolder"
	# Create destination directory
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/opt/${_pkgname}"
	install -dm755 "${pkgdir}/opt/${_pkgname}/bin"
	install -dm755 "${pkgdir}/opt/${_pkgname}/lib"
	install -dm755 "${pkgdir}/opt/${_pkgname}/share"
	cp -r bin/ "${pkgdir}/opt/${_pkgname}/"
	cp -R lib/   "${pkgdir}/opt/${_pkgname}/"
	cp -R share/ "${pkgdir}/opt/${_pkgname}/"
	cp -R plugins/ "${pkgdir}/opt/${_pkgname}/"

	# rename mpiexec symlink
	ln -s "${pkgdir}/opt/${_pkgname}/bin/mpiexec" "${pkgdir}/usr/bin/pv-mpiexec"

	# symlink rest of executables 
	for x in hydra_pmi_proxy paraview pvbatch pvpython \
	pvserver paraview-mesa pvdataserver pvrenderserver ; do 
		#ln -s "/usr/bin/$x" "${pkgdir}/opt/${_pkgname}/bin/$x"
		ln -s "/opt/${_pkgname}/bin/$x" "${pkgdir}/usr/bin/$x"
	done
	
	# symlink desktop entry and icons
	install -dm755 "${pkgdir}/usr/share/applications"
	ln -s "/opt/${_pkgname}/share/applications/org.paraview.ParaView.desktop" "${pkgdir}/usr/share/applications/org.paraview.ParaView.desktop"
	for x in '22x22' '32x32' '96x96'  ; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/$x/apps/"
		ln -s "/opt/${_pkgname}/share/icons/hicolor/$x/apps/paraview.png"  "${pkgdir}/usr/share/icons/hicolor/$x/apps/paraview.png"
	done
}

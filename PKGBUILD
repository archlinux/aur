# Maintainer: Josh Hoffer <hoffer.joshua@gmail.com>

_pkgname=paraview-nightly
pkgname=paraview-nightly-bin
pkgver=5.6.0.r1634.g0fa7f74
pkgrel=1
pkgdesc='Open-source, multi-platform data analysis and visualization application.'
arch=('x86_64')
license=('GPL')
url="https://www.paraview.org"
provides=('paraview')
conflicts=('paraview')
depends=('tcl' 'openmpi')
source=("$pkgname.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=nightly&type=binary&os=Linux&downloadFile=ParaView-latest-MPI-Linux-64bit.tar.gz")
noextract=("$pkgname.tar.gz")
md5sums=("SKIP")


prepare() {
	cd "$srcdir"
	#tar xzf $pkgname.tar.gz
	bsdtar -xf $pkgname.tar.gz --strip-components=1
}
pkgver() {
	#cd "$srcdir/$pkgname"
	cd "$srcdir"
	echo $(./bin/paraview -V | cut -d' ' -f3 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

package() {
	#cd "$srcdir/$pkgname"
	cd "$srcdir"
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
	ln -s "${pkgdir}/opt/${_pkgname}/share/applications/org.paraview.ParaView.desktop" "${pkgdir}/usr/share/applications/org.paraview.ParaView.desktop"
	for x in '22x22' '32x32' '96x96'  ; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/$x/apps/"
		ln -s "${pkgdir}/opt/${_pkgname}/share/icons/hicolor/$x/apps/paraview.png"  "${pkgdir}/usr/share/icons/hicolor/$x/apps/paraview.png"
	done
}

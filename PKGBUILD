# Maintainer: david <xuwd1@hotmail.com>
pkgname=huawei-pixlab-series
pkgver=1.0_86
pkgrel=1
epoch=
pkgdesc="Driver support for HUAWEI pixlab series printers"
arch=('x86_64')
url="https://consumer.huawei.com/cn/support/printers/pixlab-x1/"
license=('custom')
groups=()
depends=(
	cups cups-filters cups-pdf dbus
)
makedepends=(
	rpm-tools
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}.zip::https://consumer-tkbdownload.huawei.com/ctkbfm/servlet/download/downloadServlet/H4sIAAAAAAAAAD2Qy2rDMBRE_0XrOFzJV7LUVR3LgmyaQlK6DFIsNwLHMX40aUr_vXIxXc4whxnmm0yD7w9fnSdPhJEVqa63dpEiyjo0_sVeZnme7M2HpAv3xrokUsEPR7qGRIrjXeD6EboFeLXjOQIKUWW1ghPnNTIUTiisraMsrYRzMLe58NhWMbrfPb8DgECQs33qvR3DtT2EuZkKUJgCAo2RFRnCR2vHqZ835UWaKwaKAxqAHDmTUgsAvlHcsAJLjao0qAsORpa5ASyZ2jDIMp1mVMvY9WmbUL39nzD2k__btZyw35GfX1-X_kwlAQAA.zip"
)
noextract=()
sha256sums=(
	'e498bb9066d5fab236511cf6809f23abf40485e32b36d3d06967d4653dfa0776'
)
validpgpkeys=()

prepare() {
	echo " -> Cleaning HUAWEI's mind-blowing directory structure"
	_hypen_pkgver=$(echo ${pkgver}|sed 's/_/-/g')
	unzip ${srcdir}/${pkgname}_${_hypen_pkgver}_x64/${pkgname}_${_hypen_pkgver}_x64.zip 2>&1 > /dev/null
	mv ${srcdir}/${pkgname}_${_hypen_pkgver}_x64/x86_64 ${srcdir}/${pkgname}-${pkgver}
	cd ${pkgname}-${pkgver}
	rpm2archive *.rpm 
	tar -xzf *.rpm.tgz
	cd ${srcdir}
	echo " -> Now it's much better"
}


package() {
	echo " -> Installing"
	# cups driver and hwthrvop gui app
	mkdir -p ${pkgdir}/usr/share
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/share/cups  ${pkgdir}/usr/share
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/share/hwthrvop  ${pkgdir}/usr/share
	# cups filter and hwthrvop lib
	mkdir -p ${pkgdir}/usr/lib
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/lib/cups  ${pkgdir}/usr/lib
	cp -r ${srcdir}/${pkgname}-${pkgver}/usr/lib/libhwthr*  ${pkgdir}/usr/lib
	# udev rules
	mkdir -p ${pkgdir}/etc/udev/rules.d
	cp ${srcdir}/${pkgname}-${pkgver}/etc/udev/rules.d/* ${pkgdir}/etc/udev/rules.d



	# hwthrvop pixmaps and desktop entry
	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp ${srcdir}/${pkgname}-${pkgver}/usr/share/pixmaps/* ${pkgdir}/usr/share/pixmaps
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/usr/share/applications/hwthrvop.desktop ${pkgdir}/usr/share/applications/hwthrvop.desktop
	sed -i 's|^Exec=/usr/share/hwthrvop/hwthrvop.sh|Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=1 /usr/share/hwthrvop/hwthrvop.sh|' ${pkgdir}/usr/share/applications/hwthrvop.desktop

	
	#license
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp -r ${srcdir}/${pkgname}-${pkgver}/License/* ${pkgdir}/usr/share/licenses/${pkgname}/


	echo " -> Finished"
}



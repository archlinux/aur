# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=wg++
pkgver=5.0.1.1
pkgrel=1
pkgdesc='WebGrab+Plus is a multi-site incremental xmltv epg grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=('dotnet-runtime-6.0-bin')
makedepends=('git')
provides=('wg++')
conflicts=('wg++')
source=("http://www.webgrabplus.com/sites/default/files/download/SW/V4.2.2/WebGrabPlus_V4.2_install.tar.gz"
	"git+https://github.com/SilentButeo2/webgrabplus-siteinipack.git"
	"wg++.sh")
md5sums=('569b438673a4e1963c52f62c26bbcf16'
         'SKIP'
         'b9fc49688d55da5cf447b7a7b9a45361')

prepare() {
	cd "${srcdir}"
	rm -rf ".${pkgname}/siteini.pack.update"
	mv ".${pkgname}/mdb/mdb.config.example.xml" ".${pkgname}/mdb/mdb.config.xml"
	mv ".${pkgname}/rex/rex.config.example.xml" ".${pkgname}/rex/rex.config.xml"
	mv ".${pkgname}/" "${pkgname}/"
	# latest build
	cd "${srcdir}/webgrabplus-siteinipack/evaluation-builds"
	unzip -j "WebGrabPlus_V${pkgver}_eval_install.zip" "WebGrabPlus_V${pkgver}_eval_install.tar.gz"
	tar --strip-components=1 -xzf "WebGrabPlus_V${pkgver}_eval_install.tar.gz" -C "${srcdir}/wg++"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/opt/"
	install -d "${pkgdir}/usr/share/"
	mkdir "${pkgdir}/opt/${pkgname}"
	mkdir "${pkgdir}/opt/${pkgname}/siteini.pack"
	cp -r --preserve=mode * "${pkgdir}/opt/${pkgname}"
	cp -r --preserve=mode ../webgrabplus-siteinipack/siteini.pack/* "${pkgdir}/opt/${pkgname}/siteini.pack"
	cp -r "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Yangtse Su <yangtsesu@gmail.com>

pkgbase=alibaba-puhuiti
pkgname=({otf,ttf}-alibaba-puhuiti alibaba-puhuiti-fontconfig)
pkgver=2.0
pkgrel=5
pkgdesc="Alibaba PuHuiTi fonts"
arch=(any)
license=(custom)
url=https://ics.alibaba.com/font/alibaba-sans
source=("alibaba-puhuiti-$pkgver.zip::https://ics-static.oss-cn-hangzhou.aliyuncs.com/static/ucan/alibaba_font${pkgver}.zip"
         75-alibaba.conf)
sha512sums=('b4b9514375dd1a7717c675e87caaa87a8a9ebc549ba1275822cb0a7e3a8d0f62d3a793777467fffe1c98738a11f317c4cad2678703a74301dda0dd31892d3f47'
            'f05f3014ae38f4fb59d3bb06f52e05b8e122e5ba124bd166474231877346a7aeb107860a4b8304493197d43101b03a1bff6c1d79c7dc495377bb63a94cbb0be6')

prepare () {
	local winzipfile='阿里巴巴普惠体2(1).0字体包/PuHuiTi2.0 for Win 压缩.zip'
	local maczipfile='阿里巴巴普惠体2(1).0字体包/PuHuiTi2.0 for Mac 压缩.zip'

	mkdir ttf otf pdf
	bsdtar -xf "$winzipfile" -C ttf --include '*.ttf' --strip-components=3
	bsdtar -xf "$winzipfile" -C otf --include '*.otf' --strip-components=3
	bsdtar -xf "$maczipfile" -C pdf --include '*.pdf' --strip-components=1
	mv 'pdf/阿里巴巴普惠体2.0版法律声明.pdf' pdf/license.pdf
}

_package_common () {
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 pdf/license.pdf "${pkgdir}/usr/share/licenses/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
	install -Dm644 "$@" "${pkgdir}/usr/share/fonts/alibaba/${pkgname}"
}

package_otf-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - OTF format"
	depends=(alibaba-puhuiti-fontconfig)
	_package_common otf/*.otf
}

package_ttf-alibaba-puhuiti () {
	pkgdesc="$pkgdesc - TTF format"
	provides=(alibaba-puhuiti alibaba-sans)
	replaces=(alibaba-puhuiti alibaba-sans)
	depends=(alibaba-puhuiti-fontconfig)
	_package_common ttf/*.ttf
}

package_alibaba-puhuiti-fontconfig () {
	pkgdesc="$pkgdesc - Fontconfig configuration"
	conflicts=(alibaba-puhuiti alibaba-sans)
	install -dm755 "${pkgdir}/usr/share/fontconfig/conf.default"
	ln -nsf ../conf.avail/75-alibaba.conf \
		"${pkgdir}/usr/share/fontconfig/conf.default/75-alibaba.conf"
}

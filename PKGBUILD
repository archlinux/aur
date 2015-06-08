# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Maintainer : David Phillips <dbphillipsnz at remove these words I've written gmail dot com>
 
pkgname=wkhtmltopdf-static
pkgver=0.12.2.1
pkgrel=1
pkgdesc="Shell utility to convert HTML to PDF using Webkit and Qt (upstream static build)"
arch=('i686' 'x86_64')
url="http://wkhtmltopdf.org/"
license=('GPL3')
conflicts=('wkhtmltopdf')
provides=("wkhtmltopdf=${pkgver}")
depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libjpeg-turbo' 'libpng' 'libpng12' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'pcre' 'zlib')
optdepends=('icu48: Rendering from HTML uses unicode character encoding')

# Debian packages are already stripped, so don't bother re-attempting
options=('!strip')

source_x86_64=("http://downloads.sourceforge.net/project/wkhtmltopdf/${pkgver}/wkhtmltox-${pkgver}_linux-wheezy-amd64.deb")
source_i686=("http://downloads.sourceforge.net/project/wkhtmltopdf/${pkgver}/wkhtmltox-${pkgver}_linux-wheezy-i386.deb")
sha512sums_i686=('02612dc328966658aed2cbbf18fb55ac7e34c98c858c9eef71180404c595d8c8b985c2707d8d3a6cc2c23a35396506948f37b773d62076c5d8dd8158ef7c95f8')
sha512sums_x86_64=('842130ebab8250a21e4da8cff8ae63ca81f3f7801d9a7901406992fd3ae38d6779963843efb152b9d8a2027aefc4535723dfcfe5caf8aaf8653ff9f0a3d1e2bf')

package() {
	msg "Working directory is ${PWD:?}"
	msg "Unpacking data.tar.xz (Debian package files)"
	tar -xf data.tar.xz -C "${pkgdir}"

	cd "${pkgdir}"

	# Debian package has everything in /usr/local/{bin,lib,include,...}
	# but we want it in /usr/{bin,lib,include,...}
	msg "Moving files from ./usr/local/ to ./usr/"
	for dir in $(ls -1 usr/local) ; do
		mkdir -vp "usr/${dir}"
		mv -v "usr/local/${dir}"/* "usr/${dir}"
		rmdir -v "usr/local/${dir}"
	done
	rmdir -v usr/local

	# Fix permissions differences between Debian and Arch
	# All Directories => rwxr-xr-x
	msg "Fixing permissions on:"
	msg2 "Directories"
	find ./ -type d -exec chmod -cR 755 "{}" \;

	# Non-bin and non-lib Files => rw-r--r--
	msg2 "Files"
	find ./usr/{include,share} -type f -exec chmod -cR 644 "{}" \;
}

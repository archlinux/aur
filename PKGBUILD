# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=wg++
pkgver=3.1.7.2_r2393.326fc38
_pkgver=3.1.7.2
pkgrel=1
pkgdesc='WebGrab+Plus is a freeware (license via donation) multi-site incremental XMLTV EPG grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=('mono')
makedepends=('git' 'unzip')
provides=('wg++')
source=("http://webgrabplus.com/sites/default/files/download/SW/V3.1.0/WebGrabPlus_V3.1_install.tar.gz"
        "git+https://github.com/SilentButeo2/webgrabplus-siteinipack.git"
        "wg++")

md5sums=('1f1ee11bb0c7db9068a6833788079d1b'
         'SKIP'
         '96ddf77a84554bb457dab4fd63e82ae6')

pkgver() {
  cd "webgrabplus-siteinipack"
  printf "${_pkgver}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Install application files
	mkdir -p "${pkgdir}/opt/wg++"
  unzip -oq "${srcdir}/webgrabplus-siteinipack/evaluation-builds/V${_pkgver}.zip" -d "${srcdir}/.wg++/bin"
	cp -R "${srcdir}/.wg++/bin" "${pkgdir}/opt/wg++/"
	cp -R "${srcdir}/.wg++/doc" "${pkgdir}/opt/wg++/"
  cp -R "${srcdir}/webgrabplus-siteinipack/siteini.pack" "${pkgdir}/opt/wg++/"

	# Install configuration files
  mkdir -p "${pkgdir}/usr/share/wg++"
  cp -R "${srcdir}/webgrabplus-siteinipack/siteini.pack" "${pkgdir}/usr/share/wg++/siteini.pack"	
  cp -R "${srcdir}/.wg++/mdb" "${pkgdir}/usr/share/wg++/"
  sed -e "s/\r//g" "${pkgdir}/usr/share/wg++/mdb/mdb.config.example.xml" > "${pkgdir}/usr/share/wg++/mdb/mdb.config.xml"
  cp -R "${srcdir}/.wg++/rex" "${pkgdir}/usr/share/wg++/"
  sed -e "s/\r//g" "${pkgdir}/usr/share/wg++/rex/rex.config.example.xml" > "${pkgdir}/usr/share/wg++/rex/rex.config.xml"
  cp -R "${srcdir}/.wg++/siteini.user" "${pkgdir}/usr/share/wg++/"
  sed -e "s/\r//g" "${srcdir}/.wg++/WebGrab++.config.example.xml" > "${pkgdir}/usr/share/wg++/WebGrab++.config.example.xml"

  # Cleanup files before build
  rm -f "${pkgdir}/usr/share/wg++/mdb/mdb.config.example.xml" "${pkgdir}/usr/share/wg++/rex/rex.config.example.xml" 

	# Executable
	install -Dm755 "${srcdir}/wg++" "${pkgdir}/usr/bin/wg++"
}

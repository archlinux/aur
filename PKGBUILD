# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>
pkgname=gsas-expgui-svn
pkgver=1253
pkgrel=4
pkgdesc="General Structure Analysis System - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="http://www.ccp14.ac.uk/solution/gsas/"
license=(custom)
depends=('python2' 'tcl' 'tk' 'blt')
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}" "lib32-libx11")
makedepends=(dos2unix subversion)

_svntrunk="https://subversion.xray.aps.anl.gov/EXPGUI"
source=("gsas::svn+${_svntrunk}/gsas/all"
	"EXPGUI.desktop"
	"GSAS.desktop"
	"license.txt"
	"EXPGUI.png"
	"GSAS.png")

md5sums=('SKIP'
	 '4c8e71d8b7cd33a1ba7cdbc313970376'
	 'd7a44b644d9d4de663c8ca00c9aa2e55'
	 '4c8e94cd085eae5c6557331514483b78'
	 '2e886fc46a261283e82ed8a4080e2329'
	 'c5701db4ffb4caa5336020583d313ef2')

pkgver() {
	cd "$startdir/gsas"
	svnversion | tr -d [A-z]
}

prepare()
{
	svn switch "$_svntrunk/trunk/" "${startdir}/gsas/expgui/" --ignore-ancestry
	svn switch "$_svntrunk/gsas/linux/exe" "${startdir}/gsas/exe/" --ignore-ancestry
	svn switch "$_svntrunk/gsas/linux/pgl" "${startdir}/gsas/pgl/" --ignore-ancestry

	for dir in  expgui exe pgl; do
		if [ -d "${srcdir}/gsas/${dir}" ]; then
			rm -rf "${srcdir}/gsas/${dir}"
		fi

		svn export "${startdir}/gsas/${dir}" "${srcdir}/gsas/${dir}"
	done
}

build() 
{
	cd ${srcdir}/gsas/
	dos2unix "${srcdir}/gsas/expgui/expgui"
	chmod +x "${srcdir}/gsas/expgui/expgui"
}


package()
{
	mkdir -p "${pkgdir}/opt"
	cp -a "${srcdir}/gsas" "${pkgdir}/opt/"


	#Install and link executables:
	mkdir -p "${pkgdir}/usr/bin"
	( 	cd "${pkgdir}/usr/bin"
		ln -sf ../../opt/gsas/GSAS GSAS
		ln -sf ../../opt/gsas/expgui/expgui expgui
	)

	#Install license
	mkdir -p "${pkgdir}/usr/share/licenses/gsas-expgui-svn/"
	install -m 644 -D "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/gsas-expgui-svn/LICENSE"

	mkdir -p "${pkgdir}/usr/share/applications/"
	#Copy in icon files that mysteriously weren't in the latest svn revision:
	install -m 644 -D "${srcdir}/GSAS.png" "${pkgdir}/opt/gsas/GSAS.png"
	install -m 644 -D "${srcdir}/EXPGUI.png" "${pkgdir}/opt/gsas/EXPGUI.png"

	#Install Desktop files:
	install -m 644 -D "${srcdir}/GSAS.desktop" "${pkgdir}/usr/share/applications/GSAS.desktop"
	install -m 644 -D "${srcdir}/EXPGUI.desktop" "${pkgdir}/usr/share/applications/EXPGUI.desktop"
}

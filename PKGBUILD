# AUR maintainer: Swyter <swyterzone+aur@gmail.com>
# Original Linux porter: cfcohen <https://github.com/cfcohen>

# For more info and discussion about the Linux version go here:
# https://forums.taleworlds.com/index.php/topic,313683.0.html

pkgname=openbrf
pkgdesc='Mount&Blade resource editor by Marco Tarini.'
pkgver=0.0.80
pkgrel=1
arch=('i686' 'x86_64')
url="https://forums.taleworlds.com/index.php?topic=72279.0"
license=('GPL')
depends=('qt4' 'glew' 'glu')
makedepends=('icoutils' 'subversion' 'git')
install=openbrf.install
source=('git+https://github.com/cfcohen/openbrf.git' 'svn://svn.code.sf.net/p/vcg/code/trunk/vcglib')
md5sums=('SKIP' 'SKIP')

pkgver()
{
	cat "${srcdir}/openbrf/main_info.cpp" | grep applVersion\ \= | cut -d'"' -f2
}

build()
{
	cd "openbrf"

	icotool -x openBrf.ico

	# use the correct location for our VCG lib, instead of the custom hardcoded path
	sed -e "s/VCGLIB = \/home\/cory\/Source\/VCGLib/VCGLIB = ..\/vcglib/" openBrf.pro --in-place

	qmake-qt4 -makefile openBrf.pro
	make -j 4
}

package()
{
	mkdir -p "${pkgdir}/opt/openbrf"

	install -D -m711 -s "${srcdir}/openbrf/openBrf"             "${pkgdir}/opt/openbrf/openbrf"
	install -D -m644    "${srcdir}/openbrf/carry_positions.txt" "${pkgdir}/opt/openbrf/carry_positions.txt"
	install -D -m644    "${srcdir}/openbrf/reference.brf"       "${pkgdir}/opt/openbrf/reference.brf"

	mkdir -p "${pkgdir}/usr/bin"

	echo 'env LC_NUMERIC=C /opt/openbrf/openbrf "$@"' > "${pkgdir}/usr/bin/openbrf"
	chmod 755 "${pkgdir}/usr/bin/openbrf"

	install -D -m644    "${srcdir}/openbrf/openBrf_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/openbrf.png"


	# add a shortcut that handles application/x-openbrf files
	mkdir -p "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/openbrf.desktop"
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=OpenBRF
Comment=Mount&Blade resource editor by Marco Tarini.
Exec=openbrf
Icon=openbrf
MimeType=application/x-openbrf
Categories=Graphics
EOF

	# add our custom mime type for application/x-openbrf => *.brf files
	mkdir -p    "${pkgdir}/usr/share/mime/packages"
        cat <<EOF > "${pkgdir}/usr/share/mime/packages/openbrf.xml"
<?xml version="1.0" encoding="utf-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
<mime-type type="application/x-openbrf">
  <generic-icon name="openbrf"/>
  <acronym>BRF</acronym>
  <comment>Mount&amp;Blade Binary Resource File</comment>
  <glob pattern="*.brf"/>
</mime-type>
</mime-info>
EOF
}

# AUR maintainer: Swyter <swyterzone+aur@gmail.com>
# Original Linux porter: cfcohen <https://github.com/cfcohen>

# For more info and discussion about the Linux version go here:
# https://forums.taleworlds.com/index.php/topic,313683.0.html

pkgname=openbrf-git
pkgdesc='Mount&Blade resource editor by Marco Tarini.'
pkgver=2025.05.09
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://forums.taleworlds.com/index.php?topic=72279.0"
license=('GPL')
depends=('qt6-base' 'glu')
replaces=('openbrf')
conflicts=('openbrf')
makedepends=('icoutils' 'git' 'coreutils') # add coreutils for nproc
install=openbrf.install
source=('git+https://github.com/Swyter/openbrf-redux')
md5sums=('SKIP')

pkgver()
{
	base_ver=$(cat    "${srcdir}/openbrf-redux/main_info.cpp" | grep applVersion\ \= | cut -d'"' -f2)
	date_ver=$(TZ=UTC git -C "${srcdir}/openbrf-redux" show -s --date=format-local:'%Y.%m.%d' --format=%cd HEAD)
	git_hash=$(TZ=UTC git -C "${srcdir}/openbrf-redux" rev-parse --short HEAD)
	echo "${date_ver}"
}

build()
{
	cd "openbrf-redux/_build"

	# extract all the Windows icon sub-images, we can later grab the 256px
	# version and use it in Linux as XDG PNG icon.
	icotool -x ../openBrf.ico

	# build it as fast as possible, but leaving a free CPU core for other stuff!
	qmake6 -makefile ../openBrf.pro
	make -j $[ (n = `nproc` - 1) < 1 ? 1 : n ] # swy: don't make the thread count zero (-j 0) when there's only one available core (due to the system-threads - 1 thing)
}

package()
{
	mkdir -p "${pkgdir}/opt/openbrf"
	mkdir -p "${pkgdir}/opt/openbrf/translations"

	install -D -m711 -s "${srcdir}/openbrf-redux/_build/openBrf"                  "${pkgdir}/opt/openbrf/openbrf"
	install -D -m644    "${srcdir}/openbrf-redux/_build/carry_positions.txt"      "${pkgdir}/opt/openbrf"
	install -D -m644    "${srcdir}/openbrf-redux/_build/customPreviewShaders.xml" "${pkgdir}/opt/openbrf"
	install -D -m644    "${srcdir}/openbrf-redux/_build/reference.brf"            "${pkgdir}/opt/openbrf"
	install -D -m644    "${srcdir}/openbrf-redux/_build/translations/"*           "${pkgdir}/opt/openbrf/translations"

	mkdir -p "${pkgdir}/usr/bin"

	echo 'env LC_NUMERIC=C /opt/openbrf/openbrf "$@"' > "${pkgdir}/usr/bin/openbrf"
	chmod 755 "${pkgdir}/usr/bin/openbrf"

	install -D -m644    "${srcdir}/openbrf-redux/_build/openBrf_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/openbrf.png"
	install -D -m644    "${srcdir}/openbrf-redux/_build/openBrf_6_256x256x32.png" "${pkgdir}/opt/openbrf/openbrf.png"

	# add a shortcut that handles application/x-openbrf files
	mkdir -p "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/openbrf.desktop"
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=OpenBRF Redux
Comment=Mount&Blade resource editor by Marco Tarini and Swyter.
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
  <comment xml:lang="es">Recurso binario de Mount&amp;Blade</comment>
  <glob pattern="*.brf"/>
</mime-type>
</mime-info>
EOF
}

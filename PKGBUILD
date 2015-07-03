# Creator: Vianney le Clément <vleclement AT gmail · com>
# Maintainer: Philip 'Chais' Abernethy <chais.z3r0@gmail.com>
pkgname=tokitori-hb
pkgver=20130705
_pkgver=2013-07-05
pkgrel=2
pkgdesc="A highly entertaining puzzle platformer (Humble Bundle copy required)"
arch=('i686' 'x86_64')
url="http://www.tokitori.com/"
license=('custom:commercial')
groups=('humblebundleandroid')
depends=('libgl' 'libxft')
options=(!strip)
source=("hib://TokiTori-Linux-${_pkgver}.sh"
        "tokitori.desktop")
sha512sums=('30634d628becf70c284b5c890291a259ab106d748949e3fdbf75b48311e4c9cbd148f87afe8ab573c010d088a5a4310eb233df36887c660fdcf5815ba26f8fd5'
            '8725a11103f30faf0bf4290f4e7fb18861aaaa9544b822851a32177846e947155de68bb53a715901d6dff7b16d3858bf77e7414c4e83dd0f8a8b163e08860896')

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')

# Uncomment the following line to create an uncompressed package. This speeds
# up the build process.
#PKGEXT='.pkg.tar'
_carch=${CARCH/i686/x86}

prepare() {
	cd "${srcdir}"
	sh TokiTori-Linux-${_pkgver}.sh --tar xf
}

package() {
	cd "${srcdir}"
	_lzma="bin/linux/${_carch}/libc.so.6/lzma"
	${_lzma} d subarch - | tar x

	mkdir -p "${pkgdir}/opt/tokitori"

	${_lzma} d "instarchive_all" - | tar x --no-same-owner -C "${pkgdir}/opt/tokitori/"
	${_lzma} d "instarchive_all_$_carch" - | tar x --no-same-owner -C "${pkgdir}/opt/tokitori/"

	install -d "${pkgdir}/usr/bin"
	ln -s /opt/tokitori/TokiTori.bin.${_carch} "${pkgdir}/usr/bin/tokitori"
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s /opt/tokitori/TokiTori.png "${pkgdir}/usr/share/pixmaps/tokitori.png"

	install -Dm644 tokitori.desktop "${pkgdir}/usr/share/applications/tokitori.desktop"
}

# vim:set ts=4 sw=4 et:

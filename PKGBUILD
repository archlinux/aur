# Notes on Netlogger from previous maintainer:
# NetLogger is a shitty program.
# It is incredibly picky about what libraries it needs to run
# It refuses to work with anything except what it is distributed with.

# It's worth noting that I don't actually use this program
# and that I avoid nets that do, but unfortunately I do sorta need this to exist
# I apologize for anyone who participates on a net using NetLogger.
# To the NetLogger devs: grow up, learn security, and learn OSS.

# Maintainer: Tripp Sanders <K5TRP@protonmail.com>
# Contributor: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=netlogger
pkgver=3.1.7
pkgrel=2
pkgdesc="Server-based amateur radio net logging programs"
arch=('x86_64')
url="https://www.netlogger.org"
license=('custom:freeware')
depends=('qt5-base')
provides=(netlogger)
source=('netlogger.sh' 'netlogger.desktop' "https://www.netlogger.org/downloads/NetLogger_${pkgver}_Linux_x64.tgz" "https://www.netlogger.org/downloads/netlogger_${pkgver}_amd64.deb")
noextract=()
sha256sums=('daed53263ec0cc784f6db24d33dfdc6075825ad45c0a8846a77604a28d6bf664'
            'ae6c1e566ead11a5bb85770231e1c3414e98666e21f96c720aa784e00282bf46'
            '39b45a2ed07ebe2815490966c65a8796da8c89d0a4897312877c73c0e1e73a76'
            '9a10ec5fa51548a4fcb3703231b3903b0b62ca6fd52da35636eb9b075e1ecadc')

prepare() {
	cd "${srcdir}"
  # extract the tgz within the tgz to a directory called 'tarball' so we can work with it
  mkdir -p "${srcdir}/tarball"
	bsdtar -xf netlogger_${pkgver}.tgz -C tarball
	# copy out the license file for sticking in /usr/share/licenses later
	cp "${srcdir}/tarball/License.rtf" "${srcdir}/license.rtf"
	# get rid of the extra files
	cd "${srcdir}/tarball"
	rm -f GNU_LGPL_v2.1.rtf GNU_LGPL_v3.rtf GNU_GPL_v3.rtf NetLogger24to30.pdf Release_Notes.html License.rtf
	# extract deb for netlogger.png
	mkdir -p "${srcdir}/deb"
	bsdtar -xf data.tar.xz -C deb
}

package() {
	cd "${pkgdir}"
	mkdir -p "$pkgdir/opt/netlogger/"
	cp -r "$srcdir/tarball/" -T "$pkgdir/opt/netlogger/"
	install -D -m755 "${srcdir}/netlogger.sh" "${pkgdir}/usr/bin/netlogger"
	install -D -m644 "${srcdir}/netlogger.desktop" "${pkgdir}/usr/share/applications/netlogger.desktop"
	install -D -m644 "${srcdir}/license.rtf" "${pkgdir}/usr/share/licenses/netlogger/license.rtf"
	install -D -m644 "${srcdir}/deb/usr/share/icons/hicolor/512x512/apps/netlogger.png" "${pkgdir}/usr/share/pixmaps/netlogger.png"
}

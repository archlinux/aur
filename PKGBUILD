# Maintainer: Marcel Bobolz <ergotamin.source at gmail dot com>
# Contributor: visit ""
pkgname=('slimjet-browser')
_origname='slimjet'
pkgver=21.0.8.0
pkgrel=1
pkgdesc="A lightweight Browser based on Blink (removed setuid-sandbox)"
arch=('x86_64')
url="http://www.slimjet.com"
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme' 'xorg-xhost'
	'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'openssl' 'nspr' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0' 'imagemagick>7.0.0')
options=('!emptydirs' '!strip')
provides=('slimjet-browser')
replaces=('slimjet')
license=('custom:freeware' 'MIT')
source=("${pkgname}-${arch}.deb::https://www.${_origname}browser.com/release/${_origname}_amd64.deb"
	"LICENSE"
	"flashpeak.patch"
	"slimjet-browser")
install='slimjet-browser.install'
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

package() {
	msg2 "Extracting data.tar.xz of ${pkgname}-${arch}.deb ..."
	# needed
	bsdtar -xpf "data.tar.xz"
	#-
	msg2 "Sanitizing extracted file-tree ..."
	# trash
	rm -f 'control.tar.gz' 'debian-binary'
	rm -f "usr/bin/flashpeak-slimjet"
	rm -rf "usr/share/doc"
	# license
	mkdir -p "usr/share/licenses/${pkgname}"
	install "${srcdir}/LICENSE" "usr/share/licenses/${pkgname}"
	# icon-format->PNG
	$(command -v convert) "usr/share/pixmaps/slimjet.xpm" "usr/share/pixmaps/slimjet.png" &>/dev/zero
	# use attached wrapper
	sed 's%^Exec=/usr/bin/flashpeak-slimjet%Exec=/usr/bin/slimjet-browser%g' -i "usr/share/applications/slimjet.desktop"
	sed 's%^Icon=flashpeak-slimjet%Icon=slimjet%g' -i "usr/share/applications/slimjet.desktop"
	# deleted check for slimjet-sandbox
	patch "opt/slimjet/flashpeak-slimjet" <"${srcdir}/flashpeak.patch"
	# removing deprecated setuid-sandbox, namespaced-sandbox will be used
	rm -f "opt/slimjet/slimjet-sandbox"
	mv "opt/slimjet" "usr/share/slimjet"
	# cleanup
	rm -rf "opt"
	# setup kernel to permit namespaced sandbox, and
	# if run as root, the dummy user slim-root executes slimjet
	install -m0755 "${srcdir}/slimjet-browser" "usr/bin/slimjet-browser"
	#-
	msg2 "Moving sanitized file-tree to package-directory ..."
	# moving to target-directory
	bsdtar -pcf - usr | bsdtar -pxf - -C "$pkgdir"
	# setting correct permissions
	chmod -R 0755 "${pkgdir}/"
	# done
	msg2 "Finished !"
	# enjoy !
}

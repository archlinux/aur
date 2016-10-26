# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>

_pkgname=messengerfordesktop
pkgname=${_pkgname}-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Beautiful desktop client for Facebook Messenger. Binary version."
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
conflicts=('messengerfordesktop' 'messengerfordesktop-git')
options=(!strip)
depends=('libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'nss')
makedepends=('tar')

if [ $CARCH == x86_64 ]; then
	noextract=("${_pkgname}-${pkgver}-linux-amd64.deb")
	sha256sums=('d4c9eebc60f51c2ba5c136617f6dd71121feb3d8c99b7b563498109d7be74d45')
else
	noextract=("${_pkgname}-${pkgver}-linux-i386.deb")
	sha256sums=('ed05f1afb3d25589c071276c7cc12bff1f5a6e4acb301eeab1cc3300a97d5726')
fi

source=("https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v${pkgver}/${noextract[0]}")

package() {
	mkdir ${_pkgname}
	ar p ${noextract[0]} data.tar.gz | tar -xzC ${_pkgname}

	cd ${_pkgname}
	find . -type f -exec install -Dm 644 {,"${pkgdir}/"}{} \;

	cd "${pkgdir}"

	# Fix the window class in desktop file
	sed -i "s/\(StartupWMClass\).\+/\1=messenger for desktop/" "usr/share/applications/${_pkgname}.desktop"

	cd "opt/${_pkgname}"

	# Restore execute bit on binary
	chmod +x ${_pkgname}

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

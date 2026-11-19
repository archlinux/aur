# Maintainer: markusressel <mail+archlinuxaur@markusressel.de>
#
# This file is maintained in https://github.com/markusressel/xtouch-daemon/tree/main/packaging/aur/xtouch-daemon-bin
# and published to the AUR with packaging/aur/publish.sh (see RELEASING.md). Don't edit it on the AUR directly.
pkgname=xtouch-daemon-bin
_pkgname=xtouch-daemon
pkgver=0.2.0
pkgrel=1
pkgdesc="Use a Behringer X-Touch Extender as a hardware mixer for PipeWire: motor faders, meters, scribble strips"
arch=('x86_64')
url="https://github.com/markusressel/xtouch-daemon"
# the release bundles its own CPython (PSF-2.0) and the Python packages it needs
license=('AGPL-3.0-or-later' 'PSF-2.0')
depends=('glibc' 'libpulse' 'pipewire')
optdepends=('pipewire-pulse: the PulseAudio server of PipeWire, which the daemon controls (or PulseAudio)'
            'xtouch-daemon-gui-bin: the GUI'
            'mumble: voip strips with the people of a Mumble channel (the plugin is in /usr/share/xtouch-daemon)')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# the bundled Python comes ready to run: stripping breaks its binaries
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('0b2a82258bb00c00a3a235cfdf9135ac2c856fd65d3669149e808559649e566c')

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}-x86_64"
	./usr/bin/xtouch-daemon --version
	./usr/bin/xtouch-daemon check-config -c usr/share/${_pkgname}/config.example.toml > /dev/null
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-x86_64"
	# not -a: the files belong to root in the package, not to the user who built it
	cp -dr --preserve=mode,timestamps usr "${pkgdir}/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

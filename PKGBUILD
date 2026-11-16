# Maintainer: mfat <https://github.com/mfat>
# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=6.4.2
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
# Not 'any': the RDP tab's gtk4-frdp library is compiled into the package.
arch=('x86_64' 'aarch64')
# Needed to build as well as to run: Meson looks up Python, and the bundled
# gtk4-frdp (RDP tab, in /usr/lib/sshpilot) links against GTK 4 and FreeRDP 3.
depends=('python' 'gtk4' 'freerdp')
makedepends=('meson' 'ninja' 'blueprint-compiler' 'glib2-devel' 'gettext'
             'desktop-file-utils' 'appstream' 'gobject-introspection')
# Built-in protocol plugins shell out to these; all degrade gracefully if absent.
optdepends=('inetutils: Telnet protocol support'
            'mosh: Mosh protocol support'
            'kubectl: Kubernetes protocol support'
            'docker: Docker/Podman protocol support'
            'picocom: Serial console protocol support'
            'python-pykeepass: KeePass (.kdbx) secret backend')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31b51d8a8cbbf616d75ce6b100f66e8aa9d2d4631a0dac468dff04ea03208ab1')

build() {
	# rdp_tab=enabled: fail here rather than quietly ship without RDP tabs.
	arch-meson "${pkgname}-${pkgver}" build -Drdp_tab=enabled
	meson compile -C build
}

check() {
	# Validates the .desktop entry and the AppStream metainfo.
	meson test -C build --print-errorlogs
}

package() {
	# Only needed at run time.
	depends+=('python-gobject' 'python-cairo' 'python-cryptography'
	          'python-keyring' 'python-psutil' 'python-yaml' 'openssh'
	          'libsecret' 'libadwaita' 'vte4' 'gtksourceview5' 'sshpass'
	          'webkitgtk-6.0')

	meson install -C build --destdir "${pkgdir}"
	# The bundled gtk4-frdp (RDP tab) lives privately in /usr/lib/sshpilot;
	# its unversioned .so link is a development file.
	rm -f "${pkgdir}/usr/lib/sshpilot/libgtk4-frdp-4.0.so"
	install -Dm644 "${pkgname}-${pkgver}/subprojects/gtk4-frdp/NOTICE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/gtk4-frdp-NOTICE"
}

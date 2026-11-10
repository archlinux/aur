# Maintainer: Amp <https://ampcode.com>
#
# Repackages the desktop app's .deb, which already carries the .desktop file (with the sign-in
# callback scheme) and the icon. Publishing a version sets pkgver and both checksums to the debs it
# uploaded; see desktop/README.md.

pkgname=amp-desktop-bin
_pkgname=amp-desktop
pkgver=0.1.29905201
pkgrel=1
pkgdesc='Amp, the frontier coding agent, as a desktop app'
arch=('x86_64' 'aarch64')
url='https://ampcode.com'
license=('LicenseRef-proprietary')
# What the Electron binary links, libnotify for notifications, and xdg-open for sign-in and links.
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'mesa' 'libnotify' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_url="https://static.ampcode.com/linux/${pkgver}/${_pkgname}-${pkgver}"
# Saved under the pacman architecture name, so package() finds the right one by $CARCH.
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${_url}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${_url}-arm64.deb")
noextract=("${_pkgname}-${pkgver}-x86_64.deb" "${_pkgname}-${pkgver}-aarch64.deb")
# Publishing (.buildkite/scripts/linux-desktop-build.sh) sets these to the debs' checksums.
sha256sums_x86_64=('73a28ec5b5d9bc5eb3fb83ab996d5d1db825d333da90a1eb086cb05972a5c5b3')
sha256sums_aarch64=('5b927aea4242a8e0b34bc5c23a48185dd50ee21ea3c8227fcec6a7f9e54ec3a9')

package() {
	bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc"

	# The deb's install script makes this link, and pacman does not run it.
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/amp/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	# Not `license`: makepkg reads that array after package() returns.
	for file in LICENSE.electron.txt LICENSES.chromium.html; do
		ln -s "/opt/amp/${file}" "${pkgdir}/usr/share/licenses/${pkgname}/${file}"
	done
}

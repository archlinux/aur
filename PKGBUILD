# Maintainer: Amp <https://ampcode.com>
#
# Repackages the desktop app's .deb, which already carries the .desktop file (with the sign-in
# callback scheme) and the icon. Publishing a version sets pkgver and both checksums to the debs it
# uploaded; see desktop/README.md.

pkgname=amp-desktop-bin
_pkgname=amp-desktop
pkgver=0.1.29907961
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
sha256sums_x86_64=('7f2f61d0e74dbf4f53d6659746ac6e7381fda80a03c9a5386946f7c200b32c11')
sha256sums_aarch64=('18935eb7c6109f1a7b44c947bfc4984e240eec5fb8d6cbc962447e0f6f5605e2')

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

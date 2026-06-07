# Maintainer: empyrealm
pkgname=intel-vtune-bin
pkgver=2026.0.0.329
pkgrel=2
pkgdesc='Intel VTune Profiler — GPU/CPU performance analysis tool with Intel iGPU and Vulkan support'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html'
license=('LicenseRef-Intel-EULA')
depends=('glibc' 'gcc-libs' 'libx11' 'libxcb' 'libxext' 'libxrender'
	'mesa' 'fontconfig' 'freetype2' 'dbus' 'libxkbcommon'
	'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland'
	'gtk3' 'libxcrypt-compat')
makedepends=('libarchive')
optdepends=(
	'intel-gpu-tools: Intel iGPU info and metrics'
	'vulkan-intel: Intel iGPU Vulkan driver'
	'intel-media-driver: Intel iGPU media/video support')
provides=('vtune' 'intel-vtune')
conflicts=('intel-vtune-profiler-standalone' 'intel-oneapi-vtune')
options=('!strip')

_installer="intel-vtune-${pkgver}_offline.sh"
_pkgver_short="2026.0.0+325"
source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/a00e5b88-bdcc-4dc4-aa00-142fc59aba25/${_installer}")
sha256sums=('SKIP')

prepare() {
	# Extract the self-extracting shell archive payload without running the installer.
	# -x = extract only, -f = target folder. Avoids the /opt write-permission check.
	sh "${srcdir}/${_installer}" -x -f "${srcdir}/extracted"
}

package() {
	local _extracted="${srcdir}/extracted/intel-vtune-${pkgver}_offline"
	local _cup="${_extracted}/packages/intel.oneapi.lin.vtune,v=${_pkgver_short}/cupPayload.cup"

	local _payload="${srcdir}/payload"
	mkdir -p "${_payload}"
	bsdtar --no-same-owner -xf "${_cup}" -C "${_payload}"

	local _vtunedir="${_payload}/_installdir/vtune/2026.0"

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a "${_vtunedir}/." "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/bin64/vtune"     "${pkgdir}/usr/bin/vtune"
	ln -s "/opt/${pkgname}/bin64/vtune-gui" "${pkgdir}/usr/bin/vtune-gui"

	install -dm755 "${pkgdir}/etc/profile.d"
	cat > "${pkgdir}/etc/profile.d/intel-vtune-bin.sh" << 'EOF'
if [ -f /opt/intel-vtune-bin/vtune-vars.sh ]; then
	. /opt/intel-vtune-bin/vtune-vars.sh
fi
EOF
	chmod 644 "${pkgdir}/etc/profile.d/intel-vtune-bin.sh"

	install -Dm644 "${pkgdir}/opt/${pkgname}/bin64/resources/app/icons/VTune.png" \
		"${pkgdir}/usr/share/pixmaps/intel-vtune.png"

	install -dm755 "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/intel-vtune.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Intel VTune Profiler
Comment=GPU/CPU performance analysis tool with Intel iGPU and Vulkan support
Exec=vtune-gui
Icon=intel-vtune
Terminal=false
Categories=Development;Profiling;
EOF

	local _license="${_extracted}/packages/intel.oneapi.lin.vtune.product,v=${_pkgver_short}/licenses"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	if [[ -d "${_license}" ]]; then
		cp -a "${_license}/." "${pkgdir}/usr/share/licenses/${pkgname}/"
	else
		install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
}

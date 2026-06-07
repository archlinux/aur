# Maintainer: empyrealm
pkgname=intel-vtune-bin
pkgver=2026.0.0.329
pkgrel=1
pkgdesc='Intel VTune Profiler — GPU/CPU performance analysis tool with Intel iGPU and Vulkan support'
arch=('x86_64')
url='https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html'
license=('LicenseRef-Intel-EULA')
depends=('glibc' 'gcc-libs' 'libx11' 'libxcb' 'libxext' 'libxrender'
	'mesa' 'fontconfig' 'freetype2' 'dbus' 'libxkbcommon'
	'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland'
	'gtk3' 'libxcrypt-compat')
optdepends=(
	'intel-gpu-tools: Intel iGPU info and metrics'
	'vulkan-intel: Intel iGPU Vulkan driver'
	'intel-media-driver: Intel iGPU media/video support')
provides=('vtune' 'intel-vtune')
conflicts=('intel-vtune-profiler-standalone' 'intel-oneapi-vtune')
options=('!strip')

_installer="intel-vtune-${pkgver}_offline.sh"
source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/a00e5b88-bdcc-4dc4-aa00-142fc59aba25/${_installer}")
sha256sums=('SKIP')

prepare() {
	chmod +x "${srcdir}/${_installer}"
}

package() {
	local _installdir="${srcdir}/vtune-install"
	mkdir -p "${_installdir}"

	sh "${srcdir}/${_installer}" \
		-a \
		--silent \
		--eula accept \
		--install-dir "${_installdir}"

	local _vtunedir
	_vtunedir="$(find "${_installdir}" -maxdepth 3 -type d -name "vtune" | head -n1)"

	if [[ -z "${_vtunedir}" ]]; then
		_vtunedir="$(find "${_installdir}" -maxdepth 4 -type d -name "latest" | head -n1)"
	fi

	[[ -n "${_vtunedir}" ]] || {
		echo "Failed to locate vtune install directory under ${_installdir}" >&2
		return 1
	}

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a "${_vtunedir}/." "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/bin/vtune" "${pkgdir}/usr/bin/vtune"
	if [[ -f "${pkgdir}/opt/${pkgname}/bin/vtune-gui" ]]; then
		ln -s "/opt/${pkgname}/bin/vtune-gui" "${pkgdir}/usr/bin/vtune-gui"
	fi

	install -dm755 "${pkgdir}/etc/profile.d"
	cat > "${pkgdir}/etc/profile.d/intel-vtune-bin.sh" << 'EOF'
if [ -f /opt/intel-vtune-bin/vtune-vars.sh ]; then
	source /opt/intel-vtune-bin/vtune-vars.sh
fi
EOF
	chmod 644 "${pkgdir}/etc/profile.d/intel-vtune-bin.sh"

	install -dm755 "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/intel-vtune.desktop" << 'EOF'
[Desktop Entry]
Name=Intel VTune Profiler
Comment=GPU/CPU performance analysis tool with Intel iGPU and Vulkan support
Exec=/opt/intel-vtune-bin/bin/vtune-gui
Icon=intel-vtune
Terminal=false
Type=Application
Categories=Development;Profiling;
EOF

	local _icon
	_icon="$(find "${pkgdir}/opt/${pkgname}" -name "*.png" -path "*/vtune*" | head -n1)"
	if [[ -n "${_icon}" ]]; then
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/intel-vtune.png"
	fi

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	local _eula
	_eula="$(find "${pkgdir}/opt/${pkgname}" -name "EULA*" -o -name "eula*" -o -name "LICENSE*" | head -n1)"
	if [[ -n "${_eula}" ]]; then
		install -Dm644 "${_eula}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	else
		install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
}

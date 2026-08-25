# Maintainer: empyrealm
pkgname=nvidia-nsight-systems-bin
pkgver=2026.4.1.191
pkgrel=1
pkgdesc='NVIDIA Nsight Systems — system-wide performance analysis tool'
arch=('x86_64')
url='https://developer.nvidia.com/nsight-systems'
license=('LicenseRef-NVIDIA-SLA')
depends=('dbus' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'krb5' 'libdrm'
	'libglvnd' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
	'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxkbfile' 'libxrandr'
	'libxrender' 'libxshmfence' 'libxtst' 'ncurses' 'nspr' 'nss' 'wayland'
	'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms'
	'xcb-util-renderutil' 'xcb-util-wm')
optdepends=('cuda: CUDA profiling support'
	'nvidia-utils: NVIDIA GPU profiling')
provides=("nsight-systems=${pkgver}")
conflicts=('nsight-systems')
options=('!strip')

_release="${pkgver%.*}"
_year="${pkgver%%.*}"
_rest="${pkgver#*.}"
_month="${_rest%%.*}"
_deb="nsight-systems-${_release}_${pkgver}-1_amd64.deb"
source=("${_deb}::https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/${_year}_${_month}/${_deb}")
noextract=("${_deb}")
sha256sums=('8aeaf8c73401ccafb0b9bbe59981a6fcc97a038388462b15ef48ff75458aba19')

prepare() {
	cd "${srcdir}"

	bsdtar -xf "${_deb}" data.tar.gz
	bsdtar -xf data.tar.gz
}

package() {
	cd "${srcdir}/opt/nvidia/nsight-systems/${_release}"

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a . "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/bin/nsys" "${pkgdir}/usr/bin/nsys"
	ln -s "/opt/${pkgname}/bin/nsys-ui" "${pkgdir}/usr/bin/nsys-ui"

	install -Dm644 host-linux-x64/nsys-ui.png "${pkgdir}/usr/share/pixmaps/nsight-systems.png"

	install -dm755 "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/nsight-systems.desktop" << 'EOF'
[Desktop Entry]
Name=NVIDIA Nsight Systems
Comment=System-wide performance analysis tool
Exec=/opt/nvidia-nsight-systems-bin/bin/nsys-ui
Icon=nsight-systems
Terminal=false
Type=Application
Categories=Development;Profiling;
EOF

	install -Dm644 EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
}

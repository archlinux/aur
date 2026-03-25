# Maintainer: empyrealm
pkgname=nvidia-nsight-systems-bin
pkgver=2025.6.3.343
pkgrel=1
pkgdesc='NVIDIA Nsight Systems — system-wide performance analysis tool'
arch=('x86_64')
url='https://developer.nvidia.com/nsight-systems'
license=('custom:NVIDIA')
depends=('glibc' 'gcc-libs' 'libx11' 'libxcb' 'libxext' 'libxrender'
	'mesa' 'fontconfig' 'freetype2' 'dbus' 'libxkbcommon'
	'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland')
optdepends=('cuda: CUDA profiling support'
	'nvidia-utils: NVIDIA GPU profiling')
provides=('nsight-systems')
conflicts=('nsight-systems')
options=('!strip')
_archive="nsight_systems-linux-x86_64-${pkgver}-archive"
source=("https://developer.download.nvidia.com/compute/cuda/redist/nsight_systems/linux-x86_64/${_archive}.tar.xz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${_archive}"

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

	install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	if [ -f EULA.txt ]; then
		install -Dm644 EULA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	elif [ -f LICENSE ]; then
		install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
}

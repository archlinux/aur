# Maintainer: marsjan155 <marcin155@gmail.com>
# Repackages the AppImage of the OrcaSlicer fork with a local Remote API for MCP:
# https://github.com/MaxEllis/OrcaSlicer
# Installs side by side with orca-slicer / orca-slicer-bin (own dir, binary, desktop entry and icon).
# NOTE: the fork keeps SLIC3R_APP_KEY "OrcaSlicer", so it shares the config directory
# ~/.config/OrcaSlicer (profiles, presets) with the regular OrcaSlicer.
pkgname=orcaslicer-mcp-bin
pkgver=2.4.2_mcp.13
pkgrel=1
pkgdesc="OrcaSlicer fork with a local Remote API for AI assistants (MCP)"
arch=('x86_64')
url="https://github.com/MaxEllis/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('at-spi2-core' 'cairo' 'dbus' 'expat' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2'
	'glibc' 'glu' 'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'harfbuzz' 'hicolor-icon-theme'
	'libglvnd' 'libice' 'libmspack' 'libsecret' 'libsm' 'libsoup3' 'libx11' 'libxext'
	'libxkbcommon' 'mesa' 'pango' 'wayland' 'webkit2gtk-4.1' 'xz' 'zlib')
makedepends=('squashfs-tools')
options=('!strip' '!debug' '!emptydirs')
install=${pkgname}.install
# Release tag, e.g. pkgver 2.4.2_mcp.13 -> tag v2.4.2-mcp.13
_tag="v${pkgver//_/-}"
_appimage="OrcaSlicer-MCP-${_tag#v}-linux-x64.AppImage"
noextract=("${_appimage}")
source_x86_64=("${_appimage}::${url}/releases/download/${_tag}/${_appimage}")
sha256sums_x86_64=('7dc7b6ec93776531a151ca4942281658e60466ab282ce24d42c94f406d7b24f4')

prepare() {
	# Squashfs payload starts right after the ELF runtime (end of section header table)
	local offset
	offset=$(od -An -j 40 -N 8 -t u8 "${_appimage}" | tr -d ' ')
	offset=$((offset + $(od -An -j 58 -N 2 -t u2 "${_appimage}" | tr -d ' ') \
		* $(od -An -j 60 -N 2 -t u2 "${_appimage}" | tr -d ' ')))
	rm -rf squashfs-root
	unsquashfs -q -n -o "${offset}" -d squashfs-root "${_appimage}"
}

package() {
	local _dest="/opt/${pkgname%-bin}"

	install -dm755 "${pkgdir}/opt"
	cp -a squashfs-root "${pkgdir}${_dest}"
	chmod 755 "${pkgdir}${_dest}"
	# AppImage-only metadata, replaced by our own desktop entry and icon below
	rm -rf "${pkgdir}${_dest}"/{usr,.DirIcon,*.desktop}

	# AppRun resolves its own location via readlink -f, so a plain symlink works
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_dest}/AppRun" "${pkgdir}/usr/bin/orca-slicer-mcp"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/orca-slicer-mcp.desktop" <<-'EOF'
		[Desktop Entry]
		Name=OrcaSlicer MCP
		GenericName=3D Printing Slicer
		Comment=OrcaSlicer with a local Remote API for AI assistants (MCP)
		Exec=orca-slicer-mcp %F
		Icon=orca-slicer-mcp
		Terminal=false
		Type=Application
		PrefersNonDefaultGPU=true
		X-KDE-RunOnDiscreteGpu=true
		Categories=Graphics;3DGraphics;Engineering;
		Keywords=3d;slicer;printing;orca;mcp;
		MimeType=model/stl;model/3mf;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;application/x-amf;model/step;
	EOF

	install -Dm644 squashfs-root/OrcaSlicer.png \
		"${pkgdir}/usr/share/icons/hicolor/192x192/apps/orca-slicer-mcp.png"
}

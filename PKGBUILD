# Maintainer: Voylin <voylinslife@gmail.com>

_gitname="GoZen"
_godot_version="4.4.1"

pkgname=gozen
pkgver=0.3
pkgrel=1 # Increment this if you change the PKGBUILD but not pkgver.
pkgdesc="A minimalistic video editor"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
options=('!debug')
makedepends=(
    'git'
    'scons'
    'python'
    'gcc'
    'pkgconf'
    'unzip'
    'wget'
    'ffmpeg>=6.1'
    'yasm'
)
depends=(
    'ffmpeg>=6.1'
)
optdepends=(
    'x264: for H.264 encoding support via FFmpeg'
    'x265: for H.265/HEVC encoding support via FFmpeg'
)
source=(
	# NOTE: Change -alpha once going into beta
	"git+https://github.com/VoylinsGamedevJourney/GoZen.git#tag=v${pkgver}-alpha"
    "godot-editor.zip::https://github.com/godotengine/godot-builds/releases/download/${_godot_version}-stable/Godot_v${_godot_version}-stable_linux.x86_64.zip"
    "godot-templates.tpz::https://github.com/godotengine/godot-builds/releases/download/${_godot_version}-stable/Godot_v${_godot_version}-stable_export_templates.tpz"
)
sha256sums=('b3b1fb5094e9dc6f3cb701388a632cd3c8998c3c697a3dc0d1d7708748f7125e'
            'd6e382fb531019f85630c1f485a561a0d20c4a2344b6c3847735cfee7da812aa'
            '7a8d14ade489fd4d22f178193021fe8a876a9e51068ed4dde26dac3ae4c59a88')

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init --recursive
	
	# Set version in project.godot.
	msg "Setting project version to ${pkgver}..."
	sed -i "s|^config/version\s*=.*|config/version=\"${pkgver}\"|" src/project.godot
	
	# Fix the gozen.gdextension file for system FFmpeg build.
	sed -i '/\[dependencies\]/,$d' "src/gozen.gdextension"
	
	# Prepare Godot export templates directory structure.
    if [ ! -d ~/.local/share/godot/export_templates/${_godot_version}.stable ]; then
		msg "Preparing Godot export templates ..."
		mkdir -p "$HOME/.local/share/godot/export_templates/${_godot_version}.stable"
		unzip -o -d "$HOME/.local/share/godot/export_templates/${_godot_version}.stable" "${srcdir}/godot-templates.tpz"
		mv "$HOME/.local/share/godot/export_templates/${_godot_version}.stable/templates/"* \
		   "$HOME/.local/share/godot/export_templates/${_godot_version}.stable/"
		rmdir "$HOME/.local/share/godot/export_templates/${_godot_version}.stable/templates"
    else
		msg "Godot export templates found in cache."
	fi
	
	# Make Godot editor executable.
	chmod +x "${srcdir}/Godot_v${_godot_version}-stable_linux.x86_64"
}

build() {
	cd "${srcdir}/${_gitname}"
	
	# Compile GDE GoZen
	msg "Compiling GDExtension GoZen..."
	cd libs
	scons -j$(nproc) platform=linux arch=x86_64 target=template_debug use_system=yes
	scons -j$(nproc) platform=linux arch=x86_64 target=template_release use_system=yes
	cd ..
	
	msg "Exporting Godot project for Linux..."
	mkdir -p "${srcdir}/export_output"
	
	"${srcdir}/Godot_v${_godot_version}-stable_linux.x86_64" \
		--import "src/godot.project" --headless
	"${srcdir}/Godot_v${_godot_version}-stable_linux.x86_64" \
		--headless --path "src" --export-release "Linux_x86_64" \
	  	"${srcdir}/export_output/GoZen.x86_64"
	
	if [ ! -f "${srcdir}/export_output/GoZen.x86_64" ]; then
	  error "Godot export failed. Check export preset name and paths."
	  return 1
	fi
}

package() {
	cd "${srcdir}/${_gitname}"
	
	# Install application to /opt.
	install -d "${pkgdir}/opt/${pkgname}"
	
	# Copy all contents from the export_output directory.
	cp -r "${srcdir}/export_output/"* "${pkgdir}/opt/${pkgname}/"
	
	# Ensure executable permissions.
	chmod +x "${pkgdir}/opt/${pkgname}/GoZen.x86_64"
	
	# And any .so files if they were copied there.
	find "${pkgdir}/opt/${pkgname}" -name '*.so' -exec chmod +x {} \;
	
	# Create a symlink.
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/GoZen.x86_64" "${pkgdir}/usr/bin/${pkgname}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
	install -Dm644 "gozen.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "assets/gozen_icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 "assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

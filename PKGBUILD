# Maintainer: Voylin <voylinslife@gmail.com>

_gitname="GoZen"
_godot_version="4.5-stable"

pkgname=gozen
pkgver=0.4.1
pkgrel=1 # Increment this if you change the PKGBUILD but not pkgver.
pkgdesc="A minimalistic video editor"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
conflicts=('gozen-git' 'gozen-bin')
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
    "godot-editor-${_godot_version}.zip::https://github.com/godotengine/godot-builds/releases/download/${_godot_version}/Godot_v${_godot_version}_linux.x86_64.zip"
    "godot-templates-${_godot_version}.tpz::https://github.com/godotengine/godot-builds/releases/download/${_godot_version}/Godot_v${_godot_version}_export_templates.tpz"
)
sha256sums=('d8d0b4c4e08fb41b16afc928da218e1726ac887801e5134a95098a3ae03ddb44'
            'c7316e1fd782ad276a4d985a7673b5976eaaa8d90561a2bea5289210dc53e9ba'
            '375d83b661794f91746d2dec9b569a99d4d24f85a70c4ec0068aafb18b551d53')

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init --recursive
	
	# Set version in project.godot.
	msg "Setting project version to ${pkgver}..."
	sed -i "s|^config/version\s*=.*|config/version=\"${pkgver}\"|" src/project.godot
	
	# Fix the gozen.gdextension file for system FFmpeg build.
	sed -i '/\[dependencies\]/,$d' "src/gozen.gdextension"
	
	# Prepare Godot export templates directory structure.
    if [ ! -d ~/.local/share/godot/export_templates/${_godot_version/-/.} ]; then
		msg "Preparing Godot export templates ..."
		mkdir -p "$HOME/.local/share/godot/export_templates/${_godot_version/-/.}"
		unzip -o -d "$HOME/.local/share/godot/export_templates/${_godot_version/-/.}" "${srcdir}/godot-templates-${_godot_version}.tpz"
		mv "$HOME/.local/share/godot/export_templates/${_godot_version/-/.}/templates/"* \
		   "$HOME/.local/share/godot/export_templates/${_godot_version/-/.}/"
		rmdir "$HOME/.local/share/godot/export_templates/${_godot_version/-/.}/templates"
    else
		msg "Godot export templates found in cache."
	fi

	msg "Extracting Godot editor..."
	unzip -o "${srcdir}/godot-editor-${_godot_version}.zip" -d "${srcdir}"
	chmod +x "${srcdir}/Godot_v${_godot_version}_linux.x86_64"
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
	
	"${srcdir}/Godot_v${_godot_version}_linux.x86_64" \
		--import "src/godot.project" --headless
	"${srcdir}/Godot_v${_godot_version}_linux.x86_64" \
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
	install -Dm644 "assets/linux/gozen.desktop" "${pkgdir}/usr/share/applications/gozen.desktop"
	install -Dm644 "assets/linux/gozen.xml" "${pkgdir}/usr/share/mime/packages/gozen.xml"
	install -Dm644 "assets/linux/gozen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gozen.png"
	install -Dm644 "assets/linux/gozen.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gozen.svg"
}

# Maintainer: Seth Pendergrass <seth at pendergrass dot dev>
# Contributor: Nil Geisweiller <ngeiswei at the giant g>

pkgname=ctrlr
pkgver=5.7.1
pkgrel=3
pkgdesc="Control any MIDI enabled hardware: synthesizers, drum machines, samplers, effects. Create custom user interfaces. Host them as VST3 plugins in your favorite DAWs."
arch=('x86_64')
url="https://github.com/RomanKubiak/ctrlr"
license=('BSD')
groups=('pro-audio')
depends=('alsa-lib' 'freetype2' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr' 'binutils' 'systemd-libs')
makedepends=('git' 'cmake' 'gcc' 'webkit2gtk' 'zlib')
provides=('ctrlr')
conflicts=('ctrlr')
source=("${pkgname}::git+https://github.com/RomanKubiak/ctrlr.git#commit=8aa00d82127acda42ad9ac9b7b479461e9436aa4")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"

	# Initialize submodules (Panels)
	git submodule update --init --recursive

	# Extract bundled boost headers (shipped as zip)
	cd Source/Misc/boost
	unzip -qo boost.zip

	cd "${srcdir}/${pkgname}"

	# Remove VST2 SDK references (proprietary, unavailable)
	sed -i '/juce_set_vst2_sdk_path/d' CMakeLists.txt
	sed -i 's/FORMATS VST3 VST AU Standalone/FORMATS VST3 Standalone/' CMakeLists.txt

	# Fix bfd_copy_private_section_data for binutils >= 2.44 (now requires 5 args)
	sed -i 's/bfd_copy_private_section_data(ihandle, iscn, ohandle, oscn)/bfd_copy_private_section_data(ihandle, iscn, ohandle, oscn, NULL)/g' \
		Source/Misc/libr-bfd.c

	# Fix bfd_set_reloc, removed in binutils >= 2.46. It only ever set these two
	# section fields, so assign them directly (brace the if-branch to keep else attached).
	sed -i \
		-e 's/bfd_set_reloc(ohandle, oscn, NULL, 0);/{ oscn->orelocation = NULL; oscn->reloc_count = 0; }/' \
		-e 's/bfd_set_reloc(ohandle, oscn, reloc_buffer, reloc_count);/oscn->orelocation = reloc_buffer; oscn->reloc_count = reloc_count;/' \
		Source/Misc/libr-bfd.c

	# Disable JUCE_DEBUG (causes jassertfalse to abort on non-fatal assertions)
	sed -i 's/JUCE_DEBUG=1/JUCE_DEBUG=0/' CMakeLists.txt
}

build() {
	cd "${pkgname}"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="-w"
	cmake --build build -j2
}

package() {
	cd "${pkgname}"

	# Standalone binary
	install -Dm755 build/ctrlr_artefacts/Release/Standalone/ctrlr \
		"${pkgdir}/usr/bin/ctrlr"

	# VST3 plugin
	install -d "${pkgdir}/usr/lib/vst3"
	cp -r build/ctrlr_artefacts/Release/VST3/ctrlr.vst3 \
		"${pkgdir}/usr/lib/vst3/"

	# License
	install -Dm644 LICENSE-BSD "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

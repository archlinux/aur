# Maintainer: Sematre <sematre at gmx dot de>
pkgname=videosubfinder
pkgver=5.80
pkgrel=1

pkgdesc="Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD."
arch=('x86_64')
url="https://sourceforge.net/projects/videosubfinder/"
license=('GPL2')

depends=('gtk3' 'wxwidgets-gtk3' 'opencv' 'ffmpeg4.4' 'tbb')
makedepends=('git' 'cmake' 'imagemagick')

source=("${pkgname}::git+https://git.code.sf.net/p/videosubfinder/src#tag=VideoSubFinder_${pkgver}"
        "videosubfinder.desktop"
        "start-videosubfinder.sh")
sha256sums=('SKIP'
            'b58e06818ca3314f0df91bd67edaa3bbce423cbd8b1160a23ef813585a95558c'
            '66a56f0b676f1dfd4a61335219a5c5fd022b2ab95d36b7ce3fc8f3774277addd')

build() {
	cd "${srcdir}"

	# Build without CUDA support
	cmake -B build -S "${pkgname}" \
			-DCMAKE_BUILD_TYPE=Release \
			-DUSE_CUDA=OFF \
			-DFFMPEG_INCLUDE_DIRS='/usr/include/ffmpeg4.4' \
			-DCMAKE_INSTALL_PREFIX='/usr'

	cmake --build build

	# Convert app icon from ico to png
	convert "${pkgname}/Interfaces/VideoSubFinderWXW/videosubfinder.ico" "build/${pkgname}.png"
}

package() {
	cd "${srcdir}"

	# Install the start script
	install -Dm755 "start-videosubfinder.sh" "${pkgdir}/usr/bin/videosubfinder"
	ln -s "videosubfinder" "${pkgdir}/usr/bin/VideoSubFinderWXW"

	# Install the project files
	install -Dm755 "build/Interfaces/VideoSubFinderWXW/VideoSubFinderWXW" -t "${pkgdir}/usr/share/${pkgname}"
	cp -r "videosubfinder/Build/Release_x64/bitmaps/"  "${pkgdir}/usr/share/${pkgname}/"
	cp -r "videosubfinder/Build/Release_x64/settings/" "${pkgdir}/usr/share/${pkgname}/"

	# Install project docs and assets
	find "videosubfinder/Docs/" -type f -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/doc/${pkgname}" \;
	install -Dm644 "build/${pkgname}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

	touch report.log
	install -Dm777 "report.log" -t "${pkgdir}/usr/share/${pkgname}"
}

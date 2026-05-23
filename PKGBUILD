# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: hoverth
# Adapted from AUR package `organicmaps` by nesk_aur
pkgname=comaps
pkgver=2026.05.06_11
_tag="v${pkgver%%_*}-${pkgver##*_}"
pkgrel=2
pkgdesc="CoMaps: Offline Hike, Bike, Trails and Navigation"
arch=(x86_64)
makedepends=(
	cmake
	cppdap
	gcc
	gcovr
	git
	jq
	libpng
	libxcursor
	libxi
	libxinerama
	libxrandr
	mold
	ninja
	optipng
	python
	python-protobuf
	qt6-svg
	vulkan-headers
	wget
)

depends=(
	freetype2
	glibc
	harfbuzz
	hicolor-icon-theme
	icu
	libglvnd
	qt6-base
	qt6-positioning
	zlib
)

optdepends=("ccache: faster re-compilation" "qt6-wayland: for Wayland users")
license=('Apache-2.0')
url="https://comaps.app"
_source_url="https://codeberg.org/comaps/comaps.git"
source=(comaps.desktop
	relax-protobuf-version.patch)
sha256sums=('21f70d6c3282fcec0165c9b9f8082e081ecb50b423ae286ffd4ccde4cc794563'
            'cc620aac73157f0f16f480c6956e40edcafa3884d9fb96e17d08d2d02da39a47')
conflicts=("${pkgname}-bin" "${pkgname}-git")
prepare() {
	avail=$(df -P -B 1048576 ${srcdir} | awk 'NR>1 {print $4}')
	if [ $avail -le 5120 ]; then
		printf "need at least 5 GiB of free space\n"
		exit 1
	fi

	src_url=${_source_url}
	if [ -n "$SOURCE_URL_REWRITER" ]; then
		src_url=$($SOURCE_URL_REWRITER $_source_url)
		case $src_url in
		file://*)
			git -C ${src_url#file://} fetch --depth=1 origin "$_tag"
			;;
		esac
	fi
	if [ ! -d ${pkgname} ]; then
		git clone --depth=1 --single-branch -b "$_tag" --filter=blob:limit=128k \
			$src_url $pkgname
	fi

	cd ${pkgname}
	git -c protocol.file.allow=always submodule update --init --recursive --depth=1
	rm -f 3party/boost/b2

	# Apply patch to relax protobuf version check
	patch -p1 <"${srcdir}/relax-protobuf-version.patch"

	# Use pure-Python protobuf implementation for compatibility with protobuf >= 4.x
	export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
	bash ./configure.sh
}
build() {
	cd ${pkgname}
#	env CC=gcc CXX=g++ tools/unix/build_omim.sh -c -r desktop
	env CFLAGS="-fuse-ld=mold" CXXFLAGS="-fuse-ld=mold" CC=gcc CXX=g++ \
    	tools/unix/build_omim.sh -n $(nproc) -c -r desktop
}
package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -Lr "${pkgname}/data" "${pkgdir}/usr/share/${pkgname}/"

	# Remove test data and python scripts (not needed at runtime)
	rm -rf "${pkgdir}/usr/share/${pkgname}/data/test_data"
	rm -rf "${pkgdir}/usr/share/${pkgname}/data/conf"

	install -dm777 "${pkgdir}/usr/share/${pkgname}/data/$(jq '.v' ${pkgname}/data/countries.txt)"

	install -Dm644 "${pkgname}/android/.idea/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	# install -Dm755 "omim-build-debug/CoMaps" "${pkgdir}/usr/bin/comaps"
	install -Dm755 "omim-build-release/CoMaps" "${pkgdir}/usr/bin/comaps"
	install -Dm644 "comaps.desktop" -t "${pkgdir}/usr/share/applications"
}

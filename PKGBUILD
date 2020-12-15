# Maintainer: bcareil <baptiste.careil@gmail.com>

pkgname='path-of-building-community-git'
pkgrel=1
pkgdesc="An offline build planner for Path of Exile using PoBFrontent, LocalIdentity's fork"
arch=('x86_64')
url='https://github.com/PathOfBuildingCommunity/PathOfBuilding'
license=('MIT')
pkgver=1.4.170.18.r3094.38.481

depends=('zlib' 'qt5-base' 'luajit' 'libgl' 'curl' 'ttf-liberation' 'ttf-bitstream-vera')
makedepends=('meson' 'ninja' 'unzip' 'rsync')

source=(
	'git+https://github.com/PathOfBuildingCommunity/PathOfBuilding'
	'git+https://github.com/philroberts/pobfrontend'
	'git+https://github.com/Lua-cURL/Lua-cURLv3'
	'https://github.com/Openarl/PathOfBuilding/files/1167199/PathOfBuilding-runtime-src.zip'
	'PathOfBuilding.sh'
	'lzip-linux.patch'
	'PathOfBuilding-force-disable-devmode.patch'
	'pobfrontend.patch'
	'PathOfBuilding-logo.svg'
	'PathOfBuilding-logo.png'
	'PathOfBuildingCommunity.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6d21872a2b2bdbfaebb20de5cac28ac402316e5314c97a89049320ff13c2f622'
	'f0489b7dd1dcb3f3c22c41e646a5a85d1c7d63d014df6bf1df14fde4361d692d'
	'9dbc8802b74ceed78f1a6ba1d5b90251f5ae7f9a8cf5497426e4a35001112fcd'
	'1cca891d3fcb74df7cdf7585c1d96f68b7c3a1cca913589730fcb7e7184888d7'
	'a46732538c61af4dd47ae65eb7db56d46d9d33d53e9b04451543c027387937cf'
	'2467d10c7b5e201e337ba334a829e293a07027251bcda2b1f39774a62e8ff194'
	'a64198061f60168ec07df33c37948e343eced7eeafe574cc20bdcf3a1d480cbc'
	'7e3f2870457dc40b44f6be43791901447c5a5754a77551b5ec92ac3a66fc7ee1'
)
noextract=(
	'PathOfBuilding-runtime-src.zip'
)

prepare() {
	# extract the runtime sources including sources for lzip and lcurl
	(mkdir -p "${srcdir}/PathOfBuilding-runtime-src" \
		&& cd "${srcdir}/PathOfBuilding-runtime-src" \
		&& unzip -o "${srcdir}/PathOfBuilding-runtime-src.zip" \
	)
	# patch lzip
	(cd "${srcdir}/PathOfBuilding-runtime-src/LZip" && patch -p1 <"${srcdir}/lzip-linux.patch")
	# disable devmode
	(cd "${srcdir}/PathOfBuilding" && patch -p1 <"${srcdir}/PathOfBuilding-force-disable-devmode.patch")
	# fix pobfrontend to have a writable user dir
	(cd "${srcdir}/pobfrontend" && patch -p1 <"${srcdir}/pobfrontend.patch")
}

pkgver() {
	cd "${srcdir}/PathOfBuilding"
	pob_v=$(head -n1 CHANGELOG.md | sed 's/[^0-9]*\(\w\+\(\.\w\+\)\+\).*/\1/')
	pob_r=$(git rev-list --count HEAD)
	cd "${srcdir}/pobfrontend"
	pf_r=$(git rev-list --count HEAD)
	cd "${srcdir}/Lua-cURLv3"
	lc_r=$(git rev-list --count HEAD)
	printf '%s.r%s.%s.%s' "$pob_v" "$pob_r" "$pf_r" "$lc_r"
}

build() {
	# build lzip.so
	(cd "${srcdir}/PathOfBuilding-runtime-src/LZip" \
		&& g++ ${CXXFLAGS} -W -Wall -fPIC -shared -o lzip.so \
			-I"$(pkgconf luajit --variable=includedir)" \
			lzip.cpp \
			${LDFLAGS} \
			-L"$(pkgconf luajit --variable=libdir)" \
			-l"$(pkgconf luajit --variable=libname)" \
			-lz
		)
	# build lcurl.so
	(cd "${srcdir}/Lua-cURLv3" && make LUA_IMPL=luajit)
	# build pobfrontend
	(cd "${srcdir}/pobfrontend" && meson -Dbuildtype=release build && cd build && ninja)
}

package() {
	dst_dir="${pkgdir}/opt/PathOfBuildingCommunity"
	mkdir -p "${dst_dir}"
	rsync -a '--exclude=.git*' "${srcdir}/PathOfBuilding/" "${dst_dir}"
	cd "$dst_dir"
	# extract skill tree assets
	for f in tree*.zip; do
		unzip -ou "$f"
		rm "$f"
	done
	# extract lua libs
	unzip runtime-win32.zip lua/xml.lua lua/base64.lua lua/sha1.lua
	mv lua/*.lua .
	rmdir lua
	rm runtime-win32.zip
	# tidy-up permissions
	chmod og-w -R "${dst_dir}"
	# install binaries
	install -s -m755 "${srcdir}/PathOfBuilding-runtime-src/LZip/lzip.so" -t "${dst_dir}"
	install -s -m755 "${srcdir}/Lua-cURLv3/lcurl.so" -t "${dst_dir}"
	install -s -m755 "${srcdir}/pobfrontend/build/pobfrontend" -t "${dst_dir}"
	# install shell script
	install -D -m755 "${srcdir}/PathOfBuilding.sh" "${pkgdir}/usr/bin/PathOfBuildingCommunity"
	# install desktop file and icons
	install -D -m644 "${srcdir}/PathOfBuildingCommunity.desktop" "${pkgdir}/usr/share/applications/PathOfBuildingCommunity.desktop"
	install -D -m644 "${srcdir}/PathOfBuilding-logo.svg" "${pkgdir}/usr/share/pixmaps/PathOfBuildingCommunity.svg"
	install -D -m644 "${srcdir}/PathOfBuilding-logo.png" "${pkgdir}/usr/share/pixmaps/PathOfBuildingCommunity.png"
	# licenses
	install -D -m644 "${srcdir}/Lua-cURLv3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/Lua-cURLv3-LICENSE"
	install -D -m644 "${srcdir}/pobfrontend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/pobfrontend-LICENSE"
	install -D -m644 "${srcdir}/PathOfBuilding/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/PathOfBuildingCommunity-LICENSE.md"
}

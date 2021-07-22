# Maintainer: bcareil <baptiste.careil@gmail.com>

pkgname='path-of-building-community-git'
pkgrel=1
pkgdesc="An offline build planner for Path of Exile using PoBFrontend, LocalIdentity's fork"
arch=('x86_64')
url='https://github.com/PathOfBuildingCommunity/PathOfBuilding'
license=('MIT')
pkgver=2.4.0.r4597.59.517

depends=('zlib' 'qt5-base' 'lua51' 'lua51-bitop' 'libgl' 'curl' 'ttf-liberation' 'ttf-bitstream-vera')
makedepends=('meson' 'ninja' 'unzip' 'rsync' 'git')

source=(
	'git+https://github.com/PathOfBuildingCommunity/PathOfBuilding'
	'git+https://gitlab.com/bcareil/pobfrontend.git'
	'git+https://github.com/Lua-cURL/Lua-cURLv3'
	'https://github.com/Openarl/PathOfBuilding/files/1167199/PathOfBuilding-runtime-src.zip'
	'PathOfBuilding.sh'
	'lzip-linux.patch'
	'PathOfBuilding-force-disable-devmode.patch'
	'PathOfBuilding-lua51-bit.patch'
	'PathOfBuilding-lua51-bom.patch'
	'PathOfBuilding-logo.svg'
	'PathOfBuilding-logo.png'
	'PathOfBuildingCommunity.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6d21872a2b2bdbfaebb20de5cac28ac402316e5314c97a89049320ff13c2f622'
	'db9eec714bf9d1c52b1ccd7adc9e720519585becf7f9a1f18cca1888d3e1cc11'
	'9dbc8802b74ceed78f1a6ba1d5b90251f5ae7f9a8cf5497426e4a35001112fcd'
	'cd46475a1bc62240e03abb6b385b0c9b0b911ad828219fd31f98f7742807f935'
    '5b98c9c8fc28def0c068958d1b61e3d1dd7fb21844bdb4c8fddedf91eb193896'
	'48488682fb33acd513eebc8933435749f7626df87ced4bdf89ee803de83a317d'
	'2467d10c7b5e201e337ba334a829e293a07027251bcda2b1f39774a62e8ff194'
	'a64198061f60168ec07df33c37948e343eced7eeafe574cc20bdcf3a1d480cbc'
	'079eff1a5e74cb6d776723f7c3d36349e426edaa332a8177ff8f5e78af56cf64'
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
	(cd "${srcdir}/PathOfBuilding" \
		&& patch --no-backup-if-mismatch -p1 <"${srcdir}/PathOfBuilding-force-disable-devmode.patch" \
		&& patch --no-backup-if-mismatch -p1 <"${srcdir}/PathOfBuilding-lua51-bit.patch" \
		&& patch --no-backup-if-mismatch -p1 <"${srcdir}/PathOfBuilding-lua51-bom.patch" \
	)
}

pkgver() {
	cd "${srcdir}/PathOfBuilding"
	pob_v=$(git describe --tags --abbrev=0 | sed 's/^v//')
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
	(cd "${srcdir}/Lua-cURLv3" && make LUA_IMPL=lua51)
	# build pobfrontend
	(cd "${srcdir}/pobfrontend" && meson -Dbuildtype=release build \
		&& cd build && ninja && strip ./pobfrontend)
}

package() {
	dst_dir="${pkgdir}/opt/PathOfBuildingCommunity"
	mkdir -p "${dst_dir}"
	rsync -a '--exclude=.git*' "${srcdir}/PathOfBuilding/" "${dst_dir}"
	cd "$dst_dir"
	# extract skill tree assets
	#for f in tree*.zip; do
	#	unzip -ou "$f"
	#	rm "$f"
	#done
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

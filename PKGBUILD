# Maintainer: bcareil <baptiste.careil@gmail.com>

pkgname='path-of-building-git'
pkgrel=1
pkgdesc='An offline build planner for Path of Exile using PoBFrontent'
arch=('x86_64')
url='https://github.com/Openarl/PathOfBuilding'
license=('MIT')
pkgver=1.4.156.r996.37.479

depends=('zlib' 'qt5-base' 'luajit' 'libgl' 'curl')
makedepends=('meson' 'ninja' 'unzip' 'rsync')

source=(
	'git+https://github.com/Openarl/PathOfBuilding'
	'git+https://github.com/philroberts/pobfrontend'
	'git+https://github.com/Lua-cURL/Lua-cURLv3'
	'https://github.com/Openarl/PathOfBuilding/files/1167199/PathOfBuilding-runtime-src.zip'
	'PathOfBuilding.sh'
	'PathOfBuilding-force-disable-devmode.patch'
	'pobfrontend-writable-user-dir.patch'
	'lzip-linux.patch'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6d21872a2b2bdbfaebb20de5cac28ac402316e5314c97a89049320ff13c2f622'
	'02b44b44872bae4725bc6de600f4592ce33b26e90fa0f392922004ee15898446'
	'38a09a82f06c2d8738f674c5d2818e5f9580bb25611212507814c97ac25adbd1'
	'58a47220d0d1b0209734fc42c0f7dc603c231985eb52f393a7c28598200503e1'
	'9dbc8802b74ceed78f1a6ba1d5b90251f5ae7f9a8cf5497426e4a35001112fcd'
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
	(cd "${srcdir}/pobfrontend" && patch -p1 <"${srcdir}/pobfrontend-writable-user-dir.patch")
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
	mkdir -p "${pkgdir}/usr/share/"
	rsync -a '--exclude=.git*' "${srcdir}/PathOfBuilding" "${pkgdir}/usr/share/"
	dst_dir="${pkgdir}/usr/share/PathOfBuilding"
	cd "$dst_dir"
	# extract skill tree assets
	for f in tree*.zip; do
		unzip "$f"
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
	install -D -m755 "${srcdir}/PathOfBuilding.sh" "${pkgdir}/usr/bin/PathOfBuilding"
	# licenses
	install -D -m644 "${srcdir}/Lua-cURLv3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/Lua-cURLv3-LICENSE"
	install -D -m644 "${srcdir}/pobfrontend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/pobfrontend-LICENSE"
	install -D -m644 "${srcdir}/PathOfBuilding/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/PathOfBuilding-LICENSE.md"
}

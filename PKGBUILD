# Maintainer: bcareil <baptiste.careil@gmail.com>

pkgname='path-of-building-git'
pkgrel=3
pkgdesc='An offline build planner for Path of Exile using PoBFrontent'
arch=('x86_64')
url='https://github.com/Openarl/PathOfBuilding'
license=('MIT')
pkgver=1.4.170.r1028.37.479

depends=('zlib' 'qt5-base' 'luajit' 'libgl' 'curl')
makedepends=('meson' 'ninja' 'unzip' 'rsync')

source=(
	'git+https://github.com/Openarl/PathOfBuilding'
	'git+https://github.com/philroberts/pobfrontend'
	'git+https://github.com/Lua-cURL/Lua-cURLv3'
	'https://github.com/Openarl/PathOfBuilding/files/1167199/PathOfBuilding-runtime-src.zip'
	'PathOfBuilding.sh'
	'lzip-linux.patch'
	'PathOfBuilding-force-disable-devmode.patch'
	'pobfrontend.patch'
	'PathOfBuilding-logo.svg'
	'PathOfBuilding-logo.png'
	'PathOfBuilding.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6d21872a2b2bdbfaebb20de5cac28ac402316e5314c97a89049320ff13c2f622'
	'fc77fcc29c6e8abe519b0e6cb59b0fca54c00d7b63a0db06ee522dc8866e350f'
	'9dbc8802b74ceed78f1a6ba1d5b90251f5ae7f9a8cf5497426e4a35001112fcd'
	'4b37acb9f25f6841726d6b73e6b893d1376c858e879dd6daf35a1bbae8bc2faf'
	'87cbc36ace84ebd746a5b8ec5a88ffde5b03cea7c633a4d437d46b5434ae86da'
	'2467d10c7b5e201e337ba334a829e293a07027251bcda2b1f39774a62e8ff194'
	'a64198061f60168ec07df33c37948e343eced7eeafe574cc20bdcf3a1d480cbc'
	'2f987cb604ed9de24b00a218198e46160b62e725e41942d92c9781b1d90356db'
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
	dst_dir="${pkgdir}/opt/PathOfBuilding"
	mkdir -p "${dst_dir}"
	rsync -a '--exclude=.git*' "${srcdir}/PathOfBuilding/" "${dst_dir}"
	cd "$dst_dir"
	# extract skill tree assets
	for f in tree*.zip; do
		unzip -u "$f"
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
	# install desktop file and icons
	install -D -m644 "${srcdir}/PathOfBuilding.desktop" "${pkgdir}/usr/share/applications/PathOfBuilding.desktop"
	install -D -m644 "${srcdir}/PathOfBuilding-logo.svg" "${pkgdir}/usr/share/pixmaps/PathOfBuilding.svg"
	install -D -m644 "${srcdir}/PathOfBuilding-logo.png" "${pkgdir}/usr/share/pixmaps/PathOfBuilding.png"
	# licenses
	install -D -m644 "${srcdir}/Lua-cURLv3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/Lua-cURLv3-LICENSE"
	install -D -m644 "${srcdir}/pobfrontend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/pobfrontend-LICENSE"
	install -D -m644 "${srcdir}/PathOfBuilding/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/PathOfBuilding-LICENSE.md"
}

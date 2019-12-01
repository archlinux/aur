# Maintainer: bcareil <baptiste.careil@gmail.com>

pkgname='path-of-building-git'
pkgrel=1
pkgdesc='An offline build planner for Path of Exile using PoBFrontent'
arch=('x86_64')
url='https://github.com/Openarl/PathOfBuilding'
license=('MIT')
pkgver=1.4.152.r895.37

depends=('zlib' 'qt5-base' 'luajit' 'libgl' 'curl')
makedepends=('meson' 'ninja' 'unzip' 'rsync')

source=(
	'git+https://github.com/Openarl/PathOfBuilding'
	'git+https://github.com/philroberts/pobfrontend'
	'git+https://github.com/Lua-cURL/Lua-cURLv3'
	'PathOfBuilding.sh'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'02b44b44872bae4725bc6de600f4592ce33b26e90fa0f392922004ee15898446'
)

#prepare() {
#}

pkgver() {
	cd "${srcdir}/PathOfBuilding"
	pob_v=$(head -n1 CHANGELOG.md | sed 's/[^0-9]*\(\w\+\(\.\w\+\)\+\).*/\1/')
	pob_r=$(git rev-list --count HEAD)
	cd "${srcdir}/pobfrontend"
	pf_r=$(git rev-list --count HEAD)
	printf '%s.r%s.%s' "$pob_v" "$pob_r" "$pf_r"
}

build() {
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
	install -s -m755 "${srcdir}/Lua-cURLv3/lcurl.so" -t "${dst_dir}"
	install -s -m755 "${srcdir}/pobfrontend/build/pobfrontend" -t "${dst_dir}"
	# install shell script
	install -D -m755 "${srcdir}/PathOfBuilding.sh" "${pkgdir}/usr/bin/PathOfBuilding"
	# licenses
	install -D -m644 "${srcdir}/Lua-cURLv3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/Lua-cURLv3-LICENSE"
	install -D -m644 "${srcdir}/pobfrontend/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/pobfrontend-LICENSE"
	install -D -m644 "${srcdir}/PathOfBuilding/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/PathOfBuilding-LICENSE.md"
}

# SPDX-License-Identifier: 0BSD
# Maintainer: Andreas Björkman <akb95@disroot.org>
# Contributor: Julio Campagnolo <juliocampagnolo@gmail.com>
# Contributor: enkvadrat <vide dot jacobsson at gmail dot com>

pkgrel=1
pkgdesc="3D PBR Texture Painting software"
arch=('x86_64')
url="https://armorpaint.org"
license=('Zlib')
pkgname=('armorpaint-git')
_pkgname='paint'
pkgver=.r5977.g7cc11910
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="3D PBR Texture Painting software"
url="https://armorpaint.org/"
license=('Zlib')
options=('!debug')

#https://github.com/armory3d/armortools/wiki/Linux-Dependencies
#sudo pacman -S make clang vulkan-devel gtk3 openssl libxi libxrandr libxcursor

# not sure if alsa and libxinerama is needed but the previus packagebuild had them
# namcap flags them as unused, (maybe some sort of plugin uses them?)
depends=('gtk3'
	 'vulkan-icd-loader'
	 'openssl'
	 'libx11'
	 'libxi'
	 'libxrandr'
	 'libxcursor'
	 'libxinerama'
	 'alsa-lib'
	 'glib2'
	 'hicolor-icon-theme'
 )
makedepends=('git' 'clang' 'make' 'vulkan-headers')

provides=('armorpaint')
conflicts=('armorpaint')

source=("git+https://github.com/armory3d/armortools"
	"armorpaint.desktop"
	"armorpaint.png"
	"armorpaint-mime.xml"
	"armorpaint.sh")

sha256sums=('SKIP'
            '3b9eff484bfd0a7ae2c7811529a705061a4913630debea18b815e1aa55a52416'
            '24c0736b5409a54f2c26c185ce983df51e6e761c8accc9867c72483ada3591d1'
            '2a17a25c3a3246930abcd1f2993915bc5f609ed43647748403371a943fdc2f5c'
        	'55e60274422ed0cfcf6292377597128253f84df8e7f2ef59d7597b099ed6dd37')

pkgver() {
	cd "${srcdir}/armortools/${_pkgname}"
	local _ver=$(grep -Po 'let manifest_version: string\s*=\s*"\K[^"]+' 'sources/manifest.ts')
        # replace spaces
	_ver="${_ver// /.}"
	# version.revision_count.git_hash
	printf "%s.r%s.g%s" \
		"$_ver" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/armortools/${_pkgname}"

	export CC=clang
	export CXX=clang++

	# This will use Vulkan
	../base/make --release --compile
}

package() {
	cd "${srcdir}/armortools/${_pkgname}/build/out"

	# we keep the binary and the data dir together so the auto-lookup works
	install -Dm755 "ArmorPaint" "${pkgdir}/usr/lib/armorpaint/ArmorPaint"
	cp -dr --no-preserve=ownership data "${pkgdir}/usr/lib/armorpaint/"
	# 755 for dirs, 644 for files
	find "${pkgdir}/usr/lib/armorpaint/data" -exec chmod u=rwX,go=rX {} +

	install -Dm755 "${srcdir}/armorpaint.sh" "${pkgdir}/usr/bin/armorpaint"
	install -Dm644 "${srcdir}/armorpaint.desktop" "${pkgdir}/usr/share/applications/armorpaint.desktop"

	install -Dm644 "${srcdir}/armorpaint.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/armorpaint.png"
	install -Dm644 "${srcdir}/armorpaint.png" "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/application-x-armorpaint.png"
	install -Dm644 "${srcdir}/armorpaint-mime.xml" "${pkgdir}/usr/share/mime/packages/armorpaint.xml"

	install -Dm644 "../../../license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

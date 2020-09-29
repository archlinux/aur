# Maintainer: CrankySupertoon <crankysupertoon@gmail.com.com>

pkgname=gamemaker-studio-decompiler-git
_pkgname=AltarNET
pkgver=v1.0.beta.with.bugfixes.r2.g7d2b606
pkgrel=1
pkgdesc='GameMaker: Studio data.win unpacker and decompiler non-YYC, specifically made for Undertale, based on libaltar and Mirrawrs data site'
arch=('x86_64')
makedepends=('clang' 'git')
depends=('mono' 'sdl2')
url='https://github.com/jeason1997/GameMaker-Studio-Decompiler'
conflicts=('gamemaker-studio-decompiler')
license=('DBAD')
source=("${_pkgname}::git+https://github.com/jeason1997/GameMaker-Studio-Decompiler")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Invoke using mono in a wrapper, since wine (if installed) would open it otherwise
	cat > "${pkgname}" <<-EOT
	#!/bin/sh
	/usr/bin/mono /opt/${_pkgname}/${_pkgname} "\$@"
	EOT
}

build() {
	cd "${srcdir}/${_pkgname}"
        msbuild /m Altar.NET.sln /p:Configuration=Release
}

package() {
	cd "${srcdir}/${_pkgname}"
 
        #Link the mono wrapper to the bin folder
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/gamemaker-decompiler"

	#Copy the main executable for the mono wrapper to read
	cd "${srcdir}/${_pkgname}/bin/Release"
	install -Dm755 "altar.exe" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
}

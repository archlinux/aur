# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danielrobbins
_gitname=unroot
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="The Linux root filesystem super-tool"

pkgver=1.0.5
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('make' 'gcc' 'python3')
depends=('glibc' 'libgcc' 'libstdc++' 'libarchive' 'shadow')

options=('!lto' '!strip')

source=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}.tar.xz")
sha256sums=('24730bf857807d20ea9ea4ad3fcbedc7df3e0809c9b5c0f4d2ffd4aa21fa91f0')


build() {
	cd "${srcdir}/${_appname}-${pkgver}/"

	make cli
}

check() {
	cd "${srcdir}/${_appname}-${pkgver}/"

	make check
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}/"

	env -u LD_PRELOAD make DESTDIR="${pkgdir}" install PREFIX="/usr"

	mv "${pkgdir}/usr/share/doc/${pkgname}/${_appname}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

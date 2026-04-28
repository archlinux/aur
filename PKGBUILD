# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cesarferreira
_gitname=keepawake
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Prevents your machine from going to sleep"

pkgver=0.2.0
pkgrel=1
_gitversion="v${pkgver}"

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('rust' 'openssl')
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'xdotool' 'cairo' 'gdk-pixbuf2')

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz"
		"LICENSE")
sha256sums=('b527e8bf0b1610a8dea47ceffdf413c546eed2a92804879bf504e0589e4910d3'
            '79b001a83730c4e2c57553f5609a458ccdf818a819de1c7f8ff0fbb8c16b9aa2')


build() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: ssf <punx69 at gmx dot net>
 
pkgname=gtk3-nocsd-git
pkgver=2.r36
pkgrel=1
pkgdesc="A hack to disable the GTK+3 client side decorations, to integrate them better into other desktop environments"
arch=('x86_64' 'i686')
url='https://github.com/PCMan/gtk3-nocsd'
license=('GPL2')
depends=('gtk3')
makedepends=('pkg-config')
provides=("${pkgname//-git/}=${pkgver}")
conflicts=("${pkgname//-git/}<=${pkgver}")
replaces=("${pkgname//-git/}<=${pkgver}")
source=("${pkgname//-git/}::git://github.com/PCMan/gtk3-nocsd.git")
sha1sums=('SKIP')
 
pkgver() {
	cd "${pkgname//-git/}"
	_ver=$(git describe --abbrev=0 --tags|sed 's/^v//')
	_rev=$(git rev-list --count HEAD)
	printf "$_ver.r$_rev"
}

build() {
	cd "${pkgname//-git/}"
	make
}

package() {
	install -Dm644 "${srcdir}"/"${pkgname//-git/}"/libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0
	install -d "${pkgdir}"/etc/profile.d
	cat <<\EOF >>"${pkgdir}"/etc/profile.d/gtk3-nocsd.sh
##disables overlay scrolling in newer GTK3 versions
export GTK_OVERLAY_SCROLLING=0
##No silly CSD stuff
export GTK_CSD=0
export LD_PRELOAD=/usr/lib/libgtk3-nocsd.so.0
EOF
	chmod +x "${pkgdir}"/etc/profile.d/gtk3-nocsd.sh
} 

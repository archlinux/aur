# Maintainer: ssf <punx69 at gmx dot net>
 
pkgbase=gtk3-nocsd-git
pkgname=('gtk3-nocsd' 'lib32-gtk3-nocsd')
pkgver=2.r36
pkgrel=3
pkgdesc="A hack to disable the GTK+3 client side decorations(works with vanilla GTK3, can be disabled for specific apps)"
arch=('x86_64' 'i686')
url='https://github.com/PCMan/gtk3-nocsd'
license=('GPL2')
depends=('gtk3')
makedepends=('pkg-config' 'gobject-introspection')
source=("${pkgbase//-git/}::git://github.com/PCMan/gtk3-nocsd.git")
sha1sums=('SKIP')
 
pkgver() {
	cd "${pkgbase//-git/}"
	_ver=$(git describe --abbrev=0 --tags|sed 's/^v//')
	_rev=$(git rev-list --count HEAD)
	printf "$_ver.r$_rev"
}

prepare() {
	cd "${pkgbase//-git/}"
	if [ "$(uname -m)" = "x86_64" ]; then
		if (pacman -Q gcc-multilib >/dev/null); then
			if [ ! -d lib32 ];then
				mkdir lib32
				find -type f -not -path '*.git/*' -exec cp -t lib32/ {} +
			fi
		fi
	fi
}

build() {
	cd "${pkgbase//-git/}"
	make
	if [ "$(uname -m)" = "x86_64" ]; then
		if (pacman -Q gcc-multilib >/dev/null); then
			cd lib32
			CFLAGS="-m32" make
		fi
	fi
}

package_gtk3-nocsd() {
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<=${pkgver}")
	install -Dm644 "${srcdir}"/${pkgbase//-git/}/libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0
	install -d "${pkgdir}"/etc/profile.d
	cat <<\EOF >>"${pkgdir}"/etc/profile.d/gtk3-nocsd.sh
## disables the overlay scrollbars in newer GTK3 versions
export GTK_OVERLAY_SCROLLING=0
## No silly CSD stuff
export GTK_CSD=0
export LD_PRELOAD="/usr/\${LIB}/libgtk3-nocsd.so.0:${LD_PRELOAD}"
EOF
	chmod +x "${pkgdir}"/etc/profile.d/gtk3-nocsd.sh
} 

package_lib32-gtk3-nocsd() {
	if (pacman -Q gcc-multilib >/dev/null); then
		provides=("${pkgname}" "${pkgname}-git=${pkgver}")
		conflicts=("${pkgname}" "${pkgname}-git<=${pkgver}")
		replaces=("${pkgname}" "${pkgname}-git<=${pkgver}")
### there is no way to force extra makedeps so we add this here
		depends=('gtk3-nocsd' 'gcc-multilib')
		arch=('x86_64')
		install -d "${pkgdir}"/usr/lib32/
		install -Dm644 "${srcdir}"/${pkgbase//-git/}/lib32/libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib32/libgtk3-nocsd.so.0
	fi
} 

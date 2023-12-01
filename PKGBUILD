_tag=2963dc4c0b77b20f422fbb67c7fae5138059f601
pkgname=compfy
pkgver=1.7.2
pkgrel=1
pkgdesc="A Linux Compositor for X11. Based on Picom. Providing Animations and More"
arch=(i686 x86_64)
url="https://github.com/allusive-dev/compfy"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre2' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'libglvnd' 'libx11' 'libxcb' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'uthash')
optdepends=('dbus:          To control Compfy via D-Bus')
source=("git+$url.git#tag=${_tag}")
md5sums=('SKIP')
pkgver() {
	cd $pkgname
        git describe --tags
}
build() {
	cd "${srcdir}/${pkgname}"
	meson setup --prefix=/usr -Dwith_docs=false . build
	ninja -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir/" ninja -C build install

	# install license
	install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

        # install manpage
        install -D -m644 "man/compfy.1" "${pkgdir}/usr/share/man/man1/compfy.1"

	# example conf
	install -D -m644 "compfy.sample.conf" "${pkgdir}/etc/xdg/compfy.conf.example"

}

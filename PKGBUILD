_tag=5774e9eb996d8692a98c8c377a717e9c7f4a341b
pkgname=compfy
pkgver=1.7.0
pkgrel=2
pkgdesc="A Linux Compositor for X11. Based on Picom. Providing Animations and More"
arch=(i686 x86_64)
url="https://github.com/allusive-dev/compfy"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre2' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'libglvnd' 'libx11' 'libxcb' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'uthash')
optdepends=('dbus:          To control Compfy via D-Bus')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
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


_gitfolder="picom"
pkgname=picom-allusive
pkgver=0.3.1
pkgrel=1
pkgdesc="Smooth animations picom fork, builds upon and cleans up picom-pijulius"
arch=(i686 x86_64)
url="https://github.com/allusive-dev/picom-allusive"
license=('MIT' 'MPL2')
depends=('libconfig' 'libev' 'libxdg-basedir' 'pcre' 'pixman' 'xcb-util-image' 'xcb-util-renderutil' 'libglvnd' 'libx11' 'libxcb' 'libdbus')
makedepends=('git' 'meson' 'ninja' 'gcc' 'uthash')
optdepends=('dbus:          To control picom via D-Bus'
            'xorg-xwininfo: For picom-trans'
            'xorg-xprop:    For picom-trans'
            'python:        For picom-convgen.py')
provides=('compton' 'compton-git' 'picom' 'picom-git')
conflicts=('compton' 'compton-git' 'picom' 'picom-git')
source=("${_gitfolder}::git+https://github.com/allusive-dev/picom-allusive.git")
md5sums=('SKIP')
build() {
	cd "${srcdir}/${_gitfolder}"
	meson setup --buildtype=release . build
	ninja -C build
}

package() {
	cd "${srcdir}/${_gitfolder}"
	DESTDIR="$pkgdir/" ninja -C build install

	# install license
	install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname/-git$/}/LICENSE-MIT"

	# install man page
	install -D -m644 "man/picom.1.gz" "${pkgdir}/usr/share/man/man1/picom.1.gz"

	# example conf
	install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"

}

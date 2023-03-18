# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributer: Davi da Silva Böger <dsboger@gmail.com>

pkgname='vte3-tilix'
pkgver=0.70.3
pkgrel=1
pkgdesc='Virtual Terminal Emulator widget (GTK3) (Fedora and Tilix patches)'
url='https://github.com/gnunn1/tilix/tree/master/experimental/vte'
arch=('x86_64')
license=('LGPL')
depends=('fribidi' 'gnutls' 'gtk3' 'pcre2' 'systemd-libs' 'vte-common')
makedepends=('gobject-introspection' 'gperf' 'meson' 'vala')
options=('!lto')
source=("https://gitlab.gnome.org/GNOME/vte/-/archive/$pkgver/vte-$pkgver.tar.bz2"
	'alternate-screen.patch'
)
sha256sums=('94d0b6776d55252bc1f15995c1ade7eb44b4a2c99531487eba9b8bded1a0fe2f'
            '36fdf6a98c2be1b0c5b38a6116f160cdf0f270db688796ff1199234d64e49600')

provides=("vte3=$pkgver" "vte3-notification=$pkgver" 'vte3-terminix-git' 'libvte-2.91.so')
conflicts=('vte3')

# Fedora patches: https://pkgs.fedoraproject.org/cgit/rpms/vte291.git/tree/
_frepourl='https://src.fedoraproject.org/rpms/vte291'
_fpatchfile='vte291-cntnr-precmd-preexec-scroll.patch'
_fcommit='de03576168f1ec4beeb7330239f4debf3234b842'

source+=("${_fpatchfile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile}")
sha256sums+=('e5672a857c51a620ca5448da29e4ea5b0e319c2a54416a4ca615b0e0392e00a9')

prepare() {
	cd "vte-$pkgver" || exit 1
	patch -p1 -i "$srcdir/${_fpatchfile}-${_fcommit}"
	patch -p1 -i "$srcdir/alternate-screen.patch"
}

build() {
	arch-meson "vte-$pkgver" build -D b_lto=false -D docs=false -D gtk4=false
	meson compile -C build
}

package_vte3-tilix(){
	meson install -C build --destdir "$pkgdir"

	# remove vte-common
	rm -r "$pkgdir"/etc
	rm -r "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
	rm -r "$pkgdir"/usr/share/locale/
}

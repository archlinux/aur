# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jose Valecillos <valecillosjg@gmail.com>

pkgname=dosbox-multilib-patched
pkgver=0.74.4006
pkgrel=1
pkgdesc="An emulator with builtin DOS for running DOS Games. 32-bit build with selected patches"
arch=(x86_64)
url=http://dosbox.sourceforge.net/
license=(GPL2)
depends=(lib32-alsa-lib hicolor-icon-theme lib32-libgl lib32-libpng lib32-mesa lib32-sdl_net lib32-sdl_sound lib32-munt-git)
makedepends=(subversion munt-git libgl)
provides=(dosbox)
conflicts=(dosbox)
source=("$pkgname::svn+https://dosbox.svn.sourceforge.net/svnroot/dosbox/dosbox/trunk#revision=4006"
	$pkgname.desktop
	dosbox-16.png 
	dosbox-48.png 
	dosbox-128.png
	patches.tar.xz)
#	dosbox_r3995_digi_pcspkr.diff
#	dosbox-SVN-r4000-mt32-patch.diff
#	gl.patch
#	voodoo_linux_r4006.diff)
install=$pkgname.install
prepare() {
	cd "$srcdir/$pkgname"
	mkdir "$srcdir/$pkgname/include/GL/"
	cp "/usr/include/GL/gl.h" "$srcdir/$pkgname/include/GL/gl.h"
	patch -p1 <"../patches/gl.patch"
	patch -p0 <"../patches/dosbox_r3995_digi_pcspkr.diff"
	patch -p1 <"../patches/dosbox-SVN-r4000-mt32-patch.diff"
	patch -p1 <"../patches/voodoo_linux_r4006.diff"
}
build() {
	cd $pkgname/
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	sh autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc/dosbox --host=i686-pc-linux-gnu
	make
}
package() {
	make -C $pkgname DESTDIR="$pkgdir" install

	# Fix invalid permissions FS#10732
	chmod 755 "$pkgdir"/usr/share/man/man1

	for i in 16 48 128; do
		install -Dm644 dosbox-$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/dosbox.png
	done
	desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}
sha256sums=('SKIP'
            '7c8db8a5a475f54283748b539b50fa49b59a87c5ff80e94e82520530b996f871'
            'e657254e56dd7d66cb1cefbf37f0f360e13a221bc60b1638c00dcda508f7fd56'
            'e71a3984170b3bf7af7d9cfbec0752187d70be76602721a1227b60980d7c380a'
            '228593e97732eaa31e0202b7d46da9d7529672369c17312db3f97784601b5d81'
            '44355ce5e19e1303bb4b38f28a34132be2d2746541d1cd0cac95ccf74107b8f6')

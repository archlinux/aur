# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jose Valecillos <valecillosjg@gmail.com>

pkgname=dosbox-multilib-patched
_rev=4204
pkgver=0.74.$_rev
pkgrel=1
pkgdesc="An emulator with builtin DOS for running DOS Games. 32-bit build with selected patches"
arch=(x86_64)
url=http://dosbox.sourceforge.net/
license=(GPL2)
depends=(lib32-alsa-lib hicolor-icon-theme lib32-libgl lib32-libpng lib32-mesa lib32-sdl_net lib32-sdl_sound lib32-munt-git)
makedepends=(subversion munt-git libgl)
provides=(dosbox)
conflicts=(dosbox)
source=("$pkgname::svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk#revision=$_rev"
	$pkgname.desktop
	dosbox-16.png
	dosbox-48.png
	dosbox-128.png
	patches.tar.xz)
options=(!strip)
prepare() {
	cd "$srcdir/$pkgname"
	echo "PCSPKR"
	patch -p0 <"../patches/dosbox_r3995_digi_pcspkr.diff"
	echo "MT32"
	patch -p1 <"../patches/dosbox-SVN-r4025-mt32-patch.diff"
	echo "NUKED"
	patch -p0 <"../patches/nukedopl_1_8.patch"
	echo "VOODOO"
	patch -p1 <"../patches/1_voodoo_gl.diff"
	#patch -p0 <"../patches/pixel-perfect-alpha14.patch"
	echo PIXEL PERFECT
	#patch -p0 <"../patches/pp14-4157.patch"
	patch -p0 <"../patches/pp23rc.diff"
}

build() {
	cd $pkgname/
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	sh autogen.sh
	./configure --prefix=/usr --enable-dynamic-x86 --sysconfdir=/etc/dosbox --host=i686-pc-linux-gnu
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
            'e6a1d587b7cf39272dd527fb06d06817b86b09a9f89165b5aef44798058267d2'
            'e657254e56dd7d66cb1cefbf37f0f360e13a221bc60b1638c00dcda508f7fd56'
            'e71a3984170b3bf7af7d9cfbec0752187d70be76602721a1227b60980d7c380a'
            '228593e97732eaa31e0202b7d46da9d7529672369c17312db3f97784601b5d81'
            'e0e2d6396bec2db97dabd104002dbd597c30b8f7fbc231046605170b7403a505')

# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=dockingstation
pkgver=195
pkgrel=1
pkgdesc="Artificial life game based on Creatures 3"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20100130202018/http://www.gamewaredevelopment.co.uk/ds/ds_index.php"
license=('custom')
depends_i686=('gtk' 'sdl' 'zlib')
depends_x86_64=('lib32-gtk' 'lib32-sdl' 'lib32-zlib')
options=('!strip')
source=("dockingstation_195_64.tar.bz2::http://creatures.treesprite.com/dockingstation_195_64.tar.bz2"
		"disablelogin.zip::http://mythwoods.treesprite.com/treesprite.com/mythwoods/download/file.php?id=1018"
		"SDL-1.2.9.tar.gz::https://www.libsdl.org/release/SDL-1.2.9.tar.gz")
md5sums=('90a7ab012bbd4530b63c1ed64fb94464'
         'b7329fc00444cd1c8d78e5440e287461'
         '80919ef556425ff82a8555ff40a579a0')
sha1sums=('ce488f713a65fe8745198a37d6be4711e492cc9b'
          '4957d39661c883d7a813ed06d818315beda47914'
          '8140de00e73ccdbdee196fa8fd9952ddb3cc75f1')
sha224sums=('eaaa71ccecdbef227c3370c3ee9f509eddeeabeba503075b301b7b57'
            'b9bb1c0f0b21e035cfedca9eeb8551d4aaef310988d58832b5f1a16a'
            '2c020aaef1ef80d1ddb4f348381e8c841447f3eb0b6f96f3b7a2a825')
sha256sums=('1647ca502b6b7944b84752b88ef0e039a8468725ffaed59fd97eb4eb70b03978'
            'eb1a7deeec5b6dd77b2025bb20f5dc110c67ef521c3f9b30e8c63e6f78bd89bf'
            'd5a168968051536641ab5a3ba5fc234383511c77a8bc5ceb8bed619bdd42e5f9')

prepare() {
	cd dockingstation_195_64
	
	# Remove installer relaunches (these require user input)
	sed -i -e '/NEW_SUM=/,/fi/d' \
		-e '/if \[ ! -z "\$CD_PATH"/,/fi/d' dstation-install

	# Disable updater (Servers are down - updating breaks the game)
	pushd ports/linux_x86_glibc21_64
	bunzip2 dstation-install.bz2
	sed -i '/[ -z "$NO_CHECK" ] && update/d' dstation-install
	# Repack and update filelist
	_new_size=$(stat -c "%s" dstation-install)
	_new_sum=$(md5sum -b dstation-install 2>&1 | cut "-d " -f1)
	bzip2 dstation-install
	bunzip2 file_list_linux_x86_glibc21.txt.bz2
	sed -i "s|.*dstation-install.*|$_new_size $(stat -c "%s" dstation-install.bz2) $_new_sum dstation-install|" file_list_linux_x86_glibc21.txt
	bzip2 file_list_linux_x86_glibc21.txt
	popd
	
	# Install offline mode patch
	# (Again, servers are down. Without this patch, you can't play.)
	pushd "dsbuild 195"/global
	pushd Bootstrap/"010 Docking Station"
	rm zzz_gamestart_login.cos.bz2
	cp "$srcdir"/zzz_gamestart_login.cos .
	bzip2 zzz_gamestart_login.cos
	popd
	pushd Images
	rm -f MNBdontlogin.c16.bz2
	cp "$srcdir"/MNBdontlogin.c16 .
	bzip2 MNBdontlogin.c16
	popd
	# Update filelist
	bunzip2 file_list.txt.bz2
	sed -i -e "s|.*zzz_gamestart_login.cos.*|$(stat -c "%s" "$srcdir"/zzz_gamestart_login.cos) $(stat -c "%s" Bootstrap/"010 Docking Station"/zzz_gamestart_login.cos.bz2) $(md5sum -b "$srcdir"/zzz_gamestart_login.cos | cut "-d " -f1) Bootstrap/010 Docking Station/zzz_gamestart_login.cos|" \
		-e "/Images\/Cursor.c16/a $(stat -c "%s" "$srcdir"/MNBdontlogin.c16) $(stat -c "%s" Images/MNBdontlogin.c16.bz2) $(md5sum -b "$srcdir"/MNBdontlogin.c16 | cut "-d " -f1) Images/MNBdontlogin.c16" file_list.txt
	bzip2 file_list.txt
	popd
	
	# Remove outdated Linux include from XF86DGA.c
	# (and use the fallback intended for other platforms)
	cd ../SDL-1.2.9
	sed -i "/asm\/page.h/d" src/video/XFree86/Xxf86dga/XF86DGA.c
}

build() {
	# Build SDL 1.2.9
	# (The included SDL doesn't play sound on modern systems.
	# SDL 1.2.10 and up are not compatible with the game.)
	cd SDL-1.2.9
	./configure --disable-video-fbcon CFLAGS="-m32"
	make
	
	# Install new SDL
	cd ../dockingstation_195_64/ports/linux_x86_glibc21_64
	rm libSDL-1.2.so.0.bz2
	cp "$srcdir"/SDL-1.2.9/src/.libs/libSDL-1.2.so.0.7.2 libSDL-1.2.so.0
	bzip2 libSDL-1.2.so.0
	# Update filelist
	bunzip2 file_list_linux_x86_glibc21.txt.bz2
	sed -i "s|.*libSDL-1.2.so.0.*|$(stat -c "%s" "$srcdir"/SDL-1.2.9/src/.libs/libSDL-1.2.so.0.7.2) $(stat -c "%s" libSDL-1.2.so.0.bz2) $(md5sum -b "$srcdir"/SDL-1.2.9/src/.libs/libSDL-1.2.so.0.7.2 | cut "-d " -f1) libSDL-1.2.so.0|" file_list_linux_x86_glibc21.txt
	bzip2 file_list_linux_x86_glibc21.txt
}

package() {
	cd dockingstation_195_64
	mkdir -pv "$pkgdir"/{usr/{bin,share/licenses/dockingstation},opt/dockingstation}
	INSTALL_DEST="$pkgdir/opt/dockingstation" BIN_DEST="$pkgdir/usr/bin" ./dstation-install nolaunch
	# Correct symlink
	pushd "$pkgdir"/usr/bin
	rm -f dockingstation
	ln -s /opt/dockingstation/dstation-install dockingstation
	popd
	# Extract & install license
	grep -A34 "End-User Software License Agreement" dstation-install > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

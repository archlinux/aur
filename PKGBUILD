# Maintainer: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wine-stable-ubuntu
pkgver=6.0
pkgrel=3
pkgdesc="A compatibility layer for running Windows programs (binary for Ubuntu)"
arch=('x86_64')
url="https://winehq.org/"
license=('GPL')
conflicts=('wine')
provides=("wine=${pkgver}" "wine-wow64=${pkgver}")
install=wine.install
depends=('glibc' 'fontconfig' 'lib32-fontconfig' 'lcms2' 'lib32-lcms2' 'libxml2' 'lib32-libxml2' 'libxcursor' 'lib32-libxcursor' 'libxrandr' 'lib32-libxrandr' 'libxdamage' 'lib32-libxdamage' 'libxi' 'lib32-libxi' 'gettext' 'lib32-gettext' 'freetype2' 'lib32-freetype2' 'glu' 'lib32-glu' 'libsm' 'lib32-libsm' 'gcc-libs' 'lib32-gcc-libs' 'libpcap' 'lib32-libpcap' 'faudio' 'lib32-faudio' 'desktop-file-utils')
optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vkd3d                 lib32-vkd3d
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  cups
  samba           dosbox
)
options=('!emptydirs' '!strip')
_pkgver="${pkgver}.0"
_channel="focal"
source=("wine.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-amd64/wine-stable-amd64_${_pkgver}~${_channel}-1_amd64.deb"
	"wine2.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-amd64/wine-stable_${_pkgver}~${_channel}-1_amd64.deb"
	"winei386.deb::https://dl.winehq.org/wine-builds/ubuntu/dists/focal/main/binary-i386/wine-stable-i386_${_pkgver}~${_channel}-1_i386.deb"
	"30-win32-aliases.conf"
        "wine-binfmt.conf")
sha512sums=("224299cf2ae87f6cf0757cab8fec4c0af92fe3207ab87650709ba604132a2771d1877ba5b5cdab40c388ebf1c54d0bc8852126af7e73b4e3f16733a1b12d365b"
            "487737d24e534ea3483b80b498da295c62cad009369ffff3b0de0377bc4f7c21884886457fa7760c7188f88ec6d67075332e33fd071774bde498a3ab3c4c200a"
            "8b50cea9243f0a8801a4092697806a346a2ce6d65b4757c6a894ea4c865a7e554f06fff66714e966e26c8cdf31780726ce8f2ee6c71fa663419d132b2cad2b48"
            "6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb"
            "bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285")

prepare() {
	mkdir "$srcdir"/wine{,2,i386} || :
}

package() {
	msg2 "Extracting the data.tar.xz..."
	for _num in "" 2 i386; do
		bsdtar -xf "$srcdir"/wine${_num}.deb -C "$srcdir"/wine${_num}
		bsdtar -xf "$srcdir"/wine${_num}/data.tar.xz -C "$pkgdir/"
	done
	mv "$pkgdir"/opt/wine-stable "$pkgdir"/opt/wine-stable-ubuntu
	msg2 "Making symlinks..."
	mkdir -p "$pkgdir"/usr/bin
	for _ln in 'function_grep.pl' msidb msiexec notepad regedit regsvr32 widl wine wine-preloader wine64 wine64-preloader wineboot winebuild winecfg wineconsole winecpp winedbg winedump winefile wineg++ winegcc winemaker winemine winepath wineserver wmc wrc; do
		ln -s /opt/wine-stable-ubuntu/bin/"$_ln" "$pkgdir"/usr/bin/"$_ln"
	done
	msg2 "Doing things that related to Arch..."
	install -d "$pkgdir"/etc/fonts/conf.{avail,d}
	install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
	ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
	install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf	"
	install -Dm 644 "$pkgdir"/opt/wine-stable-ubuntu/share/applications/wine.desktop "$pkgdir"/usr/share/applications/wine.desktop
	install -Ddm 755 "$pkgdir"/usr/share/man
	for _man in de.UTF-8 fr.UTF-8 man1 pl.UTF-8; do
		if [ "$_man" == "man1" ]; then
			install -Ddm 755 "$pkgdir"/usr/share/man/"$_man"
			cp -ax "$pkgdir"/opt/wine-stable-ubuntu/share/man/"$_man"/* "$pkgdir"/usr/share/man/"$_man"; continue
		fi
		install -Ddm 755 "$pkgdir"/usr/share/man/"$_man"/man1
		cp -ax "$pkgdir"/opt/wine-stable-ubuntu/share/man/"$_man"/man1/* "$pkgdir"/usr/share/man/"$_man"/man1/
	done
	ln -s "$pkgdir"/opt/wine-stable-ubuntu/share/wine "$pkgdir"/usr/share/wine
	rm -rf "$pkgdir"/opt/wine-stable-ubuntu/share/{man,applications}
	rm -rf "$pkgdir"/usr/share/lintian
}

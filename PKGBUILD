# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Benjamin Hodgetts <ben@xnode.org>

pkgname=vice-svn
pkgver=r43299
pkgrel=1
pkgdesc="The Versatile Commodore Emulator 8-bits (PET/C64/C128/Plus4/Vic20) - Development version"
arch=('i686' 'x86_64')
url="http://vice-emu.sourceforge.net"
license=('GPL')
depends=(glew gtk3 portaudio pciutils ffmpeg4.4)
makedepends=(dos2unix libpcap libxaw texlive-bin texlive-core xa xorg-bdftopcf xorg-mkfontdir python svn)
provides=('vice')
replaces=('vice')
conflicts=('vice' 'vice-sdl2' 'vice-svn-gtk3' 'vice-svn-sdl2')
source=("${pkgname}::svn://svn.code.sf.net/p/vice-emu/code/trunk"
vice-org-vsid.desktop
vice-org-x64dtv.desktop
vice-org-x64sc.desktop
vice-org-x128.desktop
vice-org-xcbm2.desktop
vice-org-xcbm5x0.desktop
vice-org-xpet.desktop
vice-org-xplus4.desktop
vice-org-xscpu64.desktop
vice-org-xvic.desktop
C64_1024.svg
C128_1024.svg
CBM2_1024.svg
CBM_Logo.svg
DTV_1024.svg
PET_1024.svg
Plus4_1024.svg
SCPU_1024.svg
SID_1024.svg
VIC20_1024.svg
)
sha256sums=('SKIP'
            'c07cfcc5f710b96258ce194dfeef60ca15b8cdde84c7bbc529b1417f50c82fd1'
            'c6362e948eb29aa392a0b0e43657e2d1a7440209919f4d724e60578b2e50195b'
            'dd58d7ab618a7d70ac336b8c44f38438305ba9b94a54635b393c7c281e91824d'
            '2bee5fd315e9d95ff19a5c84df544e4e200f1f41e526b67bb19079a456cacde2'
            '7b64750a8a22a462b38ed8e6d75dd05d85e2b55c744e3de6bfca0cea4ff98677'
            'a4e82046aaca9f539f16a4f6c21198e4b64f9beac0e3b04bac877907494792ff'
            '04ae1173821d948dff92bcd9e73db69f077cc738c33bf2e32eb0911ecd8a3156'
            '63052bc74fced179de077435100e614a72c24b0fcbbceba16fdabc7f2a8174cc'
            'a31f99bd268f40e06c6a7bb1028a1b0f5dac4296b8b5a243bf64961228c7ce97'
            'b6548109bd5b557f8b0598541dac21a408f28631cd8ac814099d97160821ef3b'
            '2f6b915b16d955ebf4af7458075ad55399e5fc134c5b228abc93542410764084'
            'cec437f3def18b45a4a3fceb6c8c6e8d8f3ff148f39bf33068f68e56c4a2412a'
            '09da7fee74f13667a4a1d869f1c1c4fe5fd0ace8b092c5ae846c3e4c3a09d584'
            '71f0acf2d762869a33b121141e1c3f63b53a474fcb2f3a6a64417ad4d7e7d90d'
            '5e0af7deadbdad829f8efc762236695530805d93d85e8f379b5c5f99de8a5412'
            'b6fecc7c862c5c7370f9eda716f029255d9bb29c6c507080b53589d3ab896db2'
            'db2a72d6185b7eddc476639a24b81ec9bd193b83ace44d26bfad8111239451a8'
            'ce2710836a0622295d033c6b21d8d1b896cc3138d774234336f07bfc292ee317'
            'c443e2f8617b6404cd5a26678a5c018c8b12a0c1024275aebfe2e2addab17368'
            'bee44a1fe16fb92550c5960b9c568982624a6c3d18bdb44f82efd34ea0a0c66c')

pkgver() {
	echo r$(svnversion "${SRCDEST}"/${pkgname}/)
}

build() {
	cd "${pkgname}/vice"
	./autogen.sh 
    	# Forcing use of ffmpeg 4.4.
    	PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./configure --prefix=/usr --libdir=/usr/lib --enable-ffmpeg --enable-gtk3ui
	make
}

package() {
	cd "${pkgname}/vice"
	make install DESTDIR="${pkgdir}/"
	# Working around --enable-desktop-files bug
	# See https://sourceforge.net/p/vice-emu/bugs/1379/
	mkdir $pkgdir/usr/share/applications/
	cp $srcdir/*.desktop $pkgdir/usr/share/applications/
	cp $srcdir/*.svg $pkgdir/usr/share/vice/common/
}

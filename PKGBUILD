# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=k9copy
pkgver=3.0.3
pkgrel=4
pkgdesc="A small utility to copy DVD"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/k9copy-reloaded/"              
license=('GPL')
depends=('kdesu' 'hicolor-icon-theme' 'kio' 'libmpeg2' 'xine-lib' 'dvd+rw-tools'
         'dvdauthor' 'libdvdnav' 'kdelibs4support' 'phonon-qt5' 'ffmpeg4.4')
optdepends=('libdvdcss: for decoding encrypted DVDs')
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'appstream')
provides=('k9copy-reloaded')
conflicts=('k9copy-frameworks' 'k9copy-kde4')
source=("http://sourceforge.net/projects/k9copy-reloaded/files/$pkgname-$pkgver.tar.gz"
        'k9copy-ffmpeg3andgcc6.patch'
        'k9copy-FindAv.patch'
        'k9copy-mimetype.patch'
        'k9copy-qt5.patch'
        'k9copy-tempdir.patch'
        'unbundled_dvdread_dvdnav.patch'
        'set_cancel_button_fix.patch'
        'k9copy-install-xmluifile-fix.patch'
        'use-findffmpeg.patch')

sha256sums=('4f1f8bc1ed22464a72382924aa23420c0bb94c2360af750a03454f187936e036'
            'e6ea13c74b39e160d5eee7c106b2122f4a289aae37981ee176bc74ed8c959812'
            '61900fabe8534c506432ffc51a4e0bb49f231bdc04e2182b79383067404db703'
            '82c21ec5a2f0715803e72f8a35271fc3bc8d26a7b6e4ae8f8b24a8d0bf4faac0'
            'e16536294c41446dc141572f52cc5efd67fcb4fb99e082804786c64fe2fa4729'
            '4eaabf10b3bfd3cce0b1ac176a2e4e038f03d0ca4d0f96b67897c20cdfc756f9'
            '6c3c72b03a4d4ff1c961416ad8030977e6f41d2d3304f8be181866ee546b5439'
            'f03945f611650f2cfb76e479ce49aeb0b1815634025e35585d805f0ae5dcbdb5'
            '624041e871bcc57b000be0eb4dbea6dc176bb05650ebb7f7f7e318ac6e312e36'
            '747040d49cec47367e1f7d888144d6ca661b623426dd8233226f4dd663e40817')

prepare() {
	# Apply Fedora patches (https://github.com/rpmfusion/k9copy)
    cd "$srcdir/$pkgname"

	msg "Applying patch k9copy-ffmpeg3andgcc6.patch"
	patch -Np1 -i ../k9copy-ffmpeg3andgcc6.patch

	msg "Applying patch k9copy-FindAv.patch"
	patch -Np1 -i ../k9copy-FindAv.patch

	msg "Applying patch k9copy-mimetype.patch"
	patch -Np1 -i ../k9copy-mimetype.patch

	msg "Applying patch k9copy-qt5.patch"
	patch -Np1 -i ../k9copy-qt5.patch

	#msg "Applying patch k9copy-tempdir.patch"
	#patch -Np0 -i ../k9copy-tempdir.patch

	msg "Applying patch unbundled_dvdread_dvdnav.patch"
	patch -Np1 -i ../unbundled_dvdread_dvdnav.patch

	msg "Applying patch unbundled_dvdread_dvdnav.patch"
	patch -uNp2 -r- -i ../set_cancel_button_fix.patch
	
	msg "Applying patch k9copy-install-xmluifile-fix.patch"
	patch -uNp2 -r- -i ../k9copy-install-xmluifile-fix.patch

	msg "Applying patch use-findffmpeg.patch"
	patch -uNp2 -r- -i ../use-findffmpeg.patch
}

build(){
    cd "$srcdir/$pkgname"

    # Fix desktop files
    sed -e 's|Name=k9copy|Name=K9copy|g' \
        -e '/xdg-open/d' -e '/Encoding/d' -e '/MimeTypes/d' \
        -i k9copy{,_assistant}.desktop

    export PKG_CONFIG_LIBDIR=/usr/lib/ffmpeg4.4/pkgconfig
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT5_BUILD=ON
    make
}

package(){
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}

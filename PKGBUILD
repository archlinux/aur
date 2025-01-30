# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=p7zip-gui
pkgver=16.02
pkgrel=11
pkgdesc='Graphic user interface (alpha quality) for the p7zip file archiver'
url='http://p7zip.sourceforge.net'
license=('custom:unRAR' ' LGPL-2.1-or-later')
arch=('i686' 'x86_64')
depends=('wxwidgets-gtk3')
optdepends=('desktop-file-utils: desktop entries'
            'kservice: entries in kde context menu')
makedepends=('python')
makedepends_i686=('nasm')
makedepends_x86_64=('yasm')
install='p7zip-gui.install'
source=("https://downloads.sourceforge.net/project/p7zip/p7zip/${pkgver}/p7zip_${pkgver}_src_all.tar.bz2"
        "${pkgname}-Fix-g++-warning.patch::https://src.fedoraproject.org/rpms/p7zip/raw/rawhide/f/14-Fix-g++-warning.patch"
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/a82b67f5d36f374afd154e7648bb13ec38a3c497/trunk/CVE-2016-9296.patch'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/a82b67f5d36f374afd154e7648bb13ec38a3c497/trunk/CVE-2017-17969.patch'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/a82b67f5d36f374afd154e7648bb13ec38a3c497/trunk/CVE-2018-5996.patch'
        'https://raw.githubusercontent.com/archlinux/svntogit-packages/a82b67f5d36f374afd154e7648bb13ec38a3c497/trunk/CVE-2018-10115.patch'
        "${pkgname}-gcc10-conversion.patch::https://src.fedoraproject.org/rpms/p7zip/raw/rawhide/f/gcc10-conversion.patch"
        "${pkgname}-Implement-exit-P7ZIP-Desktop-from-file-menu.patch"
        '7zFM.desktop')
sha256sums=('5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f'
            'a923c8876f36201064b0efabbc2121e47cf7a78a0700d3974ef24ab3a05bd88a'
            'f9bcbf21d4aa8938861a6cba992df13dec19538286e9ed747ccec6d9a4e8f983'
            'c6af5ba588b8932a5e99f3741fcf1011b7c94b533de903176c7d1d4c02a9ebef'
            '9c92b9060fb0ecc3e754e6440d7773d04bc324d0f998ebcebc263264e5a520df'
            'c397eb6ad60bfab8d388ea9b39c0c13ae818f86746210c6435e35b35c786607f'
            'f90013d66d3c9865cb56fed2fb0432057a07283d5361e2ae9e98c3d3657f42a1'
            '3dd3f25e4eb9e53b172309df6a27d4393ad031e978ac3fdf650b86048aeaa76f'
            'ae1f3c95ec40e82f7b74bd039bd9cbfa69136682e161b91a4534b7d9cdedcbd4')

prepare() {
	cd ${srcdir}/p7zip_${pkgver}
	patch -p1 -i ${srcdir}/${pkgname}-Fix-g++-warning.patch
	patch -p1 -i ${srcdir}/CVE-2016-9296.patch
	patch -p1 -i ${srcdir}/CVE-2017-17969.patch
	patch -p1 -i ${srcdir}/CVE-2018-5996.patch
	patch -p1 -i ${srcdir}/CVE-2018-10115.patch
	patch -p1 -i ${srcdir}/${pkgname}-gcc10-conversion.patch
	patch -p1 -i ${srcdir}/${pkgname}-Implement-exit-P7ZIP-Desktop-from-file-menu.patch

	if [ ${CARCH} = x86_64 ]; then
		cp makefile.linux_amd64_asm makefile.machine
	else
		cp makefile.linux_x86_asm_gcc_4.X makefile.machine
	fi
	sed -i 's/x86_64-linux-gnu//g' CPP/7zip/*/*/*.depend
	rm GUI/kde4/p7zip_compress.desktop # FS#43766
	cd Utils
	sed -i 's/_do_not_use//g' generate.py
	./generate.py
}

build() {
	cd ${srcdir}/p7zip_${pkgver}
	make all5 OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd ${srcdir}/p7zip_${pkgver}
	make install \
		DEST_DIR="${pkgdir}" \
		DEST_HOME="/usr" \
		DEST_MAN="/usr/share/man"

	install -D -m 644 GUI/p7zip_32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/p7zip.png
	install -D -m 644 -t ${pkgdir}/usr/share/kservices5/ServiceMenus GUI/kde4/*.desktop
	install -D -m 644 -t ${pkgdir}/usr/share/kio/servicemenus GUI/kde4/*.desktop
	install -D -m 644 -t ${pkgdir}/usr/share/applications ${srcdir}/7zFM.desktop
	ln -s 7zCon.sfx ${pkgdir}/usr/lib/p7zip/7z.sfx
	ln -s /usr/share/doc/p7zip/DOC/MANUAL ${pkgdir}/usr/lib/p7zip/help
	chmod +x ${pkgdir}/usr/bin/p7zipForFilemanager

	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	ln -s -t ${pkgdir}/usr/share/licenses/${pkgname}/ \
		/usr/share/doc/p7zip/DOC/License.txt \
		/usr/share/doc/p7zip/DOC/unRarLicense.txt

	# remove conflicts with 7zip package and man pages
	rm \
		${pkgdir}/usr/bin/7z \
		${pkgdir}/usr/bin/7za \
		${pkgdir}/usr/bin/7zr
	rm -R ${pkgdir}/usr/share/man
}

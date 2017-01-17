# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

pkgname=pacmanager-git
_pkgname=${pkgname%-git}
pkgver=4.5.5.8
pkgrel=7
arch=('any')
license=('GPL3')
pkgdesc="Perl Auto Connector PAC Manager. GIT version with fixed FreeRDP interface."
url="https://github.com/perseo22/pacmanager"
depends=('gconf-perl' 'glade-perl' 'openssh' 'perl-crypt-blowfish' 'perl-gnome2-vte' 'perl-expect' 'perl-crypt-rijndael' 'perl-gtk2-ex-simple-list' 'perl-io-stty' 'perl-io-tty' 'perl-net-arp' 'perl-yaml' 'perl-crypt-cbc' 'perl-gtk2-unique' 'perl-socket6' 'uuid')
makedepends=('git')
conflicts=(pacmanager-bin)
source=("git+https://github.com/perseo22/pacmanager.git"
       "0001-xfreerdp-new-interface.patch"
       "0002-xfreerdp-new-interface.patch"
       "0003-xfreerdp-new-interface.patch"
       "0004-xfreerdp-new-interface.patch"
       "bugfix_ctrl-tab_in_last-focused_mode.patch"
       "fix_xfreerdp_embed_window.patch")
sha256sums=('SKIP'
            '98ab734e299083913b7d9f23dff047c3cc18bfc704e851b501930229c31f4d0a'
            'e2a169dd9267cde0eb426c3de470a584aeb5d96d5dc1ee038532b9e03abedb73'
            'dda5927251b70cc70e4a0590136b1b38aa5e85d490f7babf6fdf06391518892d'
            'd65a594621469929f5f9f121074e37e048003b91119bda10d56909fa73b5c735'
            '1396ce5405269093053c21d5673dee61ab1f9a313000490a2c413a561040c151'
            '678379ca96a59434ec623ecff8765969fcda5d41bc540ff5a587471c3e217b0e')

prepare() {
	cd ${srcdir}/${_pkgname}

	# Apply patches for new FreeRDP interface (thanks to hador / https://github.com/hador/pacmanager )
	patch -Np1 -i $srcdir/0001-xfreerdp-new-interface.patch
	patch -Np1 -i $srcdir/0002-xfreerdp-new-interface.patch
	# The third patch is done by me
	patch -Np1 -i $srcdir/0003-xfreerdp-new-interface.patch
        # A small bugfix from hador: https://github.com/hador/pacmanager/commit/794889803f749a94bb885b59c62826628ec577e9
        patch -Np1 -i $srcdir/0004-xfreerdp-new-interface.patch

	# Patch to fix ctrl-tab in last-focused mode (thanks to merikz / https://github.com/merikz/pacmanager/commit/ec861a8ba1f35070ea70496dd9d18976cfa6cca3 )
	patch -Np1 -i $srcdir/bugfix_ctrl-tab_in_last-focused_mode.patch

	# Ugly fix to fix xfreerdp embed window
	patch -Np1 -i $srcdir/fix_xfreerdp_embed_window.patch
}

build() {
	cd ${srcdir}/${_pkgname}
	# To ensure Vte is not a problem, we will compile it!
	# Reference: https://sourceforge.net/p/pacmanager/bugs/233/
	wget http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gnome2-Vte-0.11.tar.gz
	tar xfz Gnome2-Vte-0.11.tar.gz
	cd Gnome2-Vte-0.11
	perl Makefile.PL
	make
}

package() {
	cd ${srcdir}/${_pkgname}
	mkdir -p $pkgdir/{opt/pac,usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/pac/
	cp -p res/pac_bash_completion $pkgdir/etc/bash_completion.d
	cp res/pac64x64.png $pkgdir/usr/share/pixmaps/pac.png
	ln -sf /opt/pac/pac $pkgdir/usr/bin/pac
	cp res/pac.desktop $pkgdir/usr/share/applications/
	gzip -c res/pac.1 > $pkgdir/usr/share/man/man1/pac.1.gz
	cp -p pac $pkgdir/opt/pac/pac
	chmod 755 $pkgdir/opt/pac/pac
	# Copy patched Vte.so
	cp -p Gnome2-Vte-0.11/blib/arch/auto/Gnome2/Vte/Vte.so $pkgdir/opt/pac/lib/ex/vte64/auto/Gnome2/Vte/
}



# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xdg-utils-patched
_origpkgname=xdg-utils
pkgver=1.1.1
pkgrel=1
pkgdesc="Patched xdg-utils with xdg-open magnet fix"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
conflicts=('xdg-utils')
provides=('xdg-utils')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'perl-net-dbus: Perl extension to dbus used in xdg-screensaver'
            'perl-x11-protocol: Perl X11 protocol used in xdg-screensaver')
source=(http://portland.freedesktop.org/download/$_origpkgname-$pkgver.tar.gz{,.asc}
        "git+https://github.com/ziggi/xdg-utils-patched.git")
sha512sums=('6641b17daea7eecfee0d395e621dc42481582e505bff90a6df5eb0299ed2dca7a76520f000d9545a8424f06d41590382156a2e50f3d68d5c1ab825c268e90edb'
            'SKIP'
            'SKIP')
validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"

prepare() {
	cd $_origpkgname-$pkgver
	patch -Np1 -i ../xdg-utils-patched/*.patch
	patch -Np1 -i ../xdg-utils-patched/*.diff
}

build() {
	cd $_origpkgname-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $_origpkgname-$pkgver
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_origpkgname}/LICENSE"

	# install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
	install -dm755 $pkgdir/usr/share/desktop-directories
}

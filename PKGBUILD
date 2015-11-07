# Maintainer: Sergey Marochkin <me@ziggi.org>
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
optdepends=('kdebase-runtime: for KDE4 support in xdg-open'
            'kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
source=("http://portland.freedesktop.org/download/$_origpkgname-$pkgver.tar.gz"
        "generic_x_scheme.patch")
sha512sums=('6641b17daea7eecfee0d395e621dc42481582e505bff90a6df5eb0299ed2dca7a76520f000d9545a8424f06d41590382156a2e50f3d68d5c1ab825c268e90edb'
            '5ceda4071973d30c5bfdab4e5682b2e0584c8399ed50a877aa7f9e64606115a890b8d8ff6215ebe4d8f9d554a20515a929ecda897595265c1cd88350fa929bf7')

prepare() {
	cd $_origpkgname-$pkgver
	patch -p1 -i ../generic_x_scheme.patch
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

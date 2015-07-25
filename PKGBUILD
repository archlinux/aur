# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: matthewbauer <mjbauer95+aur@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

pkgname=xdg-utils-mimeo
pkgver=1.1.0.git20150715
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to use mimeo"
arch=('any')
url="http://cgit.freedesktop.org/xdg/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kdebase-runtime: for KDE4 support in xdg-open'
            'kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'mimeo: for mimeo support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=(git://anongit.freedesktop.org/xdg/xdg-utils#commit=3c499bd6d88c9d2b4f824f1e2f9c9158a5b95aa6
	mimeo-detection.diff)
md5sums=('SKIP'
         '8693c0986515de30872f0ff054539eaf')


pkgver() {
	cd xdg-utils
	echo "1.1.0.git$(git log -1 --format="%cd" --date=short | sed 's|-||g')"
}

prepare() {
	cd xdg-utils
	patch -p1 -i "${srcdir}"/mimeo-detection.diff
}

build() {
	cd xdg-utils
	./configure --prefix=/usr --mandir=/usr/share/man
#	make scripts-clean -C scripts # needed if it's a git snapshot
#	make man scripts -C scripts # needed if it's a git snapshot
	make # for release builds
}

package() {
	cd xdg-utils
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
	install -dm755 $pkgdir/usr/share/desktop-directories
}

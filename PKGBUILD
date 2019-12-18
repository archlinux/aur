# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Vincent Grande <shoober420@gmail.com>

pkgname=fontconfig-git
pkgver=2.13.91+18+g01e4f08
pkgrel=1
pkgdesc="A library for configuring and customizing font access (from git)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=('custom')
depends=('expat' 'freetype2')
makedepends=('git' 'autoconf-archive' 'gperf' 'python-lxml' 'python-six' 'json-c')
conflicts=('fontconfig')
provides=('fontconfig')
install=fontconfig-git.install
source=("git+https://anongit.freedesktop.org/git/fontconfig"
         fontconfig-git.hook)
sha256sums=('SKIP'
            '672f6a1c5e164671955ce807e670306194142a1794ce88df653aa717a972e274')

pkgver() {
	cd fontconfig
	git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd fontconfig
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd fontconfig
	./configure --prefix=/usr \
	  --sysconfdir=/etc \
	  --with-templatedir=/etc/fonts/conf.avail \
	  --with-xmldir=/etc/fonts \
	  --localstatedir=/var \
	  --disable-static \
	  --disable-docs \
	  --with-default-fonts=/usr/share/fonts \
	  --with-add-fonts=/usr/local/share/fonts
	make
}

#check() {
#	cd fontconfig
#	make -k check
#}

_install_conf() {
	install -m644 "$1" "$pkgdir/etc/fonts/conf.avail"
	ln -s "../conf.avail/${1##*/}" "$pkgdir/etc/fonts/conf.d"
}

package() {
	cd fontconfig
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/fontconfig/COPYING"
	install -Dm644 ../fontconfig-git.hook "$pkgdir/usr/share/libalpm/hooks/fontconfig-git.hook"
}

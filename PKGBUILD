# Maintainer:  Amanoel Dawod <amoka at amanoel dot com>
# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig-git
pkgver=2.13.91+63+g9133e79
pkgrel=1
pkgdesc="Library for configuring and customizing font access (from git)"
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
arch=('x86_64')
license=('custom')
depends=('expat' 'libfreetype.so')
makedepends=('git' 'autoconf-archive' 'gperf' 'python-lxml' 'python-six' 'json-c' 'expat' 'freetype2')
provides=('fontconfig' 'libfontconfig.so')
conflicts=('fontconfig')
install=fontconfig-git.install
backup=(etc/fonts/fonts.conf)
source=("git+https://anongit.freedesktop.org/git/fontconfig"
         fontconfig-git.hook)
sha256sums=('SKIP'
            '8883f7e6e9d574ed52b89256507a6224507925715ddc85b3dfab9683df2f1e25')

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
	  --localstatedir=/var \
	  --disable-static \
	  --disable-docs \
	  --with-default-fonts=/usr/share/fonts \
	  --with-add-fonts=/usr/local/share/fonts
	make
}

package() {
	cd fontconfig
	make DESTDIR="$pkgdir" install

	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../*.hook
	install -Dt "$pkgdir/usr/share/licenses/fontconfig" -m644 COPYING
}

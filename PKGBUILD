# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig-git
pkgver=2.11.94.r1772
pkgrel=1
pkgdesc="A library for configuring and customizing font access"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fontconfig/"
license=(custom)
depends=(expat freetype2)
makedepends=(git autoconf-archive gperf python-lxml python-six docbook-utils docbook-sgml
             perl-sgmls texlive-formatsextra json-c)
conflicts=(fontconfig)
provides=(fontconfig)
install=fontconfig-git.install
source=("git+https://anongit.freedesktop.org/git/fontconfig"
         fontconfig-git.hook)
sha256sums=(SKIP)

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
	  --with-default-fonts=/usr/share/fonts \
	  --with-add-fonts=/usr/local/share/fonts
  make
}

check() {
	cd fontconfig
	make -k check
}

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

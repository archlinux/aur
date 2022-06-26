# Maintainer: Thomas Faughnan <tom@tjf.sh>

pkgname=cgit-pink
pkgver=1.4.1
pkgrel=1
pkgdesc='Updated fork of cgit, a web frontend for git'
arch=('x86_64')
url='https://git.causal.agency/cgit-pink/'
license=('GPL2')
depends=('openssl')
makedepends=('zlib' 'curl' 'asciidoc')
optdepends=('groff: about page using man page syntax'
	'python-pygments: syntax highlighting support'
	'python-docutils: about page formatted with reStructuredText'
	'python-markdown: about page formatted with markdown'
	'gzip: gzip compressed snapshots'
	'bzip2: bzip2 compressed snapshots'
	'lzip: lzip compressed snapshots'
	'xz: xz compressed snapshots'
	'zstd: zstd compressed snapshots'
	'mime-types: serve file with correct content-type header')
conflicts=('cgit')
provides=('cgit')
install=cgit.install
source=("https://git.causal.agency/$pkgname/snapshot/$pkgname-$pkgver.tar.gz"
	'tmpfiles.conf'
	'apache.example.conf')
sha256sums=('f1246c6c81305800c24e7eee2b224319ab5e57b1ddb07b4883aea845f29046d5'
            '4004b72d433e5810b046fc6019171a11a0dae3e9c6b29a44f16ed41705c46c3d'
            '89927d462c0504863c163eb8a210e5d65db30ee6e4300ff6a2f92460e4f20a62')

prepare() {
	cd "$pkgname-$pkgver"
	make get-git
}

build() {
	cd "$pkgname-$pkgver"
	make
	make doc-man
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make CGIT_SCRIPT_PATH=/usr/share/webapps/cgit DESTDIR="$pkgdir" prefix=/usr install install-man

	install -vDm0644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/cgit.conf"
	install -vDm0644 "$srcdir/apache.example.conf" "$pkgdir/etc/webapps/cgit/apache.example.conf"
	mkdir -p "$pkgdir/usr/lib/cgit"
	mv "$pkgdir/usr/share/webapps/cgit/cgit.cgi" "$pkgdir/usr/lib/cgit"
	ln -sf ../../../lib/cgit/cgit.cgi "$pkgdir/usr/share/webapps/cgit/cgit.cgi"
}

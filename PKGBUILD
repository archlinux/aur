# Maintainer: lucy <lucy@luz.lu>

pkgname=tewisay-git
_gitname='tewisay'
_gourl='github.com/neeee/tewisay'
pkgver=0.59.cd6e1b9
pkgrel=3
pkgdesc='Cowsay replacement with unicode and partial ansi escape support.'
url='https://github.com/lucy/tewisay'
license=('custom:CC0')
depends=('glibc')
optdepends=('cowsay: default cowfiles')
makedepends=('go' 'git' 'asciidoc')
arch=('i686' 'x86_64' 'ARM')
options=('!strip')
source=('git://github.com/lucy/tewisay.git'
        'git://github.com/lucy/pflag.git'
        'git://github.com/lucy/rwidth.git')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "0.$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
	cd "$srcdir/$_gitname"
	git config submodule.pflag.url "$srcdir/pflag"
	git config submodule.rwidth.url "$srcdir/rwidth"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/$_gitname"
	go build
	a2x --doctype manpage --format manpage tewisay.1.txt
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm755 -T tewisay "$pkgdir/usr/bin/tewisay"
	install -Dm644 -T _tewisay "$pkgdir/usr/share/zsh/site-functions/_tewisay"
	install -Dm644 -T tewisay.1 "$pkgdir/usr/share/man/man1/tewisay.1"
	install -Dm644 -T COPYING  "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 -T cows/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.tewis"
	install -Dm755 -d "$pkgdir/usr/share/cows"
	install -Dm644 -t "$pkgdir/usr/share/cows" cows/*.cow 
	ln -s "tewisay" "$pkgdir/usr/bin/tewithink"
}

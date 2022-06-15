# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Buck Yeh <buck.yeh at gmail dot com>
pkgname=parsergen
pkgver=1.7.3
pkgrel=1
epoch=
pkgdesc='Self-hosted LR parser generator in C++20'
arch=('x86_64')
url='https://github.com/buck-yeh/parsergen.git'
license=('MIT')
groups=()
depends=('fmt')
makedepends=('cmake' 'make' 'gcc' 'git' 'binutils' 'fakeroot' 'gawk')
checkdepends=()
optdepends=('bux>=1.6.5: To build the generated code with')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=() #"$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	rm -Rf "$pkgname"
	mkdir -p "$pkgname"
	cd "$pkgname" || return 1
	if [[ "$pkgver" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		git clone -b "$pkgver" --single-branch $url .
	else
		git clone -b main --single-branch $url .
	fi
}

if [[ ( "$pkgver" != "main" ) && ( ! "$pkgver" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ) ]]; then
	pkgver() {
		cd "$pkgname" || return 1
		local _ret=
		for i in $(sed -n '
s/^ *VERSION_MAJOR *= *\([0-9][0-9]*\).*/\1/p
s/^ *VERSION_MINOR *= *\([0-9][0-9]*\).*/.\1/p
s/^ *VERSION_RELEASE *= *\([0-9][0-9]*\).*/.\1/p
' ParserGen/Output.h); do _ret="$_ret$i"; done
		echo "$_ret"
	}
fi

build() {
	cd "$pkgname" || return 1
	cmake -D FETCH_DEPENDEES=1 .
	cd ParserGen/ || return 1
	make -j
	cd ../ScannerGen/ || return 1
	make -j
}

check() {
	cd "$pkgname" || return 1
	for i in ParserGen/parsergen ParserGen/grammarstrip ScannerGen/scannergen; do
		if [[ ! -x "$i" ]]; then
			return 1
		fi
	done
	if [[ ! -f ScannerGen/RE_Suite.txt ]]; then
		return 1
	fi
}

package() {
	cd "$pkgname" || return 1
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	for i in ParserGen/parsergen ParserGen/grammarstrip ScannerGen/scannergen; do cp "$i" "$pkgdir/usr/bin/"; done
	cp ScannerGen/RE_Suite.txt "$pkgdir/usr/share/$pkgname/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

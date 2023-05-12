#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
pkgname=brew
pkgver=4.0.17
_installer_pkgname=Homebrew-AUR-installer
_installer_pkgver=1.0.1
pkgrel=2
pkgdesc='``The missing packager for macOS'\'\'' on Arch GNU/Linux'
arch=(any)
url="https://brew.sh/"
license=('BSD')
groups=()
depends=(ruby)
optdepends=('gcc: most casks require it')
provides=(homebrew linuxbrew)
conflicts=(homebrew linuxbrew)
source=("git+https://github.com/Homebrew/brew/#tag=$pkgver"
	"https://github.com/ctrlcctrlv/$_installer_pkgname/archive/refs/tags/$_installer_pkgver.tar.gz"
	"0001-allow-usr-root.patch")
b2sums=('SKIP'
        'bf7e17cfcc8dece510bda87f03996bbbd179d5e4eed16694fb4f663df2c2b52983eea1f8e2c2dafd2721b75c16bc4dc84b5b08ec9738e9f302bc1ab8803f9dfc'
        'b2909d5cb75a480309abc2a70400a86b33615bc57934148db0622cc578503d711825c4e5c8dabcef0c6660b5653b514d82d1b0e372230fa4d7e1799ecd5e68c3')

TEMPFILE=`mktemp`

prepare() {
	([ -d $srcdir/$_installer_pkgname-$_installer_pkgver/brew ] &&
		rm -rf $srcdir/$_installer_pkgname-$_installer_pkgver/brew) || true
}

_deltemp() {
	rm "$TEMPFILE"
}

build() {
	trap _deltemp INT
	cd "$srcdir/$_installer_pkgname-$_installer_pkgver"

	export NONINTERACTIVE="Y"
	export HOMEBREW_PREFIX="$srcdir/brew_pkg"
	mkdir "$HOMEBREW_PREFIX" || true
	export HOMEBREW_SUPPRESS_PATH_WARNING="Y"
	export HOMEBREW_INSTALL_VERSION=4.0.17
	export HOMEBREW_ROOT_OKIE_DOKIE="Y"
	export TEMPFILE=`mktemp`
	echo "$TEMPFILE"
	3<>$TEMPFILE && \
	3>&1 env
	cd "$srcdir/brew"
	cp "$srcdir/$_installer_pkgname-$_installer_pkgver/install.sh" .
	BASH_ENV="$TEMPFILE" bash -i install.sh
}

package() {
	rm -r "$pkgdir"
	mkdir -p "$pkgdir"
	cp -r "$srcdir/brew_pkg"/* "$pkgdir"
	mkdir -p "$pkgdir/usr"
	for dir in bin lib sbin; do
		mv "$pkgdir/$dir" "$pkgdir/usr/$dir"
	done
	for dir in bin lib sbin; do
		find "$pkgdir" -empty -type d -exec bash -c 'rmdir {}' \; || true
	done
	find "$pkgdir" -name .git -type d -exec rm -r {} \; || true
	mv "$pkgdir/Homebrew" "$pkgdir/usr/bin"
	rm "$pkgdir/usr/bin/brew"
	ln -s "$pkgdir/usr/bin/Homebrew/bin/brew" "$pkgdir/usr/bin/brew"
	warning "Patching brew.sh… this AUR package is not officially supported upstream, obviously, they want you to know this."
	patch -p3 "$pkgdir"/usr/bin/Homebrew/Library/Homebrew/brew.sh < ./0001-allow-usr-root.patch
}

#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
pkgbase=brew
pkgname=('brew' 'brew-doc')
pkgver=4.0.17
_installer_pkgname=Homebrew-AUR-installer
_installer_pkgver=1.0.1
pkgrel=3
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
	cd "$srcdir/brew"
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
	git checkout $pkgver
	BASH_ENV="$TEMPFILE" bash -i install.sh
}

package_brew() {
	rm -rv "$pkgdir"
	mkdir -p "$pkgdir"
	cp -LRv "$srcdir/brew_pkg"/* "$pkgdir" || true
	rm -rv "$pkgdir/Homebrew/docs" "$pkgdir/Homebrew/manpages"
	mkdir -pv "$pkgdir/usr"
	BADHBDIRS=(bin lib sbin share)
	for dir in ${BADHBDIRS[@]}; do
		mv -v "$pkgdir/$dir" "$pkgdir/usr/$dir"
	done
	for dir in ${BADHBDIRS[@]}; do
		find "$pkgdir" -empty -type d -exec bash -c 'rmdir {}' \; || true
	done
	find "$pkgdir" -name .git -type d -exec rm -r {} \; || true
	mv -v "$pkgdir/Homebrew" "$pkgdir/usr/bin"
	rm -v "$pkgdir/usr/bin/brew"
	ln -vs "$pkgdir/usr/bin/Homebrew/bin/brew" "$pkgdir/usr/bin/brew"
	warning "Patching brew.sh… this AUR package is not officially supported upstream, obviously, they want you to know this."
	patch -p3 "$pkgdir"/usr/bin/Homebrew/Library/Homebrew/brew.sh < ./0001-allow-usr-root.patch
	rm -rfv "$pkgdir/usr/share/man/man1"
	ln -vs /var "$pkgdir"/usr/var
	warning 'NB: You'\''re gonna have to run `sudo chown -R $(whoami):$(whoami) /var/homebrew` after installing!'
}

package_brew-doc() {
	provides=()
	conflicts=()
	mkdir -p "$srcdir/doc/brew"
	mkdir -p "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/brew"
	cp "$srcdir/brew_pkg/Homebrew/manpages/brew.1" "$pkgdir/usr/share/man/man1/"
	cp -r "$srcdir/brew_pkg/Homebrew/docs/"* "$pkgdir/usr/share/doc/brew/"
}

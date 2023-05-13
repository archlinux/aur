#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairvoyant

pkgbase=brew
pkgname=('brew-doc' 'brew')
_installer_pkgname=Homebrew-AUR-installer
_installer_pkgver=1.0.1
pkgver=4.0.17
pkgrel=4
pkgdesc='``The missing packager for macOS'\'\'' on Arch GNU/Linux'
arch=(any)
url="https://brew.sh/"
license=('BSD')
groups=()
depends=(ruby)
makedepends=(git)
optdepends=('gcc: most casks require it')
provides=(homebrew linuxbrew)
conflicts=(homebrew linuxbrew)
_tag=c0f8068573bbf886fdc78d3f9daca54d53e7e49e #$(git rev-parse "$pkgver")
source=("git+https://github.com/Homebrew/brew/#tag=$_tag"
	"core::git+https://github.com/Homebrew/homebrew-core"
	"$pkgname-$pkgver.tar.gz::https://github.com/ctrlcctrlv/$_installer_pkgname/archive/refs/tags/$_installer_pkgver.tar.gz"
	"0001-allow-usr-root.diff")
b2sums=('SKIP'
        'SKIP'
        'bf7e17cfcc8dece510bda87f03996bbbd179d5e4eed16694fb4f663df2c2b52983eea1f8e2c2dafd2721b75c16bc4dc84b5b08ec9738e9f302bc1ab8803f9dfc'
        '433d4ed6ac698ea220b72cc1c1e6b015fe77ffd6193ddc6e88e4e8ecef7dde21729e7a50e2cbd8af8021add68df1bedb1e876772cd78b8813312fd04cfa160dd')

# Used to hold an environment to pass to the install script.
TEMPFILE=`mktemp --suffix=.env`

_deltemp() {
	rm "$TEMPFILE"
}

prepare() {
	([ -d $srcdir/$_installer_pkgname-$_installer_pkgver/brew ] &&
		rm -rf $srcdir/$_installer_pkgname-$_installer_pkgver/brew) || true
	patch -p3 "$srcdir/brew/Library/Homebrew/brew.sh" "$srcdir/0001-allow-usr-root.diff" -o - > $srcdir/brew.sh
}

build() {
	cd "$srcdir/$_installer_pkgname-$_installer_pkgver"
	trap _deltemp INT
	trap _deltemp EXIT

	export NONINTERACTIVE="Y"
	export HOMEBREW_PREFIX="$srcdir/brew_pkg"
	export HOMEBREW_CORE="$srcdir/core"
	mkdir -p "$HOMEBREW_PREFIX"
	mkdir -p "$HOMEBREW_PREFIX/Homebrew/Library/Taps/homebrew"
	ln -s "$HOMEBREW_CORE" "$HOMEBREW_PREFIX/Homebrew/Library/Taps/homebrew/homebrew-core"
	export HOMEBREW_SUPPRESS_PATH_WARNING="Y"
	export HOMEBREW_INSTALL_VERSION=4.0.17
	export HOMEBREW_ROOT_OKIE_DOKIE="Y"
	export TEMPFILE=`mktemp`

	3<>$TEMPFILE && \
	3>&1 env

	cd "$srcdir/brew"
	cp "$srcdir/$_installer_pkgname-$_installer_pkgver/install.sh" .
	# Run brew installer.
	BASH_ENV="$TEMPFILE" bash -i install.sh
}

package_brew-doc() {
	provides=()
	conflicts=()
	mkdir -pv "$srcdir/doc/brew"
	mkdir -pv "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/brew"
	cp -v "$srcdir/brew_pkg/Homebrew/manpages/brew.1" "$pkgdir/usr/share/man/man1/"
	cp -rv "$srcdir/brew_pkg/Homebrew/docs/"* "$pkgdir/usr/share/doc/brew/"
}

package_brew() {
	# Resolve symlinks so we don't break them later.
	cp -LRv "$srcdir/brew_pkg"/* "$pkgdir" || true
	# These go in -doc package.
	rm -rv "$pkgdir/Homebrew/docs" "$pkgdir/Homebrew/manpages"
	mkdir -pv "$pkgdir/usr"
	# Move /sbin to /usr/sbin etc.
	BADHBDIRS=(bin lib sbin share)
	for dir in ${BADHBDIRS[@]}; do
		mv -v "$pkgdir/$dir" "$pkgdir/usr/$dir"
	done
	for dir in ${BADHBDIRS[@]}; do
		find "$pkgdir" -empty -type d -exec bash -c 'rmdir {}' \; || true
	done
	# Remove large unneeded .git repository.
	find "$pkgdir" -name .git -type d -exec rm -r {} \; || true
	# Otherwise /Homebrew'd be in sysroot lol
	mv -v "$pkgdir/Homebrew" "$pkgdir/usr/bin"
	# Relink main binary.
	rm -v "$pkgdir/usr/bin/brew"
	ln -vs "$pkgdir/usr/bin/Homebrew/bin/brew" "$pkgdir/usr/bin/brew"
	rm -rfv "$pkgdir/usr/share/man/man1"
	ln -vs /var "$pkgdir"/usr/var
	mkdir -pv "$pkgdir/usr/share/licenses/brew"
	install -m644 "$srcdir/brew_pkg/Homebrew/LICENSE.txt" "$pkgdir/usr/share/licenses/brew/LICENSE"
	cp -v "$srcdir/brew.sh" "$pkgdir/usr/bin/Homebrew/Library/Homebrew/brew.sh"

	# Finally, warnings.
	warning "$(tput sgr0 setaf 1 bold)This AUR package is not officially supported upstream$(tput sgr0), obviously. $(tput setaf 8 sitm)They want you to know this.$(tput sgr0)"
	msg "$(tput sgr0)"'NB: You'\''re gonna have to run `sudo chown -R $(whoami):$(whoami) /var/homebrew` after installing!''
	'"$(tput setaf 8)I also recommend you always run with $(tput sgr0 setaf 2)HOMEBREW_NO_AUTO_UPDATE=1$(tput sgr0 setaf 8).$(tput sgr0)"
	warning "$(tput sgr0 setab 52; echo -e "\e[4:3m")Be careful with "'`brew`, as it installs to /usr!'"$(tput sgr0) It's intended for building bottles."'
             '"$(tput smul)"'You may prefer a local install.'"$(tput sgr0)"
}

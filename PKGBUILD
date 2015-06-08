# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>

pkgname=nagios-cli-git
pkgver=20141020
pkgrel=1
pkgdesc="a nagios command line interface, exposing some features that are available via the web based graphical user interface."
arch=('any')
url="https://github.com/tehmaze/nagios-cli"
license=('unknown') # Looks like GPL, but it's not written anywhere exactly.
depends=("python2")
# Probably should include readline, but there's no python2-readline package available.
makedepends=('git')
provides=("nagios-cli")

_gitroot=https://github.com/tehmaze/nagios-cli.git
_gitname=nagios-cli.git

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
	python2 setup.py build
}

package() {
	cd "$srcdir/$_gitname-build"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

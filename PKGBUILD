# Maintainer: Florian Albertz <flo.albertz@gmail.com>
pkgname="archci"
pkgver="1.6.2"
pkgrel=1
pkgdesc='A script to create AppContainer Images from Arch Linux packages (Repo or Aur)'
arch=('any')
url='https://github.com/PaulAvery/archci'
license=('BSD')
depends=('fish' 'nodejs' 'pacman' 'pacaur' 'coreutils' 'rkt' 'gnupg' 'arch-install-scripts' 'sudo' 'actool-git')
makedepends=('npm' 'ronn')
source=("${pkgname}::git+https://github.com/PaulAvery/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"

	# Pull in submodules (fish-n-chips)
	git submodule init
	git submodule update

	# Create manpage
	ronn -r --manual=${pkgname} --organization="Florian Albertz" "README.md"

	# Install sx dependency
	npm install sx
}

package() {
	cd "${pkgname}"

	# Create /usr/bin symlink and install LICENSE and MANPAGE
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/lib/archci/archci.fish" "$pkgdir/usr/bin/archci"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/archci/BSD-3-Clause"
	install -Dm 644 "README.1" "$pkgdir/usr/share/man/man1/archci.1"

	# Install application files
	install -Dm 755 archci.fish "$pkgdir/usr/lib/archci/archci.fish"
	install -Dm 755 chips/chips.fish "$pkgdir/usr/lib/archci/chips/chips.fish"
	cp -PR lib "$pkgdir/usr/lib/archci"
	cp -PR chips/chips "$pkgdir/usr/lib/archci/chips"
	cp -PR node_modules "$pkgdir/usr/lib/archci"
}

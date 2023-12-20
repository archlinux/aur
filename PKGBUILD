# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>

pkgname=dots-stable
pkgver=1.3.1
pkgrel=1
pkgdesc="Dotfiles generator that allows quick configuration and managing of different tools and window managers in multiple OSs"
arch=(any)
url="https://github.com/ulises-jeremias/dotfiles"
license=('MIT')
depends=(git chezmoi)
optdepends=()
provides=(dots)
conflicts=(dots)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd dotfiles || exit
	git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd dotfiles || exit
	git fetch --tags
	latest_release=$(git describe --tags "$(git rev-list --tags --max-count=1)")
	git checkout "${latest_release}"
	cd ..

	if [[ ! -d "${HOME}/.local/share/chezmoi" ]]; then
		cp -rf ./dotfiles ~/.dotfiles
	fi

	chezmoi init --apply --verbose --force --source ~/.dotfiles
}

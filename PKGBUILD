# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=nnn-git
pkgver=4.6.r48.gf89ba775
pkgrel=1
pkgdesc="The fastest terminal file manager ever written."
arch=(x86_64)
url='https://github.com/jarun/nnn'
license=(BSD)
depends=(bash sed)
optdepends=(
	'atool: for more archive formats'
	'libarchive: for more archive formats'
	'zip: for zip archive format'
	'unzip: for zip archive format'
	'trash-cli: to trash files'
	'sshfs: mount remotes'
	'rclone: mount remotes'
	'fuse2: unmount remotes'
	'xdg-utils: desktop opener'
)
makedepends=(git)
provides=(nnn)
conflicts=(nnn)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd nnn
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
	sed -i 's/install: all/install:/' nnn/Makefile
}

build() {
	cd nnn
	make
}

package() {
	cd nnn
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	make DESTDIR="${pkgdir}" PREFIX=/usr install-desktop

	install -Dm644 misc/auto-completion/fish/nnn.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nnn.fish"
	install -Dm644 misc/auto-completion/bash/nnn-completion.bash "${pkgdir}/usr/share/bash-completion/completions/nnn"
	install -Dm644 misc/auto-completion/zsh/_nnn "${pkgdir}/usr/share/zsh/site-functions/_nnn"

	install -Dm644 -t "${pkgdir}/usr/share/nnn/quitcd/" misc/quitcd/*

	cp -a plugins "${pkgdir}/usr/share/nnn/plugins/"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

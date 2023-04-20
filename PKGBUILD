# Maintainer: éclairevoyant
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

_pkgname=neovim
pkgname="$_pkgname-git"
pkgver=0.9.0.r263.gdbcd1985d1
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs.'
arch=(i686 x86_64 armv7h armv6h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=(libluv libtermkey libuv 'libvterm>=0.3' luajit msgpack-c tree-sitter unibilium)
makedepends=(cmake git lua51-lpeg ninja)
optdepends=('python-neovim: for Python 3 plugin support (see :help provider-python)'
            'ruby-neovim: for Ruby plugin support (see :help provider-ruby)'
            'xclip: for X11 clipboard support (or xsel) (see :help provider-clipboard)'
            'xsel: for X11 clipboard support (or xclip) (see :help provider-clipboard)'
            'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
provides=("$_pkgname=${pkgver/\.r*/}" 'vim-plugin-runtime')
conflicts=("$_pkgname")
source=("git+https://github.com/neovim/$_pkgname.git"
        "$pkgname-archlinux.vim"
        "$pkgname-sysinit.vim")
b2sums=('SKIP'
        'd0871e240bd9c7de7d898e1fba95364f4c4a12dbb3ac40892bbf93a49eb0e8cc2c8bc1ccae9ea5b700581a185a4df56bd28427d42a7d4b288560207b3951a15d'
        '6ed647c3a4c0907a60060fa61117d484aa091c69c73dda1f0a99aa4e67870ae2092a2c1057a15ced9fc56b08374ce8a8b86dbe531df777f9ad49302c7a9d3da0')
install=$pkgname.install
options=(!strip)

pkgver() {
	cd $_pkgname
	git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S"$_pkgname" -Bbuild \
		-GNinja \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	build/bin/nvim --version
	build/bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
	# Make Arch vim packages work
	install -Dm644 $pkgname-sysinit.vim "$pkgdir/etc/xdg/nvim/sysinit.vim"
	install -Dm644 $pkgname-archlinux.vim "$pkgdir/usr/share/nvim/archlinux.vim"

	cd build
	DESTDIR="$pkgdir" cmake --build . --target install

	cd ../$_pkgname
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 runtime/nvim.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 runtime/nvim.appdata.xml -t "$pkgdir/usr/share/metainfo/"
	install -Dm644 runtime/nvim.png -t "$pkgdir/usr/share/pixmaps/"
}

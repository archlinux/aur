# Maintainer: éclairevoyant
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=neovim-git
pkgver=0.9.0.r1966.g9abced6ad9
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs.'
arch=(i686 x86_64 armv7h armv6h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=(glibc hicolor-icon-theme libluv libtermkey libuv 'libvterm>=0.3' lua51-lpeg luajit msgpack-c tree-sitter unibilium)
makedepends=(cmake git ninja)
optdepends=('python-neovim: for Python 3 plugin support (see :help provider-python)'
            'ruby-neovim: for Ruby plugin support (see :help provider-ruby)'
            'xclip: for X11 clipboard support (or xsel) (see :help provider-clipboard)'
            'xsel: for X11 clipboard support (or xclip) (see :help provider-clipboard)'
            'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
provides=("neovim=${pkgver}" 'vim-plugin-runtime')
conflicts=('neovim')
source=("${pkgname}.tar.gz::file:///home/chinmay/stuff/pkgbuilds/nvim/repo.tar.gz"
        "neovim-git-archlinux.vim"
        "neovim-git-sysinit.vim")
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=(!strip)

pkgver() {
  cd /home/chinmay/stuff/pkgbuilds/nvim/repo
  git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
        -DCMAKE_C_FLAGS="-march=native -mtune=native"
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

	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 runtime/nvim.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 runtime/nvim.appdata.xml -t "$pkgdir/usr/share/metainfo/"
	install -Dm644 runtime/nvim.png -t "$pkgdir/usr/share/pixmaps/"
}

# vim:set sw=2 sts=2 et:

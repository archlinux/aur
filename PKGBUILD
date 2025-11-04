# Maintainer: boydaihungst <boydaihungst@gmail.com>
# Contributor: Kevin Del Castillo <quebin31@gmail.com>
# Contributor: Huy Hoang <boydaihungst@gmail.com>
# Contributor: éclairevoyant <hidden>
# Keywords: neovim nvim vim editor terminal

_pkgname=neovim
pkgname=neovim-nightly-bin
pkgver=0.12.0+dev+1565+gb80d390765
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs (nightly build)'
arch=('x86_64' 'aarch64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=('hicolor-icon-theme')
makedepends=('jq')
optdepends=('python-neovim: for Python 3 plugin support (see :help provider-python)'
	'ruby-neovim: for Ruby plugin support (see :help provider-ruby)'
	'xclip: for X11 clipboard support (or xsel) (see :help provider-clipboard)'
	'xsel: for X11 clipboard support (or xclip) (see :help provider-clipboard)'
	'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
provides=("$_pkgname=${pkgver/\+*/}" 'vim-plugin-runtime')
conflicts=("$_pkgname")
_date="$(date -u +%Y%m%d)"
case "$CARCH" in
x86_64)
	architecture="x86_64"
	;;
aarch64)
	architecture="arm64"
	;;
*)
	echo "Unsupported architecture: $CARCH"
	exit 1
	;;
esac
source=("$_pkgname-$_date.tar.gz::https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-${architecture}.tar.gz"
	"$pkgname-archlinux.vim"
	"$pkgname-sysinit.vim")
b2sums=('SKIP'
	'd0871e240bd9c7de7d898e1fba95364f4c4a12dbb3ac40892bbf93a49eb0e8cc2c8bc1ccae9ea5b700581a185a4df56bd28427d42a7d4b288560207b3951a15d'
	'6ed647c3a4c0907a60060fa61117d484aa091c69c73dda1f0a99aa4e67870ae2092a2c1057a15ced9fc56b08374ce8a8b86dbe531df777f9ad49302c7a9d3da0')
install=$pkgname.install

pkgver() {
	cd "$srcdir/nvim-linux-${architecture}"
	./bin/nvim --version | awk 'NR == 1 { sub("NVIM v", ""); gsub("-", "+"); print $1 }'
}

prepare() {
	if [[ -n "$CHECKSUM" ]]; then
		tar_shad256=$(sha256sum $_pkgname-"$_date".tar.gz | awk '{print $1}')
		git_assets_shad256=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/tags/nightly" | jq -r ".assets[] | select(.name == 'nvim-linux-${architecture}.tar.gz') | .digest" | awk '{sub(/^sha256:/, ""); print}')
		if [ "$tar_shad256" != "$git_assets_shad256" ]; then
			echo "SHA256 sum mismatch for $_pkgname-$_date.tar.gz"
			exit 1
		fi
	fi
}

check() {
	cd nvim-linux-${architecture}
	./bin/nvim --version
	./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
	# Make Arch vim packages work
	install -Dm644 $pkgname-sysinit.vim "$pkgdir/etc/xdg/nvim/sysinit.vim"
	install -Dm644 $pkgname-archlinux.vim "$pkgdir/usr/share/nvim/archlinux.vim"

	cd nvim-linux-${architecture}
	install -Dm755 bin/nvim -t "$pkgdir/usr/bin/"
	cp -r lib share "$pkgdir/usr/"
}

_gitname='splitfs'
pkgname="$_gitname-git"
_gitbranch='master'
pkgver=r4.248a79c
pkgrel=2
pkgdesc='FUSE filesystem that chunks files up.'
arch=('any')
url="https://github.com/EtiennePerot/$_gitname"
license=('BSD')
depends=('fuse')
makedepends=('git' 'go')
source=(
	"git://perot.me/$_gitname#branch=$_gitbranch"
	"fuse::git+https://github.com/bazil/fuse"
	"net::git+https://github.com/golang/net"
)
sha512sums=('SKIP' 'SKIP' 'SKIP')
_self_package="perot.me/$_gitname"
_vendor_git_submodules=(
	'fuse:bazil.org/fuse'
	'net:golang.org/x/net'
)
_go_binaries=(
	'splitfs:splitfs.go'
)

pkgver() {
	cd "$srcdir/$_gitname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	# Emulate a GOPATH so we can build in peace.
	mkdir -p "$(dirname "$srcdir/gopath/src/$_self_package")"
	ln -s "$srcdir/$_gitname" "$srcdir/gopath/src/$_self_package"
	cd "$srcdir/gopath/src/$_self_package"
	# Take care of submodules.
	local _vendor_git_submodule _srcdir_subdir _package_name
	for _vendor_git_submodule in "${_vendor_git_submodules[@]}"; do
		_srcdir_subdir="$(echo "$_vendor_git_submodule" | cut -d: -f1)"
		_package_name="$(echo "$_vendor_git_submodule" | cut -d: -f2-)"
		git config "submodule.vendor/$_package_name.url" "$srcdir/$_srcdir_subdir"
		git submodule update "vendor/$_package_name"
	done
	# Actually build.
	mkdir -p "$srcdir/bin"
	local _go_binary _binary_name _go_binary_file
	for _go_binary in "${_go_binaries[@]}"; do
		_binary_name="$(echo "$_go_binary" | cut -d: -f1)"
		_go_binary_file="$(echo "$_go_binary" | cut -d: -f2-)"
		GOPATH="$srcdir/gopath" go build -o "$srcdir/bin/$_binary_name" "$_go_binary_file"
	done
}

package() {
	cd "$srcdir/$_gitname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	local _go_binary _binary_name
	for _go_binary in "${_go_binaries[@]}"; do
		_binary_name="$(echo "$_go_binary" | cut -d: -f1)"
		install -D -m755 "$srcdir/bin/$_binary_name" "$pkgdir/usr/bin/$_binary_name"
	done
}

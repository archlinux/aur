# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Contributor: dmitmel
pkgname=codelldb
_reponame=vscode-lldb
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
pkgver=1.7.0
pkgrel=2
url="https://github.com/vadimcn/$_reponame"
arch=("x86_64" "aarch64" "arm7h")
license=("custom:MIT")
options=(!debug strip) #Debug package is broken
source=("$_reponame.tar.gz::https://github.com/vadimcn/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("275dac810e6b20584f1b82b785fdee28539eda1b9f8b9395dd74441b43f11b3b")
depends=(lldb)
makedepends=(cmake cargo npm python)
build() {    
	export RUSTUP_TOOLCHAIN=stable
	export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security"
	# Doesn't build with -fno-plt 
	cd "$_reponame-$pkgver"
	cmake -B build -DLLDB_PACKAGE=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build --target codelldb
}
package() {
	local reset_shopt="$(shopt -p globstar)"
	shopt -s globstar
	
	cd "$_reponame-$pkgver"
	local _lib_dir="$pkgdir/usr/lib/codelldb"

	# <https://github.com/vadimcn/vscode-lldb/blob/v1.7.0/CMakeLists.txt#L173-L186>
	install -Dm644 -t "$_lib_dir" build/platform.ok
	install -Dm755 -t "$_lib_dir"/adapter build/adapter/{codelldb,*.so}
	install -Dm644 -t "$_lib_dir"/adapter build/adapter/*.py
	install -Dm644 -t "$_lib_dir"/formatters build/formatters/**/*.py

	install -d "$_lib_dir"/lldb
	ln -s -t "$_lib_dir"/lldb /usr/{bin,lib}

	install -d "$pkgdir"/usr/bin
	ln -s -t "$pkgdir"/usr/bin "$_lib_dir"/adapter/codelldb

	install -Dm644 -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
	eval "$reset_shopt"
}

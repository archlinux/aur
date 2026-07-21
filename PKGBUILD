# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=moonstone
pkgver=0.3.25
pkgrel=1
pkgdesc='Modern, deterministic Lua project environments and package manager written in Zig'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/moonstone-sh/$pkgname"
license=(Apache-2.0)
depends=(glibc # libc.so ld-linux-x86-64.so
         sqlite3
         zstd)
makedepends=(cmake
             zig)
conflicts=(moon
           moonbit
           moonscript)
_archive="$pkgname-$pkgver"
# _zigdeps=(https://github.com/sam701/zig-toml/archive/master.tar.gz)
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz"
        "$pkgname-triples.patch")
sha256sums=('43ce44f4568dd983ec58711107a0c9be587aca5776a8e0369ce0fb1e966ce9d2'
            '2345e3fce271e813f901b63fb52700ebaedde0b176c98dd12cf1ccfd5e60c2cc')

prepare() {
	cd "$_archive"
	# patch -p1 -i "../$pkgname-triples.patch"
	# sed -i -e "/const target_triples =/,/};/c\    const target_triples = [_][]const u8{ \"$CARCH-linux-gnu\", };" build.zig
	# zig fetch --debug-hash --global-cache-dir "$_global_cache"
}

build() {
	cd "$_archive"
	local zig_options=(
		-Doptimize=ReleaseFast
		-Dtarget=$CARCH-linux-gnu
		-Dcpu=baseline
		# -Dpie=true
		-Dinstallation-ownership=external
		--build-id=sha1
		--prefix /usr
		--search-prefix /usr
		# --system "$srcdir/zig-global-cache/p"
		--prefix /usr
		--search-prefix /usr
		--summary all
		--verbose
	)
	DESTDIR=build zig build ${zig_options[@]}
}

_compgen() {
	cd "$_archive"
	./build/sur/bin/moon completions $1
}

package() {
	cd "$_archive"
	local _binname=moon
	install -Dm0755 -t "$pkgdir/usr/bin/" build/usr/bin/$_binname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 <(_compgen bash) "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm0644 <(_compgen fish) "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"
	install -Dm0644 <(_compgen zsh)  "$pkgdir/usr/share/zsh/site-functions/_$_binname"
}

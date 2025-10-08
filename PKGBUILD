# Maintainer: Christopher Hartono <christhartono@hotmail.com>
## options
: ${_install_path:=usr/lib}

_pkgname="kitshell"
pkgname="kitshell-git"
pkgver=r270.695de49
pkgrel=1
pkgdesc="An easy to use panel for Wayland WMs"
arch=(x86_64)
url="https://github.com/bootloopmaster636/kitshell"
license=('GPL-3.0-or-later')
options=('!debug')

depends=(glib2 libepoxy libxcb at-spi2-core pango cairo gtk-layer-shell dbus fontconfig gtk3 glibc gcc-libs)
makedepends=(git tar fvm rustup cmake ninja clang patchelf)
optdepends=('kitshell-cmd-git: control Kitshell via command line')

conflicts=('kitshell')
provides=('kitshell')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgsrc"
	fvm use 3.35.5
	rustup toolchain install stable 

	cargo install flutter_rust_bridge_codegen
} 

pkgver() {
	cd "$_pkgsrc"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$_pkgsrc"
	PATH=$PATH:~/.cargo/bin/ # to make flutter_rust.. crate work

	fvm flutter --disable-analytics
	fvm dart --disable-analytics

	fvm flutter pub get
	fvm dart run slang build
	fvm dart run build_runner build
	flutter_rust_bridge_codegen generate

	fvm flutter build linux --no-pub --release
}

package() {
	cd "$_pkgsrc/build/linux/x64/release/bundle"

	# Kitshell files
	install -Dm755 "kitshell" "$pkgdir/$_install_path/$_pkgname/$_pkgname"
	cp --reflink=auto -r data/ "$pkgdir/$_install_path/$_pkgname/"
	cp --reflink=auto -r lib/ "$pkgdir/$_install_path/$_pkgname/"

	# Runpath
	patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/$_install_path/$_pkgname/$_pkgname"
  	for i in "$pkgdir/$_install_path/$_pkgname/lib"/*.so; do
    		[ -z "$(patchelf --print-rpath "$i")" ] && continue
    		patchelf --set-rpath '$ORIGIN' "$i"
  	done

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
  	ln -sfr "$pkgdir/$_install_path/$_pkgname/$_pkgname" "$pkgdir/usr/bin/${_pkgname}"

	# License
  	install -Dm644 "$srcdir/$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# Set permissions
	chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}


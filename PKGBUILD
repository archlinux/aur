pkgname=conquest-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Conquest is a feature-rich and malleable command & control/post-exploitation framework developed in Nim."
arch=("any")
url="https://github.com/jakobfriedl/conquest.git"
backup=('etc/conquest/default.toml')
license=("BSD 3-Clause License")
depends=('nim' 'nimble' 'git' 'curl' 'base-devel' 'xz' 'glfw-x11' 'mesa' 'glu' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'gtk2')
source=("git+https://github.com/jakobfriedl/conquest" 'conquest.service')
sha1sums=('SKIP' '712aca37272746ea97f31e82f0b40f7ad9e9aa69')

prepare(){
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p vendor
	nimble install -d --nimbleDir:./vendor
	CONQUEST_ROOT=/usr/share/conquest/ nimble --nimbleDir:./vendor client
	CONQUEST_ROOT=/usr/share/conquest/ nimble --nimbleDir:./vendor server
}

package() {
	mkdir -p $pkgdir/usr/share/
	mkdir -p $pkgdir/usr/local/bin
	mkdir -p $pkgdir/root/.nimble
	mkdir -p $pkgdir/etc/conquest/
	mkdir -p $pkgdir/usr/lib/systemd/system/
	install -D -m644 "$srcdir/conquest/data/profiles/profile.toml" "$pkgdir/etc/conquest/default.toml"
	install -D -m644 "$srcdir/conquest.service" "$pkgdir/usr/lib/systemd/system/conquest.service"
	ln -s /usr/share/conquest/bin/client "$pkgdir/usr/local/bin/conquest"
	cp -ra $srcdir/* $pkgdir/usr/share/
	cp -ra $srcdir/conquest/vendor/* $pkgdir/root/.nimble/
}

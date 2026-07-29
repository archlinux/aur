pkgname=conquest-git
pkgver=0.5.0
pkgrel=1
pkgdesc="Conquest is a feature-rich and malleable command & control/post-exploitation framework developed in Nim."
arch=("x86_64")
url="https://github.com/jakobfriedl/conquest.git"
backup=('etc/conquest/default.toml')
license=("BSD 3-Clause License")
depends=('nim' 'nimble' 'git' 'curl' 'base-devel' 'xz' 'glfw-x11' 'mesa' 'glu' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'gtk2')
source=("git+https://github.com/jakobfriedl/conquest" 'conquest.service' 'conquest.1' 'conquest.nimble.patch' 'mummy.nim.patch')
sha1sums=('SKIP' '154fa07dc18012bcf67c95e12750f3c4c7289a56' '5b57fcc21655e2ed204cbd100506ae2f3a706cfd' 'e7e2c1f337939c9d799874ecae1f618ced4b111f' 'e9b8436bb03f8003831d8244086596eebf776c24')
install=conquest.install

prepare(){
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p vendor
	nimble install gtk2
	nimble refresh
	patch -p1 ./conquest.nimble < ../conquest.nimble.patch
	nimble install -d --nimbleDir:./vendor
	# patching the broken dependencies here
	#patch -p1 $(find ./vendor/pkgs2/ -name mummy.nim) < ../mummy.nim.patch
	CONQUEST_ROOT=/usr/share/conquest/ nimble --nimbleDir:./vendor client
	CONQUEST_ROOT=/usr/share/conquest/ nimble --nimbleDir:./vendor server
}

package() {
	mkdir -p $pkgdir/usr/share/
	mkdir -p $pkgdir/usr/local/bin
	mkdir -p $pkgdir/etc/conquest/
	mkdir -p $pkgdir/usr/lib/systemd/system/
	mkdir -p $pkgdir/usr/share/man/man1/
	install -D -m644 "$srcdir/conquest/data/profiles/profile.toml" "$pkgdir/etc/conquest/default.toml"
	install -D -m644 "$srcdir/conquest.service" "$pkgdir/usr/lib/systemd/system/conquest.service"
	install -D -m644 "$srcdir/conquest.1" "$pkgdir/usr/share/man/man1/conquest.1"
	ln -s /usr/share/conquest/bin/client "$pkgdir/usr/local/bin/conquest"
	cp -ra $srcdir/* $pkgdir/usr/share/
}

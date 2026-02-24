pkgname=conquest-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Conquest is a feature-rich and malleable command & control/post-exploitation framework developed in Nim."
arch=("any")
url="https://github.com/jakobfriedl/conquest.git"
license=("BSD 3-Clause License")
depends=('nim' 'nimble' 'git' 'curl' 'base-devel' 'xz' 'glfw-x11' 'mesa' 'glu' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'gtk2')
source=("git+https://github.com/jakobfriedl/conquest#branch=smb")
sha1sums=('SKIP')

prepare(){
	cd "$srcdir/${pkgname%-git}"
	git checkout smb
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${pkgname%-git}"
	nimble install -d
	nimble client
	echo -e "#!/bin/bash\n\
cd /usr/share/conquest\n\
./bin/client \$@" > conquest.sh
	chmod +x conquest.sh
}

package() {
	mkdir -p $pkgdir/usr/share/
	mkdir -p $pkgdir/usr/local/bin
	install -D -m755 conquest/conquest.sh $pkgdir/usr/local/bin/conquest
	cp -ra $srcdir/* $pkgdir/usr/share/
}

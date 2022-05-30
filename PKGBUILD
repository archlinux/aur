# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=123-bin
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="Lotus 1-2-3 for Unix release 3.0"
arch=("i386")
url="https://github.com/taviso/123elf"
license=('unknown')
groups=()
depends=("lib32-ncurses")
makedepends=('unzip' 'cpio' 'gcc' 'binutils')
checkdepends=()
optdepends=()
provides=('123')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/taviso/123elf.git"
"https://archive.org/compress/123-unix/formats=ISO%20IMAGE&file=/123-unix.zip"
"123.sh"
)
noextract=('123-unix.zip')
sha256sums=(
    'SKIP'
    'ff6e43b904c1611d13baaf6d33df9ccf0ab2153025fbd384ca17ffd16c525e29'
    '02774d899d22c3ea807b5065e6ade1285eb5da175588507a4f047e65bce409b5'
    )
validpgpkeys=()

prepare() {
	cd "$pkgname"
    unzip -n ../123-unix.zip
    y | ./extract.sh
}

build() {
	cd "$pkgname"
    ./binutils.sh || true
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "123" "$pkgdir/usr/share/lotus/bin/123.bin"
    install -D -m755 "../123.sh" "$pkgdir/usr/bin/123"
    gzip -kf root/lotus/man/man1/123.1
    install -D -m644 root/lotus/man/man1/123.1.gz "$pkgdir/usr/share/man/man1/123.1.gz"
    install -d "$pkgdir/usr/share/lotus"
    cp -r "root/lotus/123.v10" "$pkgdir/usr/share/lotus/"
}

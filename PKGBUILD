# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="Obfuscation-Tunnel"
pkgname="${_pkgname,,}-git"
pkgver=r80.cbd31a1
pkgrel=4
epoch=
pkgdesc="Obfuscate UDP traffic to hide from deep packet inspection"
arch=('x86_64' 'aarch64')
url="https://github.com/RoliSoft/${_pkgname}"
license=('BSD')
groups=()
depends=('libpcap' 'libssl.so=3' 'libcrypto.so=3' 'glibc')
makedepends=('git' 'gcc' 'make' 'go-md2man')
checkdepends=()
optdepends=()
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
replaces=()
backup=()
options=()
install=
changelog=
source=( git+${url}.git 'ctypes.patch' 'readme-to-manpage.patch' 'tcp_reuse.patch' )
noextract=()
sha256sums=('SKIP'
            '4eba65b38359124c8d8c6aa9c8b2e91b8b9bf8e6f77f7ca824eebb393e42dd3d'
            '1e531bbb3e0f10d98f9ab0ed318ffcead3e1e6f6fad973864e4e3eedaf88d313'
            'a3f70b1bacbdce7894f64662674e63986e106ed49e6d4f2747b930df4091ffc1')
validpgpkeys=()

builddir=${_pkgname}
prepare() {
    cd "$builddir"
    patch -p1 -i "$srcdir/ctypes.patch"
    patch -p1 -i "$srcdir/readme-to-manpage.patch"
    patch -p1 -i "$srcdir/tcp_reuse.patch"
}


build() {
    cd "$builddir"
	make
}

pkgver(){
	cd "$builddir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$builddir"
	install -D -m755 tunnel "${pkgdir}/usr/bin/${_pkgname,,}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/share/man/man1/"
    go-md2man -in README.md | gzip > "${pkgdir}/usr/share/man/man1/${_pkgname,,}.1.gz"
}

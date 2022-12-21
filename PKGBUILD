# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=wpunix
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="WordPerfect 8 for UNIX - Empower Your Application Server"
arch=("i386" "i686" "x86_64")
url="https://github.com/taviso/wpunix"
license=('unknown')
groups=()
depends=("lib32-ncurses")
makedepends=('cpio' 'gcc' 'binutils' 'xz' 'patchelf' 'rpmextract')
checkdepends=()
optdepends=()
provides=('wp')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}::git+https://github.com/taviso/wpunix.git"
        "https://archive.org/download/corel-wpunix-8/COREL_WPUNIX_1.iso"
        "https://archive.download.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/libc-5.3.12-27.i386.rpm"
        "https://archive.download.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS/glibc-2.0.7-29.i386.rpm"
        "arch-rpmextract.patch"
)
noextract=(
    'COREL_WPUNIX_1.iso'
)
md5sums=(
    'SKIP'
    '036d10f279aecc61704b214e7bd58a6d'
    '914d5d1a67a5a38971a0ff39fbbf6a42'
    'fc800085ce2c253660886a10efc1aed1'
    'c06660a90d039890407036de3fd50ece'
    )
validpgpkeys=()

prepare() {
    
    cp COREL_WPUNIX_1.iso "$pkgname"/

    cp glibc-2.0.7-29.i386.rpm libc-5.3.12-27.i386.rpm "$pkgname"/
    git -C "$pkgname" apply -v "$srcdir"/*patch
}

build() {
    cd "$pkgname"
    make clean
    make intercept/libdisasm.a # Oddly, build fails if this is not built first
    make wordperfect8_i386
}


package() {
	cd "$pkgname"
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/opt"
    install -m755 "${srcdir}"/"${pkgname}/wordperfect8_i386/usr/bin/wp" "${pkgdir}/usr/bin/wp"
    mv "${srcdir}"/"${pkgname}/wordperfect8_i386/opt/wp80" "${pkgdir}/opt/"
}

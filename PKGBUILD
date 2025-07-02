# Maintainer: xiliuya <xiliuya@aliyun.com>

pkgname=ntloader-git
pkgver=3.0.6.r0.gec501ba
pkgrel=1
pkgdesc="Windows NT6+ loader for grub2 and grub4dos."
arch=('x86_64')
url="https://github.com/grub4dos/ntloader.git"
license=('GPLv2+')
makedepends=('git' 'gcc' 'binutils' 'zlib' 'make' 'mingw-w64-gcc' 'aarch64-linux-gnu-gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!strip !buildflags)
source=("$pkgname::git+$url" install.sh gcc15.patch)
sha256sums=('SKIP' 
            '4449abfd66efeac3d8ce87d1fed95ef8da165f19e67a7dea01a64f3bc8719b05'
            '8ca705e6ef0be7dd431edbb6a29c1d82fbf389fd7fa434e1c4a417efb19933fe')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    echo $(pwd)
	cd "$pkgname"
    echo "applay patch"
    git apply ../gcc15.patch
    echo "Build NTloader"
    make 
    # We need mingw-w64-gcc depend for build
    echo "Build fsuuid.exe"
    make fsuuid.exe
    echo "Make Rootfs"
    cd utils/rootfs
    find * | cpio -o -H newc > ../initrd.cpio
}

package() {
    echo $(pwd)
    mkdir -p "$pkgdir/opt/${pkgname%-git}/"
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/utils/initrd.cpio 
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/ntloader
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/ntloader.i386 
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/ntloader.arm64
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/fsuuid.exe
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/README.md 
	install -vt "$pkgdir/opt/${pkgname%-git}/"  ${pkgname}/LICENSE
    install -Dm755 "install.sh" "${pkgdir}/opt/${pkgname%-git}/ntloader-install"
}

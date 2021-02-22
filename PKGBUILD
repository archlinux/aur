# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
pkgname=super-slomo-git
_pkgname=super-slomo
pkgver=r65.2ebebc7
pkgrel=1
license=('MIT')
pkgdesc='PyTorch implementation of "Super SloMo: High Quality Estimation of Multiple Intermediate Frames for Video Interpolation"'
depends=("python-torchvision")
arch=("x86_64")
url='https://github.com/avinashpaliwal/Super-SloMo'
source=("$pkgname::git+https://github.com/aviallon/Super-SloMo.git#branch=dev"
        "https://ftp.lesviallon.fr/other/SuperSloMo.ckpt"
        "super-slomo")
sha256sums=('SKIP'
            '1931f099a99e5e65a563f9b3aae0e04b6d87d09a0c85be1f761185c6bc67506e'
            'f8d6878dd33fd37cdb0748a1d556de307f4e9b3469af722c6ab7997d63cfaaaa')


pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "$srcdir/$pkgname"

    for patch in $(cd $srcdir && ls *.patch); do
        patch --verbose -p1 < "$srcdir/$patch"
    done
}
            
package() {
	cd "$pkgname"

	install -v -Dm644 "$srcdir/SuperSloMo.ckpt" "$pkgdir"/usr/share/"$_pkgname"/model/SuperSloMo.ckpt
	
	for file in "$srcdir/$pkgname/"*.py; do
        install -v -Dm644 "$file" "$pkgdir"/usr/share/"$_pkgname"/
    done
	
	install -v -Dm755 "$srcdir/super-slomo" "$pkgdir"/usr/bin/super-slomo
}

# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>

pkgname=modex-git
pkgver=r5.e6319f5
pkgrel=1
arch=(x86_64)
pkgdesc="A model extractor for the Spin model checker"
url="http://spinroot.com/modex"
license=(custom)
depends=(glibc sh)
makedepends=(git)
source=(git+https://github.com/nimble-code/Modex.git)
sha512sums=(SKIP)

pkgver() {
    cd Modex
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd Modex
    # Enable -O3 and full RELRO
    sed -i 's/CFLAGS = -g/CFLAGS = -O3 -Wl,-z,now/' Src/makefile
    # Use CFLAGS when building final binary
    sed -i 's/$(CC) -o modex/$(CC) $(CFLAGS) -o modex/' Src/makefile
    # Adjust path for defaults.lut
    sed -i 's/"\/usr\/local\/modex\/defaults.lut"/"\/usr\/share\/modex\/defaults.lut"/' Src/xtract.c
}

build() {
    cd Modex
    make
}

package() {
    install -Dm755 "$srcdir/Modex/Src/modex" "$pkgdir/usr/bin/modex"
    install -Dm755 "$srcdir/Modex/Scripts/verify" "$pkgdir/usr/bin/verify"

    install -Dm644 "$srcdir/Modex/Src/defaults.lut" "$pkgdir/usr/share/modex/defaults.lut"

    install -Dm644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/modex-git/LICENSE"
}

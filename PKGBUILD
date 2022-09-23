# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot com>
pkgname=dwuck4
pkgver=1.0
pkgrel=1
pkgdesc="Coupled reaction channels calculations"
arch=(i686 x86_64)
url=https://www.oecd-nea.org/tools/abstract/detail/nesc9872
license=(GPL3)
makedepends=(gcc5)
source=(
    "git+https://github.com/padsley/DWUCK4.git"
    dwuck4
)
sha256sums=(
    SKIP
    'ab5c76405d5b52d6dce9185e1144f7b4737c6063e1de26823ecc1106d94e3651'
)

#pkgver() {
#  cd "$srcname"
#git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
    cd "$srcdir/DWUCK4"
    #./CompileAndTest.sh
    /usr/bin/x86_64-pc-linux-gnu-gfortran-5 --std=legacy -c *.FOR
    /usr/bin/x86_64-pc-linux-gnu-gfortran-5 -c DW4UNIX.F
    cd "$srcdir/DWUCK4/culib4"
    /usr/bin/x86_64-pc-linux-gnu-gfortran-5 --std=legacy -c *.FOR
    cd "$srcdir/DWUCK4/culib8"
    /usr/bin/x86_64-pc-linux-gnu-gfortran-5 --std=legacy -c *.FOR
    cd "$srcdir/DWUCK4"
    /usr/bin/x86_64-pc-linux-gnu-gfortran-5 *.o culib8/*.o -o DWUCK4.exe
    #./DWUCK4.exe < DW4TST.DAT #TEST purposes only
    #diff -y output.txt DW4TST.LIS
}

package() {
    cd "$srcdir/DWUCK4"
    install -Dm755 DWUCK4.exe  "$pkgdir/usr/bin/DWUCK4.exe"
    install -Dm544 dw4_doc.pdf "$pkgdir/usr/share/dwuck4/dw4_doc.pdf"
    install -Dm644 DW4TST.LIS "$pkgdir/usr/share/dwuck4/DW4TST.LIS"
    install -Dm644 DW4TST.DAT "$pkgdir/usr/share/dwuck4/DW4TST.DAT"

    cd "$srcdir"
    install -Dm755 dwuck4 "$pkgdir/usr/bin/dwuck4"
    install -Dm755 dwuck4 "$pkgdir/usr/bin/DWUCK4"
}

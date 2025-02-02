# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=cisco-hash-sigs-static
_name=hash-sigs
_commit=c639af23e3f3801b20234908fe9cb5e2354d5173
pkgver=r56.c639af2
pkgrel=1
pkgdesc="A full-featured implementation of the LMS and HSS Hash Based Signature Schemes"
arch=(x86_64)
url=https://github.com/cisco/hash-sigs
license=(LicenseRef-Cisco)
makedepends=(
    git
    openssl
)
provides=(
    hss_lib.a
    hss_lib_thread.a
    hss_verify.a
)
source=($_name::git+$url#commit=$_commit)
b2sums=('e17b86d5d437ab4af70c670dcfedf9723172cd5d368ff801e0956274edbf66bebee0e85bf159dcf447c49a409e702e97b7ed0f8d79244a65abfbe38d7f892f2a')

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

#prepare() {
#    sed -i -e 's/USE\_OPENSSL 1/USE\_OPENSSL 0/' $_name/sha256.h
#}

build() {
    cd $_name
    make all
}

check () {
    cd $_name
    #./test_hss -full all
    ./test_hss all
}

package() {
    cd $_name
    install -d "$pkgdir"/usr/lib/ "$pkgdir"/usr/include/cisco-$_name
    install -vDm 644 {hss_lib,hss_lib_thread,hss_verify}.a "$pkgdir"/usr/lib/
    install -vDm 644 *.h "$pkgdir"/usr/include/cisco-$_name/
    install -vDm 644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

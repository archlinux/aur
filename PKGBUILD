# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=cisco-hash-sigs-static
_name=hash-sigs
_commit=b0631b8891295bf2929e68761205337b7c031726
pkgver=r51.b0631b8
pkgrel=2
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
b2sums=('b9446e9c881d5d580d8d605236b087d8927527aba2ea70d8d2270ae74bff8ee7ea6cf6648daf7077f4f8a95bd48ac93ab2781b6a624cc67260b180bbb5f9e66a')

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

# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

pkgname=slirp
pkgver=1.0.17
pkgrel=4
pkgdesc="SLIP/PPP emulator using a dial up shell account"
arch=('x86_64')
url="http://slirp.sourceforge.net/"
license=('custom')
options=(!strip)
_debianver="${pkgver}-11"
source=("${pkgname}-${pkgver}::https://deb.debian.org/debian/pool/main/s/slirp/slirp_${pkgver}.orig.tar.gz"
        "debian_${_debianver}.tar.xz::https://deb.debian.org/debian/pool/main/s/slirp/slirp_${_debianver}.debian.tar.xz")
sha256sums=('afe59cd298075aa1b9eba5a5f7cf720597372b8b81657de529b2cd35a2a2bc2e'
            '87cdecb2d9f77ac9ac851df1cab4a03abf370db730128072d321052d286620a7')

prepare() {
    cd "${pkgname}-${pkgver}"
    for f in $(cat ../debian/patches/series); do patch -p1 -i "../debian/patches/$f"; done
}

build() {
    cd "${pkgname}-${pkgver}/src"
    export CFLAGS="$CFLAGS -Wall -I. -DUSE_PPP -DUSE_MS_DNS -fno-strict-aliasing -Wno-unused -std=gnu89 -fcommon"
    export CFLAGS="$CFLAGS -DHAVE_STDLIB_H" # whoever can fix this, plz leave a comment
    export PPPCFLAGS="$CFLAGS"
    ./configure --prefix=/usr
    make CFLAGS="$CFLAGS -DFULL_BOLT" PPPCFLAGS="$PPPCFLAGS" clean all
}

package() {
    cd "${pkgname}-${pkgver}/src"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man1"
    install -m 0755 slirp "${pkgdir}/usr/bin/slirp"
    install -m 0644 slirp.man "${pkgdir}/usr/share/man/man1/slirp.1"
}

pkgname=argon2-git
_gitname="phc-winner-argon2"
pkgdesc="The password hash Argon2, winner of PHC"
pkgver=20171227.r0.g670229c
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("argon2")
provides=("argon2")
url="https://github.com/P-H-C/phc-winner-argon2"
license=('custom:CC-0')
depends=('glibc')
makedepends=('git')
source=('git://github.com/P-H-C/phc-winner-argon2.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "$_gitname"
    sed -i "/^#/d;s/\/@HOST_MULTIARCH@//g;s/@UPSTREAM_VER@/$pkgver/g" libargon2.pc
    sed -i '1d' libargon2.pc
}

build() {
    cd "$_gitname"
    make
}

check() {
    cd "$_gitname"
    make test
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 libargon2.pc $pkgdir/usr/lib/pkgconfig/libargon2.pc
}

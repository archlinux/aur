# Maintainer: Justin Coffman <jcoffman@techsecu.red>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net"
license=('GPL2')

depends=('openssl' 'pcre')

source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/tinyfugue/files/tinyfugue/5.0%20beta%208/tf-50b8.tar.gz/download")

sha256sums=('3750a114cf947b1e3d71cecbe258cb830c39f3186c369e368d4662de9c50d989')
sha384sums=('a870b8c570ba1b2ad7fba1c44a2273535a11a51e9395dbb8d2f0d659b742664ef3e93ddb7d72b98c42a267203284b715')
sha512sums=('3b99c039d7a9c6ab7ee7b1040ff7c99fe39cbe991f373333ea7c130d54383f102f14ae33303a415f5419cd43238caffc46114e842c6964329c0999e0f506e3d0')
b2sums=('3218878cdc4a2049fd7f2a8e0426ec589bf304e0bb24ad557e5bea39cbaba76e6a1c52f064860e499623abb51bc9f14a0c8388b927fd15a66a7945fe5eaccf84')

prepare() {
    mv "tf-50b8" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    for pf in "$startdir"/*.patch; do
        patch -V none -tp1 < "$pf"
    done
}

build() {
    export PATH="$(echo $PATH | sed -e 's:(:\\\(:g' -e 's:):\\\):g' -e 's: :\\\ :g')"
    cd "$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --enable-core \
        --enable-inet6 \
        --enable-ssl \
        --enable-atcp \
        --enable-gmcp \
        --enable-option102
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -D -p -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}

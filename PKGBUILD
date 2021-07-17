# Maintainer: Justin Coffman <jcoffman@itsecu.red>

pkgname=tf5
pkgver=5.0b8
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/tinyfugue/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

replaces=('tinyfugue')

source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/tinyfugue/files/tinyfugue/5.0%20beta%208/tf-50b8.tar.gz/download")

sha1sums=('37bb70bfb7b44d36c28606c6bd45e435502fb4b4')
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
    #export PATH="$(echo $PATH | sed -e 's:(:\\\(:g' -e 's:):\\\):g' -e 's: :\\\ :g')"
    cd "$pkgname-$pkgver"
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -D -p -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}

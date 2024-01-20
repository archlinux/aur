# Maintainer: Paul-Louis Ageneau <paul-louis at ageneau dot org>

pkgname=violet
pkgver=0.4.5
pkgrel=2
pkgdesc="Lightweight STUN/TURN server"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/paullouisageneau/$pkgname"
license=('GPL') # GPLv2 or any later version
makedepends=('git' 'cmake')
depends=('glibc' 'libjuice')
provides=()
conflicts=()
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
    true
}

build() {
    cd "$pkgname"
    rm -rf build
    cmake -B build -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_JUICE=1

    cmake --build build
}

package() {
    cd "$pkgname"
    install -m755 -d "$pkgdir"/usr/bin
    install -m755 build/"$pkgname" "$pkgdir"/usr/bin
    install -m755 -d "$pkgdir"/usr/lib/systemd/system
    install -m644 "$pkgname".service "$pkgdir"/usr/lib/systemd/system
    install -m755 -d "$pkgdir"/etc/violet
    install -m644 example.conf "$pkgdir"/etc/violet/violet.conf
    install -m755 -d "$pkgdir"/usr/lib/sysusers.d
    echo "u violet - \"Violet STUN/TURN server user\"" > "$pkgdir"/usr/lib/sysusers.d/violet.conf
}


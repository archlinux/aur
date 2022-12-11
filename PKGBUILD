# Maintainer: Paul-Louis Ageneau <paul-louis at ageneau dot org>

pkgname=violet
pkgver=0.4.3
pkgrel=1
pkgdesc="Lightweight STUN/TURN server"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/paullouisageneau/$pkgname"
license=('GPL') # GPLv2 or any later version
makedepends=('git' 'cmake')
depends=('libjuice')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/paullouisageneau/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    rm -rf build
    cmake -B build -DUSE_SYSTEM_JUICE=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cd build
    make
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
    echo "u violet - \"Violet STUM/TURN server user\"" > "$pkgdir"/usr/lib/sysusers.d/violet.conf
}


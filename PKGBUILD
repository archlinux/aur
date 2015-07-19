# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=hopper_update
url="https://github.com/Chipsterjulien/hopper_update"
pkgver=0.1
pkgrel=1
pkgdesc="If necessary, update your ip for hopper.pw"
arch=('any')
license=('WTFPL')
#backup=('etc/ip_update/hopper_update.conf')
makedepends=(go)
options=('!strip' 'emptydirs')
source=($pkgname-$pkgver.tar.gz)
install=hopper_update.install

_builddir="$pkgname-$pkgver"

build() {
    cd "$_builddir"

    go build hopper_update.go || return 1
}

package() {
    cd "$_builddir"

    # hopper_update.conf
    install -Dm644 "cfg/hopper_update_sample.json" \
        "$pkgdir"/etc/hopper_update/hopper_update_sample.json || return 1

    # Create log directory
    install -dm755 "$pkgdir"/var/log/$pkgname || return 1

    # hopper_update.[timer|target|service]
    install -Dm644 "cfg/hopper_update.timer" \
        "$pkgdir"/usr/lib/systemd/system/hopper_update.timer || return 1
    #install -Dm644 "cfg/hopper_update.target" \
    #    "$pkgdir"/usr/lib/systemd/system/hopper_update.target || return 1
    install -Dm644 "cfg/hopper_update.service" \
        "$pkgdir"/usr/lib/systemd/system/hopper_update.service || return 1

    # hopper_update binary
    install -m750 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname \
        "$pkgdir"/usr/bin/$pkgname || return 1
}
sha512sums=('c784c62c00faab0ad4fb1407bd553d6b92db96ce19a5f9507b2ba51f2002032513c1e926baff23a4e6c747f505684c1b33d4637d9b8561b62c3cf13ff226418a')

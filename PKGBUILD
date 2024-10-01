# Maintainer: Denis Benato <benato.denis96@gmail.com>

pkgname=frzr-git
pkgver=0.15.5.r2.g0eed95b
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux')
optdepends=(
    'dracut: generate initramfs for kernels installed via frzr kernel command'
)
source=(
    "$pkgname::git+https://github.com/chimeraos/frzr.git#branch=frzr-refactor"
    "99-frzr-kernel-install.hook"
)
md5sums=('SKIP'
         '6bc04b77f135f2bf7d07c2f8c0ffaca0')

prepare() {
    cd "$pkgname"
    git describe --tag --abbrev=0
    #git checkout $(git describe --tag --abbrev=0)
}
pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/lib/frzr"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/share/libalpm/hooks"
    PREFIX="$pkgdir" make install
    install -m 644 "$srcdir/99-frzr-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks"

    echo 'g frzr 379 - -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

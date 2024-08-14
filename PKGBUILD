# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.15.2.r0.gfd1cd3b
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
    'git+https://github.com/chimeraos/frzr.git'
    "99-frzr-kernel-install.hook"
)
md5sums=('SKIP'
         '6bc04b77f135f2bf7d07c2f8c0ffaca0')

prepare() {
    cd "$pkgname"
    git checkout $(git describe --tag --abbrev=0)
}
pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/frzr"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/share/libalpm/hooks"
    install -m 755 "$srcdir/frzr/frzr" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-deploy" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-deploy" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-unlock" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-unlock" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-bootloader" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-bootloader" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-kernel" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-kernel" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-version" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-version" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-bootstrap" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-bootstrap" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/__frzr-envars" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-source" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-extras" "$pkgdir/usr/bin"
    install -m 755 "$srcdir/frzr/frzr-release" "$pkgdir/usr/bin"
    #install -m 644 "$srcdir/frzr-$pkgver/mkinitcpio.conf" "$pkgdir/usr/lib/frzr"
    install -m 644 "$srcdir/frzr/frzr-autoupdate.service" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$srcdir/frzr/frzr-autoupdate.timer" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$srcdir/99-frzr-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks"

    echo 'g frzr 379 - -' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# Maintainer: Brad Arrington <bradla8@yahoo.com>
#
# HAMMER2 filesystem kernel module -- a port of DragonFly BSD's HAMMER2 to the
# ---------------------------------------------------------------------------

pkgname=hammer2
pkgver=r13.3fea709
pkgrel=1
pkgdesc="HAMMER2 filesystem kernel module (DragonFly BSD port), Linux 7.x only"
arch=('x86_64')
url="https://github.com/bradla/hammer2_cluster_linux7"
license=('BSD')
depends=('linux>=7' 'linux<8')
makedepends=('git' 'linux-headers')
optdepends=('hammer2-utils: newfs_hammer2, fsck_hammer2 and the hammer2 admin/cluster tool')
install=hammer2.install
source=("hammer2::git+https://github.com/bradla/hammer2_cluster_linux7.git")
sha256sums=('SKIP')

_kver() { uname -r; }   # or hardcode e.g. 7.0.1-arch1-1

pkgver() {
    cd "$srcdir/hammer2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/hammer2"
    make -C "/usr/lib/modules/$(_kver)/build" M="$PWD" modules
    make -C lh1
}

package() {
    cd "$srcdir/hammer2"

    # kernel module
    local _k; _k=$(_kver)
    local ko
    for ko in $(find . -maxdepth 1 -name '*.ko'); do
        install -Dm644 "$ko" "$pkgdir/usr/lib/modules/$_k/extramodules/$(basename "$ko")"
        zstd -19 --rm "$pkgdir/usr/lib/modules/$_k/extramodules/$(basename "$ko")"
    done
    sed "s/@KVER@/$_k/g" "$startdir/hammer2.install" > "$srcdir/hammer2.install.out"
    
    # userspace tools (lh1 Makefiles ignore DESTDIR, so install manually)
    local _t
    for _t in hammer2 newfs_hammer2 fsck_hammer2; do
        install -Dm755 "lh1/src/sbin/$_t/$_t" "$pkgdir/usr/bin/$_t"
    done

    # man pages, if any exist
    find lh1 -type f \( -name '*.5' -o -name '*.8' \) | while read -r _m; do
        install -Dm644 "$_m" "$pkgdir/usr/share/man/man${_m##*.}/$(basename "$_m")"
    done
    
    install -Dm644 lh1/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 lh1/CHANGES   "$pkgdir/usr/share/doc/$pkgname/CHANGES"
    install -Dm644 lh1/COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"

    sed -n '2,33p' hammer2_ccms.c > "$srcdir/LICENSE"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#package() {
#    local _k; _k=$(_kver)
#    cd "$srcdir/hammer2"

#    local ko
#    for ko in $(find . -name '*.ko'); do
#       install -Dm644 "$ko" "$pkgdir/usr/lib/modules/$_k/extramodules/$(basename "$ko")"
#        zstd -19 --rm "$pkgdir/usr/lib/modules/$_k/extramodules/$(basename "$ko")"
#    done

#    sed "s/@KVER@/$_k/g" "$startdir/hammer2.install" > "$srcdir/hammer2.install.out"

#    sed -n '2,33p' hammer2_ccms.c > "$srcdir/LICENSE"
#    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#}

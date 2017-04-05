# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=rlite-git
pkgver=r1985.6522969
pkgrel=1
pkgdesc="Recursive InterNetwork Architecture user/kernel prototype written in C."
arch=('any')
license=('GPL' 'LGPL')
depends=('linux' 'protobuf' 'python')
makedepends=('git' 'linux-headers' 'fakeroot')
install="rlite.install"
source=("rlite.install" "rlite.conf" "rlite.service" "git+https://github.com/vmaffione/rlite.git")
noextract=()
md5sums=("047aa5adec4c52ddbf86d12dbf300f71" "4bc1bc1402aeaca56fd22ab59dfa9fb6" "78bd22e673a5d3a5a0e62536758fce24" "SKIP")

_gitname="rlite"

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    RKVER=$(uname -r | sed 's|-.*||g')
    KMAJVER=$(echo "$RKVER" | sed 's|\.[0-9]\+$||g')
    msg "Building on kernel ${RKVER}..."

    cd "$srcdir/$_gitname"
    ./configure --prefix "$pkgdir" --libmodprefix /usr || exit 1
    make || exit 1
    msg "Build complete"
}

package() {
    make -C "$srcdir/$_gitname" install

    # Install other system files
    mkdir -p "$pkgdir/run/rlite"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/modules-load.d"
    cp $srcdir/$_gitname/archlinux/rlite.service "$pkgdir/usr/lib/systemd/system/"
    cp $srcdir/$_gitname/archlinux/rlite.conf "$pkgdir/etc/modules-load.d"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Klaus Voelker <kavaunix@proton.me>
pkgname=atrium
pkgver=0.3.0
pkgrel=1
pkgdesc="Wayland multiseat display manager"
arch=('x86_64')
url="https://github.com/kavau/atrium"
license=('GPL-2.0-or-later')
install=atrium.install

# Runtime dependencies.
depends=(
    'libsystemd'
    'pam'
    'gtk4'
    'cage'
)

# Build-only dependencies.  pkg-config is already in base-devel.
makedepends=('meson' 'ninja')

# Config files that pacman should not silently overwrite on upgrade.
# Paths are relative to / (no leading slash).
backup=(
    'etc/atrium.conf'
    'etc/atrium-greeter.conf'
    'etc/pam.d/atrium'
)

# The source tarball from the GitHub release.
# The ::URL syntax renames the downloaded file to $pkgname-$pkgver.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/kavau/atrium/archive/refs/tags/v$pkgver.tar.gz"
    "atrium.install"
)
sha256sums=(
    'b0728a225d89676841c32675739f86859b908df63fd820c194d5ff5ea5a9e160'
    'a16d8e75fa4297285d014a60a67af4b861bf2231db4f14eb51d0aa7f93653c92'
)

build() {
    cd "$pkgname-$pkgver"
    meson setup --wipe build \
        --prefix=/usr \
        --sysconfdir=/etc \
        --buildtype=release \
        -Ddist=arch
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build

    # Safety net: meson 1.11 was observed to skip conf files whose install_dir
    # comes from get_option('sysconfdir') when prefix=/usr and DESTDIR is set.
    # We currently install them via meson directly, but these lines guard
    # against regressions.
    # build/atrium.conf is the processed version of data/atrium.conf.in
    install -Dm644 build/atrium.conf \
        "$pkgdir/etc/atrium.conf"
    install -Dm644 data/atrium-greeter.conf \
        "$pkgdir/etc/atrium-greeter.conf"
}

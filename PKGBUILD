# Maintainer: Klaus Voelker <kavaunix@proton.me>
pkgname=atrium
pkgver=0.4.0
pkgrel=1
pkgdesc="Wayland multiseat display manager"
arch=('x86_64')
url="https://github.com/kavau/atrium"
license=('GPL-2.0-or-later')

# Runtime dependencies.
depends=(
    'libsystemd'
    'pam'
    'gtk4'
    'cage'
)

# Build-only dependencies (pkg-config is already in base-devel).
makedepends=('meson' 'ninja')

# Config files that pacman should not silently overwrite on upgrade.
# Paths are relative to / (no leading slash).
backup=(
    'etc/atrium.conf'
    'etc/atrium-greeter.conf'
    'etc/pam.d/atrium'
)

# Post-install script (only prints post-installation instructions).
install=atrium.install

# The source tarball from the GitHub release.
# The ::URL syntax renames the downloaded file to $pkgname-$pkgver.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/kavau/atrium/archive/refs/tags/v$pkgver.tar.gz"
    "atrium.install"
)
sha256sums=('b854423bb46142ccda6f419aab6530eb2b1e48e074b097f9f8eab40ae205765d'
            'a21c5a87f112a673c3338ade5732be4cde908c9c7ef7a851d52c517abaf8faf1')

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

# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=singularity-ce
pkgver=4.2.1
pkgrel=1
pkgdesc='An open source container platform designed to be simple, fast, and secure.'
arch=(x86_64)
url='https://github.com/sylabs/singularity'
license=('GPL2')
backup=(
    'etc/singularity/capability.json'
    'etc/singularity/ecl.toml'
    'etc/singularity/global-pgp-public'
    'etc/singularity/nvliblist.conf'
    'etc/singularity/remote.yaml'
    'etc/singularity/rocmliblist.conf'
    'etc/singularity/singularity.conf'
    'etc/singularity/cgroups/cgroups.toml'
    'etc/singularity/network/00_bridge.conflist'
    'etc/singularity/network/10_ptp.conflist'
    'etc/singularity/network/20_ipvlan.conflist'
    'etc/singularity/network/30_macvlan.conflist'
    'etc/singularity/network/40_fakeroot.conflist'
    'etc/singularity/seccomp-profiles/default.json'
)
depends=('cryptsetup' 'go>=1.21' 'libseccomp' 'squashfs-tools>=4.3')
makedepends=('fuse3' 'git')
optdepends=('libnvidia-container-tools: use nvidia-container-cli for GPU setup (experimental)')
provides=('singularity-container')
conflicts=('singularity-container')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'tmpfiles.conf')
b2sums=('57f1e8b16ded5f3303c436c7e4206c1428ed8bf4768e8b69e936bc7596932fc28d6daa3f7b8e2c7dd3c3c3c19a220eb100990267d94623828c24d790fa927bec'
        '97226e92c3ae887c4e33561fddf60887c395b02a8aee11be78c28fc909df597ed806dd11cdbde00b22452ddeeff04f1ed94d45bb5330b1b38449f6f829f42385')

build() {
    cd $pkgname-$pkgver

    export CGO_ENABLED="1"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # libexecdir is recommended here https://wiki.archlinux.org/title/Arch_package_guidelines#Package_etiquette
    ./mconfig                      \
        -V $pkgver                 \
        -P release-stripped        \
        --prefix="/usr"            \
        --libexecdir="/usr/lib"    \
        --sysconfdir="/etc"        \
        --localstatedir="/var/lib"
    make -C builddir
}

package() {
    cd $pkgname-$pkgver
    make -C builddir DESTDIR="$pkgdir/" install

    # let systemd-tmpfiles generate state directory
    rm -rf "$pkgdir/var"
    install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

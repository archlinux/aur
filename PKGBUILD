# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=singularity-ce
pkgver=3.11.0
pkgrel=2
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
depends=('cryptsetup' 'go>=1.17' 'libseccomp' 'squashfs-tools>=4.3')
makedepends=('git')
provides=('singularity-container')
conflicts=('singularity-container')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        'tmpfiles.conf')
b2sums=('52ee19e1fa768d93567cc93cf8bc2a0de60f683436b2dafcc389de7ad96e36d414996ad8def68023855f186d0d1d095cc59d3da6daaba4ae608bb79868d6ff71'
        '4d4386ca622fdf5f7c9ac23fd8dd5b18592b27b246478f3755262aceb758e52f1a9ff5d63ef76701b31fd6b7d91ef3978d9a35bc14e6478baee08add6a404891')

prepare() {
  cd $pkgname-$pkgver

  # fix bash completion path
  sed -e "s|/etc/bash_completion.d|/usr/share/bash-completion/completions|" \
      -e "s|\$(SYSCONFDIR)/bash_completion.d|/usr/share/bash-completion/completions|" \
      -i  mlocal/frags/build_cli.mk
}

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # libexecdir is recommended here https://wiki.archlinux.org/title/Arch_package_guidelines#Package_etiquette
    ./mconfig \
        -V $pkgver \
        -P release-stripped \
        --prefix="/usr" \
        --libexecdir="/usr/lib" \
        --sysconfdir="/etc" \
        --localstatedir="/var/lib" \
        --reproducible

    make -C builddir
}

package() {
    cd $pkgname-$pkgver
    make -C builddir DESTDIR="$pkgdir/" install

    # let systemd-tmpfiles generate state directory
    rm -rf "$pkgdir/var"
    install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

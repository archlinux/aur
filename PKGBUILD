# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=ts-warp-git
pkgver=1.5.12.r6.gff90081
pkgrel=1
pkgdesc="Transparent proxy server and traffic wrapper (SOCKS4/5, HTTP) with GUI frontend"
arch=("x86_64")
url="https://github.com/mezantrop/ts-warp"
license=("BSD-2-Clause")
depends=("glibc")
optdepends=("tk: gui-warp.py frontend" "iptables: transparent redirection" "nftables: transparent redirection")
backup=("etc/ts-warp.ini" "etc/gui-warp.ini" "etc/ts-warp_iptables.sh" "etc/ts-warp_nftables.sh")
makedepends=("git" "gcc")
provides=("ts-warp")
conflicts=("ts-warp")
source=("${pkgname}::git+https://github.com/mezantrop/ts-warp")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${pkgname}"
    # Upstream derives every path from PREFIX (config under $PREFIX/etc, etc.).
    # Keep binaries and data under /usr, but use the FHS locations for state/config.
    sed -i \
        -e 's|PREFIX"/etc/|"/etc/|' \
        -e 's|PREFIX"/var/run/|"/run/|' \
        -e 's|PREFIX"/var/|"/var/|' \
        ts-warp.h
    sed -i \
        -e 's|\$tswarp_prefix/etc|/etc|g' \
        -e 's|"\$tswarp_prefix"/etc|/etc|g' \
        -e 's|\$tswarp_prefix/var/run|/run|g' \
        -e 's|\$tswarp_prefix/var|/var|g' \
        ts-warp.sh.in ts-warp_autofw.sh.in
    sed -i \
        -e "s|prefix + '/etc|'/etc|g" \
        -e "s|prefix + '/var/run|'/run|g" \
        -e "s|prefix + '/var|'/var|g" \
        -e "s|prefix + ('/etc|('/etc|" \
        -e "s|'/usr/local/var/run/|'/run/|" \
        -e "s|'/usr/local/etc/|'/etc/|" \
        -e "s|'/usr/local/var/|'/var/|" \
        gui/gui-warp.py.in
    # The GUI ini paths are relative to prefix, which would undo the above
    sed -i -E 's/^(prefix|runcmd|inifile|logfile|pidfile|actfile) *=/# \0/' gui/gui-warp.ini.in
}

build() {
    cd "${pkgname}"
    PREFIX=/usr ./configure
    make
    make -C gui PREFIX=/usr
}

package() {
    cd "${pkgname}"
    make install PREFIX="$pkgdir/usr" USER="$(id -un)"
    make -C gui install PREFIX="$pkgdir/usr"

    # Upstream has no DESTDIR support: strip the staging path baked into scripts
    grep -rIl --null -F "$pkgdir" "$pkgdir" | xargs -0 -r sed -i "s|$pkgdir||g"

    # Relocate to Arch standard locations
    if [ -d "$pkgdir/usr/lib64" ]; then
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
    fi
    if [ -d "$pkgdir/usr/etc" ]; then
        mv "$pkgdir/usr/etc" "$pkgdir/etc"
    fi
    # /run is provided by the system; keep only the spool directory
    install -d "$pkgdir/var/spool"
    mv "$pkgdir/usr/var/spool/ts-warp" "$pkgdir/var/spool/ts-warp"
    rm -rf "$pkgdir/usr/var"
    if [ -d "$pkgdir/usr/man" ]; then
        install -d "$pkgdir/usr/share"
        mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
    fi
}

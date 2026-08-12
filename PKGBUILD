# Maintainer: Taesoo Park <tasoo1118@gmail.com>

# Disclaimer: While this PKGBUILD is tested on multiple devices, it is fully vibe-coded.

pkgname=chrony-git
pkgver=4.9.pre1.r0.gd77973e
pkgrel=1
pkgdesc="Lightweight NTP client and server (git version)"
arch=('x86_64')
url="https://gitlab.com/chrony/chrony.git"
license=('GPL-2.0-only')
depends=(
    'glibc'
    'gnutls'
    'nettle'
    'libcap'
    'libseccomp'
    'libedit'
)
makedepends=(
    'git'
    'asciidoctor'
)
provides=('chrony')
conflicts=('chrony')
install=chrony-git.install
backup=(
    'etc/chrony.conf'
)
source=(
    "chrony::git+https://gitlab.com/chrony/chrony.git#branch=master"
    "chrony.conf"
)
sha256sums=(
    'SKIP'
    '1e8a74a2f8298c2cb3da8d7d9e47b7246317e5a13b5e4c553941bcd3311600b6'
)

pkgver() {
    cd chrony
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd chrony
    git fetch --all --tags || true
    branch=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    git reset --hard "origin/$branch"
}

build() {
    cd chrony
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --chronyrundir=/run/chrony \
        --with-pidfile=/run/chrony/chronyd.pid \
        --with-user=chrony \
        --enable-scfilter
    make
}

package() {
    cd chrony
    make DESTDIR="$pkgdir" install

    # Install config file
    install -Dm644 "$srcdir/chrony.conf" "$pkgdir/etc/chrony.conf"

    # Install systemd service files
    install -Dm644 examples/chronyd.service "$pkgdir/usr/lib/systemd/system/chronyd.service"
    install -Dm644 examples/chrony-wait.service "$pkgdir/usr/lib/systemd/system/chrony-wait.service"

    # Install tmpfiles.d for /run/chrony
    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    echo 'd /run/chrony 0750 chrony chrony -' > "$pkgdir/usr/lib/tmpfiles.d/chrony.conf"

    # Install sysusers.d for chrony user
    install -dm755 "$pkgdir/usr/lib/sysusers.d"
    echo 'u chrony - "chrony daemon" /var/lib/chrony' > "$pkgdir/usr/lib/sysusers.d/chrony.conf"

    # Create state directory
    install -dm750 -o 124 -g 124 "$pkgdir/var/lib/chrony"

    # Install documentation
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 FAQ "$pkgdir/usr/share/doc/$pkgname/FAQ" 2>/dev/null || true
}

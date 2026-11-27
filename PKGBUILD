# Maintainer: koh11235813 <me at k13a dot org>
pkgname=cefore
pkgver=0.12.1
pkgrel=1
pkgdesc="ICN platform using CCNx-1.0 messages (RFC8569/RFC8609)"
url="https://github.com/cefore/cefore"
install=cefore.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/cefore/cefore/archive/refs/tags/v$pkgver.tar.gz"
        "cefore-fix-destdir.patch")
arch=('x86_64')
license=('BSD-3-Clause')
depends=('openssl')
backup=('etc/cefore/cefnetd.conf'
        'etc/cefore/cefnetd.fib'
        'etc/cefore/csmgrd.conf'
        'etc/cefore/plugin.conf'
        'etc/cefore/conpubd.conf')
sha256sums=('b5a2fcad6e3f634df0f383b1c72432301330db6a47d64be2e6c0caade1726b7e'
            '0d9a3f73a6b8bd5418a58c47a5353a8055a3789a8ed226a6e472588bd0439a07')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Upstream's install rules misuse DESTDIR and hard-code /usr/local/cefore.
    # The patch makes the install rules honour DESTDIR, relocates the runtime
    # configuration directory to /etc/cefore, and replaces the /usr/local
    # paths in the sources and helper scripts.
    patch -Np1 -i "$srcdir/cefore-fix-destdir.patch"
    autoreconf -fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --enable-cache \
        --enable-csmgr \
        --enable-conpub

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    # Ship the sysctl tuning as an example instead of applying it
    # system-wide; cefore.install tells the user how to enable it.
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/etc/sysctl.d/88-cefore.conf"
    rm -r "$pkgdir/etc/sysctl.d"

    # Upstream installs one shared key pair (and the ccninfo runtime keys)
    # for every user.  Never ship those from a package; cefore.install tells
    # the user how to generate a unique pair.
    rm -f "$pkgdir/etc/cefore/default-private-key" \
          "$pkgdir/etc/cefore/default-public-key" \
          "$pkgdir/etc/cefore/.ccninfo/ccninfo_rt-private-key" \
          "$pkgdir/etc/cefore/.ccninfo/ccninfo_rt-public-key"
    rmdir --ignore-fail-on-non-empty "$pkgdir/etc/cefore/.ccninfo" 2>/dev/null || true

    # Upstream's install-exec-hook marks the control tools setuid+setgid;
    # packages must not ship either bit.
    find "$pkgdir/usr" -type f -perm /6000 -exec chmod u-s,g-s {} +

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

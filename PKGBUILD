# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Nathan Owens <ndowens@artixlinux.org>
# Contributor: William Vigolo da Silva <william@williamvds.me>
# Contributor: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit-consolekit
pkgver=128
pkgrel=1
pkgdesc="PolicyKit with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('LGPL-2.0-or-later')
url="https://github.com/polkit-org/polkit"
depends=('glib2' 'pam' 'expat' 'duktape')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'glib2-devel')
provides=(
    polkit=$pkgver
    libpolkit-{agent,gobject}-1.so
)
conflicts=('polkit')
options=('!libtool')
source=($url/archive/refs/tags/$pkgver.tar.gz
        polkit.conf
        99-consolekit.rules
        patch-src_polkitbackend_polkitbackendsessionmonitor.diff
        patch-src_polkit_polkitunixsession.diff)
sha256sums=('6edb06bf1448e49e428f9597a97af6a05d62146dd0b58f86eeaebcee3f5ecfaa'
            'f12f590cf5ad621710f75a40b5af88e186d3a0a17d682a8bbe03b833525a3a39'
            'c7f887e1a8429106b43e8e81849c731e18b3055ef5e9ce0d44706ec23e9ef99e'
            'fb4d33d08547ad412bbb900463fb984147114b3a62b4336be65262b327da5bd8'
            '582f0f072bc586020cae2d673dce9ec6dd43e30b348f0352dd102583ced6e333')

prepare() {
  patch ${srcdir}"/polkit-${pkgver}/src/polkitbackend/polkitbackendsessionmonitor.c" "patch-src_polkitbackend_polkitbackendsessionmonitor.diff"
  patch ${srcdir}"/polkit-${pkgver}/src/polkit/polkitunixsession.c" "patch-src_polkit_polkitunixsession.diff"
}
build() {
  meson polkit-$pkgver build -D systemdsystemunitdir=foo \
      -D session_tracking=ConsoleKit
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

    install -Dm644 "${srcdir}"/build/src/polkitbackend/50-default.rules \
        "${pkgdir}"/etc/polkit-1/rules.d

    install -Dm644 "${srcdir}"/polkit.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -m0644 "${srcdir}"/99-consolekit.rules "${pkgdir}"/etc/polkit-1/rules.d
    # workaround the unit enforcement, atm can't be disabled, needs patching
    rm -rf "${pkgdir}"/usr/foo
}

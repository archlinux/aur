# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Nathan Owens <ndowens@artixlinux.org>
# Contributor: William Vigolo da Silva <william@williamvds.me>
# Contributor: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit-consolekit
pkgver=126
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
        99-consolekit.rules)
sha256sums=('2814a7281989f6baa9e57bd33bbc5e148827e2721ccef22aaf28ab2b376068e8'
            'f12f590cf5ad621710f75a40b5af88e186d3a0a17d682a8bbe03b833525a3a39'
            'c7f887e1a8429106b43e8e81849c731e18b3055ef5e9ce0d44706ec23e9ef99e')

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

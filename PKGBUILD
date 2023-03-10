# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Nathan Owens <ndowens@artixlinux.org>
# Contributor: William Vigolo da Silva <william@williamvds.me>
# Contributor: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit-consolekit
pkgver=122
pkgrel=2
pkgdesc="PolicyKit with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://gitlab.freedesktop.org/polkit/polkit"
depends=('glib2' 'pam' 'expat' 'js78' 'duktape')
makedepends=('meson' 'gtk-doc' 'gobject-introspection')
provides=(
    polkit=$pkgver
    libpolkit-{agent,gobject}-1.so
)
conflicts=('polkit')
options=('!libtool')
source=(https://gitlab.freedesktop.org/polkit/polkit/-/archive/$pkgver/polkit-$pkgver.tar.gz
        polkit.conf
        99-consolekit.rules)
sha256sums=('0d69656d60800835c3d7d1f0a8362b32e1ae3ace2875a35bb624296fc52d5dc4'
           'f12f590cf5ad621710f75a40b5af88e186d3a0a17d682a8bbe03b833525a3a39'
           'c7f887e1a8429106b43e8e81849c731e18b3055ef5e9ce0d44706ec23e9ef99e')

build() {
  meson polkit-$pkgver build -D systemdsystemunitdir=foo \
      -D session_tracking=ConsoleKit
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

    install -Dm644 "${srcdir}"/polkit-$pkgver/src/polkitbackend/50-default.rules \
        "${pkgdir}"/etc/polkit-1/rules.d

    install -Dm644 "${srcdir}"/polkit.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -m0644 "${srcdir}"/99-consolekit.rules "${pkgdir}"/etc/polkit-1/rules.d
    # workaround the unit enforcement, atm can't be disabled, needs patching
    rm -rf "${pkgdir}"/usr/foo
}

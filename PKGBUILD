# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: Nathan Owens <ndowens@artixlinux.org>
# Contributor: William Vigolo da Silva <william@williamvds.me>
# Contributor: kozec <kozec at kozec.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit-consolekit
pkgver=121
pkgrel=1
pkgdesc="PolicyKit with ConsoleKit support for non-systemd systems"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://gitlab.freedesktop.org/polkit/polkit"
depends=('glib2' 'pam' 'expat' 'js78' 'duktape')
makedepends=('meson' 'gtk-doc' 'gobject-introspection')
provides=("polkit=$pkgver")
conflicts=('polkit')
options=('!libtool')
source=(http://www.freedesktop.org/software/polkit/releases/polkit-$pkgver.tar.gz
        polkit.conf
        99-default.rules)
sha256sums=('9dc7ae341a797c994a5a36da21963f0c5c8e3e5a1780ccc2a5f52e7be01affaa'
           'f12f590cf5ad621710f75a40b5af88e186d3a0a17d682a8bbe03b833525a3a39'
           'c7f887e1a8429106b43e8e81849c731e18b3055ef5e9ce0d44706ec23e9ef99e')

build() {
  meson polkit-v.$pkgver build -D systemdsystemunitdir=foo \
      -D session_tracking=ConsoleKit
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

    install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
    mv "$pkgdir"/{etc,usr/share}/polkit-1/rules.d/50-default.rules

    install -Dm644 "${srcdir}"/polkit.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -m0644 "${srcdir}"/99-default.rules "${pkgdir}"/etc/polkit-1/rules.d
    # workaround the unit enforcement, atm can't be disabled, needs patching
    rm -rf "${pkgdir}"/usr/foo
}

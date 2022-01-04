# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgdesc="A flat theme with transparent elements for GTK 2,3,4 and Gnome-Shell"
pkgver=20220102
pkgrel=1
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/jnsh/arc-theme/issues/18
url="https://github.com/jnsh/arc-theme"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('meson>=0.53.0' 'sassc' 'glib2' 'gdk-pixbuf2')

source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc"
        "fix.patch::https://github.com/jnsh/arc-theme/commit/0effc8f889718e941424d4b26e592aea2e68a2f8.patch")
sha512sums=('6d9f97a6adf3dd21a4ca74efc4548cee57058584b3b58c7324690a4c9a4bd383d36d61122dd65e897e690f54ecb95c03b2aead0b12bdd664a76fadb5357c0b27'
            'SKIP'
            '61420b5642a3024b049d356dd8471d92dd92134b12e1b4d7151d031359f0a939a1ecacdfa2c614c74e5c13c91441761bd87a330c509881d2b363cb6ecafb681b')
validpgpkeys=('31743CDF250EF641E57503E5FAEDBC4FB5AA3B17')

# Latest stable Arch package versions
_cinnamonver=5.0
_gnomeshellver=41
_gtk4ver=4.6

prepare() {
    cd ${_pkgname}-${pkgver}

    patch -p1 <"${srcdir}/fix.patch"
}

build() {
    cd ${_pkgname}-${pkgver}

    meson --prefix=/usr build \
      -Dgnome_shell_gresource=true \
      -Dcinnamon_version="${_cinnamonver}" \
      -Dgnome_shell_version="${_gnomeshellver}" \
      -Dgtk4_version="${_gtk4ver}"
    meson compile -C build

    meson --prefix=/usr build-solid \
      -Dtransparency=false \
      -Dgnome_shell_gresource=true \
      -Dcinnamon_version="${_cinnamonver}" \
      -Dgnome_shell_version="${_gnomeshellver}" \
      -Dgtk4_version="${_gtk4ver}"
    meson compile -C build-solid
}

package_arc-gtk-theme() {
    replaces=('gtk-theme-arc')

    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" meson install -C build
}

package_arc-solid-gtk-theme() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=('gtk-theme-arc-solid')

    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" meson install -C build-solid
}

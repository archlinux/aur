# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname="ganv"
pkgver=1.8.2
pkgrel=3
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=(
  'x86_64'
)
url="https://drobilla.net/software/ganv.html"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'cairo'
  'glib2'
  'glibc'
  'graphviz'
  'gtk2>=2.10.0'
  'gtkmm>=2.10.0'
  'libgcc'
  'libstdc++'
  'libsigc++'
  'pango'
)
makedepends=(
  'glib2-devel'
  'gobject-introspection'
  'meson>=0.56.0'
)
provides=(
  "lib${pkgname}-${pkgver%%.*}.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://download.drobilla.net/${_pkgsrc}.tar.xz"
  "https://download.drobilla.net/${_pkgsrc}.tar.xz.sig"
)
b2sums=('45e5370f3b94a7010f89943225748e40291583f7d2cc80f637f3db4fac3a03c9b58217bd8e8119f7867302c43846be47e928721addce68560c63cec5faa3b4d4'
        'SKIP')
validpgpkeys=(
  '907D226E7E13FA337F014A083672782A9BF368F3' # David Robillard <d@drobilla.net>
)

build() {
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    -D nls=disabled
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${meson_options[1]}"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

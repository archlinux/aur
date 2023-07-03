# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkg="gtk"
_pkgname="${_pkg}2"
_variant="maemo"
pkgname="${_pkgname}-${_variant}"
pkgver=2.24.33
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy)"
arch=(any)
url="https://www.${_pkg}.org/"
_ns="tallero"
_url="https://gitlab.gnome.org/${_ns}/${_pkg}"
depends=(
  atk
  cairo
  desktop-file-utils
  "${_pkg}-update-icon-cache"
  libcups
  librsvg
  libxcursor
  libxinerama
  libxrandr
  libxi
  libxcomposite
  libxdamage
  pango
  shared-mime-info
)
makedepends=(
  # git
  gobject-introspection
  "${_pkg}-doc"
  hicolor-icon-theme
)
optdepends=(
  'gnome-themes-standard: Default widget theme'
  'adwaita-icon-theme: Default icon theme'
  "python: ${_pkg}-builder-convert"
)
provides=(
  libgailutil.so
  libg{d,t}k-x11-2.0.so
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
license=(LGPL)
install="${_pkgname}.install"
_commit="ba8b5e7650e26e247488a26c71e82152faf319c2"
source=(
  # "${_pkgname}::git+${_url}.git#branch=${_variant}"
  "${_url}/-/archive/${_commit}/${_pkg}-${_commit}.tar.gz"
  "${_pkg}rc"
  "${_pkg}-query-immodules-2.0.hook"
  xid-collision-debug.patch
)
sha512sums=(
  'SKIP'
  'b124433dd4b20d1d62f073df87e253ca23b3b51625cce55f29a220a4369eda5108c0de07fdc686f570232322c3ff04f7758383f2be5aeace40f843907aa3696d'
  '5e99c5558bf48dc251134869c6310bd9e4bce3775a93547f62028fe32b415c18079da89fe46c85d80b54c4810732acbd6b88ec9946962d02fafc46ed7f672cf2'
  'c473ac89fab47cc79e912695aa7408c22c4bcd998e00f9b00d46374d4a961d41ffaa1f885bf2f9d9b68a401e16f64c617f0dfb058a98469dbe16beb37229b9bc'
)

prepare() {
  cd "${_pkg}-${_commit}"
  git apply -3 ../xid-collision-debug.patch
}

build() {
  local _configure_opts=(
    --build=$CBUILD
    --host=$CHOST
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-xinput=yes
  )

  cd "${_pkg}-${_commit}"

  ./autogen.sh
  ./configure "${_configure_opts[@]}"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${_pkg}-${_commit}"
  make DESTDIR="${pkgdir}" install

  install -Dt "${pkgdir}/usr/share/${_pkg}-2.0" \
          -m644 "../${_pkg}rc"
  install -Dt "${pkgdir}/usr/share/libalpm/hooks" \
          -m644 "../${_pkg}-query-immodules-2.0.hook"

  rm "${pkgdir}/usr/bin/${_pkg}-update-icon-cache"
  libtool --finish "${pkgdir}/usr/lib"
}

# vim:set et sw=2:

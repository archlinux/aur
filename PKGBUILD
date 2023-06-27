# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Co-Maintainer: xiota
# Contributor: David Garfias <jose.garfias@ingenieria.unam.edu>
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkg="vte"
_pkgname="${_pkg}-common"
pkgbase="${_pkg}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgname}-git"
  "${_pkg}-docs-git")
pkgver=0.73.0.r26.g092d8b8f
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h)
license=('LGPL')
url="https://gitlab.gnome.org/GNOME/${_pkg}"
depends=(sh)
makedepends=(
  fribidi
  gi-docgen
  git
  gnutls
  gobject-introspection
  gperf
  gtk3
  gtk4
  meson
  pcre2
  systemd
  vala
)
options=(
  !emptydirs
  !lto)
source=(
  "${_pkg}::git+${url}"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkg}"

  _version=$(
    grep -E "^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$" meson.build \
      | sed -E "s@^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$@\1@"
  )
  _commit=$(
    git log -S "${_version}" -1 --pretty=oneline | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count "${_commit}..HEAD"
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "${_version}.r${_revision}.g${_hash}"
}

prepare() {
  cd "${_pkg}"
}

build() {
  local meson_options=(
    -D b_lto=false
    -D docs=true
    -D gtk4=true
  )
  arch-meson "${_pkg}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#$pkgdir/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_vte-common-git() {
  pkgdesc+=" (common files)"
  provides+=("${_pkgname}=${pkgver}")
  conflicts+=("${_pkgname}")
  DESTDIR="${pkgdir}" ninja install -C build
  meson install -C build --destdir "${pkgdir}"
  cd "${pkgdir}"
  _pick gtk3 "usr/bin/${_pkg}-2.91"
  _pick gtk3 "usr/include/${_pkg}-2.91"
  _pick gtk3 "usr/lib/lib${_pkg}-2.91.so"*
  _pick gtk3 "usr/lib/pkgconfig/${_pkg}-2.91.pc"
  _pick gtk3 "usr/lib/girepository-1.0/Vte-2.91.typelib"
  _pick gtk3 "usr/share/gir-1.0/Vte-2.91.gir"
  _pick gtk3 "usr/share/glade"
  _pick gtk3 "usr/share/vala/vapi/${_pkg}-2.91."{deps,vapi}

  _pick gtk4 "usr/bin/${_pkg}-2.91-gtk4"
  _pick gtk4 "usr/include/${_pkg}-2.91-gtk4"
  _pick gtk4 "usr/lib/lib${_pkg}-2.91-gtk4.so"*
  _pick gtk4 "usr/lib/pkgconfig/${_pkg}-2.91-gtk4.pc"
  _pick gtk4 "usr/lib/girepository-1.0/Vte-3.91.typelib"
  _pick gtk4 "usr/share/gir-1.0/Vte-3.91.gir"
  _pick gtk4 "usr/share/vala/vapi/${_pkg}-2.91-gtk4."{deps,vapi}

  _pick docs usr/share/doc
}

package_vte-docs-git() {
  provides+=("${_pkg}-docs=${pkgver}")
  conflicts+=("${_pkg}-docs")
  pkgdesc+=" (documentation)"

  mv docs/* "$pkgdir"
}

package_vte-git() {
  pkgdesc+=" (metapackage)"
  depends+=("${_pkgname}-git"
            "${_pkg}3-git"
            "${_pkg}4-git"
            "${_pkg}-docs-git")
}

# vim:set sw=2 sts=-1 et:

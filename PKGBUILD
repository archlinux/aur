# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-git
pkgver=r103.d078343
pkgrel=1
epoch=1
pkgdesc="GTK4/Libadwaita Wayland clipboard manager with dynamic cursor-positioned overlay"
arch=("x86_64")
url="https://github.com/Sirulex/cursor-clip"
license=("GPL-3.0-or-later")
depends=("gtk4" "libadwaita" "gtk4-layer-shell")
makedepends=("git" "cargo" "rust" "pkgconf")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local rev
  local hash
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "r%s.%s" "${rev}" "${hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Optional: install desktop integration if upstream provides it
  if [[ -f "${_pkgname}.desktop" ]]; then
    install -Dm644 "${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  fi

  # Optional: AppStream metainfo (if present)
  shopt -s nullglob
  for f in *.metainfo.xml *.appdata.xml; do
    install -Dm644 "$f" "${pkgdir}/usr/share/metainfo/$(basename "$f")"
  done
  shopt -u nullglob
}

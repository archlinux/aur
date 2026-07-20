# Maintainer: Sirulex <aur.refined792@passmail.com>

_pkgname=cursor-clip
pkgname=${_pkgname}-git
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="GTK4/Libadwaita Wayland clipboard manager with dynamic cursor-positioned overlay"
arch=("x86_64" "aarch64")
url="https://github.com/Sirulex/cursor-clip"
license=("GPL-3.0-only")
depends=("gtk4" "libadwaita" "gtk4-layer-shell")
makedepends=("git" "cargo" "rust" "pkgconf")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local description
  if description="$(git describe --long --tags --match "v[0-9]*.[0-9]*.[0-9]*" --abbrev=7 2>/dev/null)"; then
    local tag commits hash
    IFS=- read -r tag commits hash <<< "${description}"
    tag="${tag#v}"

    if (( commits == 0 )); then
      printf "%s" "${tag}"
    else
      printf "%s.r%s.%s" "${tag}" "${commits}" "${hash}"
    fi
  else
    printf "0.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
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

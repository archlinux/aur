# Maintainer: teraflops <cprieto.ortiz@gmail.com>        
pkgname=gnome-shell-extension-eversolo-nowplaying-git
_pkgdesc='Extension for GNOME Shell to control and show now playing on Eversolo devices'
pkgver=r5.7ae86bd
pkgrel=1
pkgdesc="$_pkgdesc"
arch=(any)
url='https://gitlab.com/teraflops/eversolo-nowplaying'
license=(custom:unknown)
depends=(gnome-shell)
makedepends=(git glib2)
conflicts=(gnome-shell-extension-eversolo-nowplaying)
provides=(gnome-shell-extension-eversolo-nowplaying)
_uuid=eversolo-nowplaying@priet.us

source=("eversolo-nowplaying-src::git+${url}.git")
b2sums=('SKIP')
license=(MIT)

pkgver() {
  cd "${srcdir}/eversolo-nowplaying-src"
  # versión rolling: r<commits>.<hash-corto>
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  :
}

package() {
  cd "${srcdir}/eversolo-nowplaying-src"

  local ext_src="${PWD}/${_uuid}"
  local ext_dst="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  if [[ ! -d "${ext_src}" ]]; then
    echo "ERROR: no se encontró la carpeta ${_uuid} en el repo" >&2
    exit 1
  fi

  install -d "${ext_dst}"

  install -m644 "${ext_src}/metadata.json" "${ext_dst}/"
  [[ -f "${ext_src}/extension.js"    ]] && install -m644 "${ext_src}/extension.js"    "${ext_dst}/"
  [[ -f "${ext_src}/prefs.js"        ]] && install -m644 "${ext_src}/prefs.js"        "${ext_dst}/"
  [[ -f "${ext_src}/stylesheet.css"  ]] && install -m644 "${ext_src}/stylesheet.css"  "${ext_dst}/"
  [[ -f "${ext_src}/README.md"       ]] && install -m644 "${ext_src}/README.md"       "${ext_dst}/"
  [[ -f "${ext_src}/LICENSE"         ]] && install -m644 "${ext_src}/LICENSE"         "${ext_dst}/"

  if [[ -d "${ext_src}/schemas" ]]; then
    install -d "${ext_dst}/schemas"
    find "${ext_src}/schemas" -maxdepth 1 -type f -name "*.xml" -exec install -m644 {} "${ext_dst}/schemas/" \;
    glib-compile-schemas "${ext_dst}/schemas"
  fi

  if [[ -d "${ext_src}/locale" ]]; then
    find "${ext_src}/locale" -type f -name "*.mo" | while read -r mo; do
      local rel="${mo#${ext_src}/locale/}"   # es/LC_MESSAGES/foo.mo
      install -Dm644 "${mo}" "${pkgdir}/usr/share/locale/${rel}"
    done
  fi
}


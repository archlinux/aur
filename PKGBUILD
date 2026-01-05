# Maintainer: Stamby <stamblonnocorporation@hotmail.com>

_pkgname="simple-duplicate-finder"
pkgname="${_pkgname}-git"
pkgver=r203.g93cd923
pkgrel=1
pkgdesc="A program to find and delete duplicates, built on Python and GTK."
arch=('any')
url="https://github.com/moltenib/simple-duplicate-finder"
license=('GPL3')

depends=(
  'python'
  'gtk3'
  'python-gobject'
)
optdepends=(
  'xdg-utils: open files from the UI'
)
makedepends=(
  'git'
  'gettext'   # msgfmt for `make translations`
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make translations
}

package() {
  cd "${srcdir}/${_pkgname}"

  # App files (keep upstream relative layout working)
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a src resources "${pkgdir}/usr/lib/${_pkgname}/"

  # Launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/bash
exec python3 /usr/lib/simple-duplicate-finder/src/main.pyw "$@"
EOF

  # Desktop entry (patch Exec/Icon so it integrates nicely)
  install -Dm644 "resources/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  sed -i \
    -e "s|^Exec=.*|Exec=${_pkgname}|" \
    -e "s|^Icon=.*|Icon=${_pkgname}|" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icons (install both names: the patched one + upstream one for safety)
  install -Dm644 "resources/icons/app_icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "resources/icons/app_icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/app_icon.png"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


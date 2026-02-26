# Maintainer: Stamby <stamblonnocorporation@hotmail.com>

_pkgname='simple-mirror'
pkgname="${_pkgname}-git"
pkgver=r22.g55fa86d
pkgrel=1
pkgdesc='An rsync wrapper, built on C++ and Qt.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/moltenib/simple-mirror'
license=('GPL-3.0-only')

depends=(
  'qt6-base'
  'rsync'
)
makedepends=(
  'git'
  'make'
  'gcc'
  'pkgconf'
  'qt6-tools'
)
optdepends=(
  'hicolor-icon-theme: show application icon in desktop menus'
  'qt6-translations: localized Qt built-in dialogs and standard UI strings'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "git+${url}.git"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  cp -a resources "${pkgdir}/usr/lib/${_pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/bash
exec /usr/lib/simple-mirror/simple-mirror "$@"
EOF

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "resources/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

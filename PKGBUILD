# Maintainer: OpenSourceGuy <osguy@duck.com>
pkgname=brokkr-flash-appimage
pkgver=2.4.8.beta2
pkgrel=1
pkgdesc="Samsung device flashing utility (Odin alternative) — AppImage release"
arch=('x86_64' 'aarch64')
url="https://github.com/Gabriel2392/brokkr-flash"
license=('GPL-3.0-or-later')
depends=('glibc' 'zlib' 'libxcb' 'libx11' 'libglvnd' 'fontconfig' 'freetype2' 'libgpg-error')
makedepends=('squashfs-tools')
provides=('brokkr-flash')
conflicts=('brokkr-flash' 'brokkr-flash-git' 'brokkr-flash-bin')
options=('!strip' '!debug' '!emptydirs')
install=brokkr-flash-appimage.install
_upstream_tag=${pkgver/.beta/-beta}
source_x86_64=("https://github.com/Gabriel2392/brokkr-flash/releases/download/v${_upstream_tag}/Brokkr-${_upstream_tag}-linux-x86_64.AppImage")
source_aarch64=("https://github.com/Gabriel2392/brokkr-flash/releases/download/v${_upstream_tag}/Brokkr-${_upstream_tag}-linux-arm64.AppImage")
sha256sums_x86_64=('f912510ad80051718d5c217a53be3992c135448f1a25e6cf48e011a03ca62d4c')
sha256sums_aarch64=('42ebaa6e7a8ad533e2d78dfe2a38c239850c4bd776862db47e6784fe6963a091')

prepare() {
  local _appimg
  if [[ "${CARCH}" == "x86_64" ]]; then
    _appimg="Brokkr-${_upstream_tag}-linux-x86_64.AppImage"
  else
    _appimg="Brokkr-${_upstream_tag}-linux-arm64.AppImage"
  fi
  chmod +x "${srcdir}/${_appimg}"
}

build() {
  local _appimg
  if [[ "${CARCH}" == "x86_64" ]]; then
    _appimg="Brokkr-${_upstream_tag}-linux-x86_64.AppImage"
  else
    _appimg="Brokkr-${_upstream_tag}-linux-arm64.AppImage"
  fi
  cd "${srcdir}"

  if "./${_appimg}" --appimage-extract >/dev/null 2>&1; then
    mv squashfs-root squashfs-root-tmp
  else
    local _offset=""
    while IFS=: read -r _offset _; do
      if unsquashfs -f -d squashfs-root-tmp -o "${_offset}" "${_appimg}" >/dev/null 2>&1; then
        break
      fi
      _offset=""
    done < <(grep -abom 10 'hsqs' "${_appimg}")
    if [[ -z "${_offset}" ]]; then
      echo "ERROR: Could not extract AppImage: no valid squashfs superblock found" >&2
      return 1
    fi
  fi

  chmod -R go-w squashfs-root-tmp/
  find squashfs-root-tmp/ -type d -exec chmod 755 {} +
  find squashfs-root-tmp/ -type f -exec chmod 644 {} +
  find squashfs-root-tmp/ -type f \( -name '*.so*' -o -name '*.AppImage' -o -name 'brokkr' -o -name 'AppRun' \) -exec chmod 755 {} +
  mv squashfs-root-tmp squashfs-root
}

package() {
  local _squashroot="${srcdir}/squashfs-root"

  install -dm755 "${pkgdir}/opt/brokkr-flash"
  cp -a "${_squashroot}/." "${pkgdir}/opt/brokkr-flash/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/brokkr-flash" <<'EOF'
#!/bin/sh
export QT_QPA_PLATFORM=xcb
exec /opt/brokkr-flash/AppRun "$@"
EOF

  install -Dm644 "${srcdir}/../brokkr-flash.desktop" \
    "${pkgdir}/usr/share/applications/brokkr-flash.desktop"

  local _icon=""
  for f in "${_squashroot}/usr/share/icons/"*"/apps/"*.svg; do
    if [[ -f "$f" ]]; then
      _icon="$f"
      break
    fi
  done
  if [[ -n "${_icon}" ]]; then
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/brokkr-flash.svg"
  elif [[ -f "${_squashroot}/.DirIcon" ]]; then
    install -Dm644 "${_squashroot}/.DirIcon" "${pkgdir}/usr/share/pixmaps/brokkr-flash.png"
  elif [[ -f "${_squashroot}/brokkr.png" ]]; then
    install -Dm644 "${_squashroot}/brokkr.png" "${pkgdir}/usr/share/pixmaps/brokkr-flash.png"
  fi

  install -Dm644 "${srcdir}/../51-brokkr-samsung.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/51-brokkr-samsung.rules"

  if [[ -f "${_squashroot}/LICENSE" ]]; then
    install -Dm644 "${_squashroot}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

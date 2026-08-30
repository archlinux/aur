# Maintainer: Danilo Luvizotto <danilo.luvizotto@gmail.com>

_pkgname=lightning-matrix
pkgname=${_pkgname}-appimage
pkgver=0.8.3
pkgrel=1
pkgdesc='Native Qt 6 Matrix desktop client using the official Rust Matrix SDK (prebuilt AppImage)'
arch=('x86_64')
url='https://www.lightning-matrix.org/'
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

_appimage="Lightning-${pkgver}-${CARCH}.AppImage"
_sumfile="SHA256SUMS-${pkgver}"
_release_url="https://github.com/Mizerd/lightning/releases/download/v${pkgver}"

source_x86_64=(
  "${_appimage}::${_release_url}/${_appimage}"
  "${_sumfile}::${_release_url}/SHA256SUMS"
)
noextract=("${_appimage}")

sha256sums_x86_64=('320706878f53e1f5e11ee103e667eaa2d8e8e58c874171f74fc34d9e911bfb80'
                   'b9942d682011a1954c4cb11807cf7bec467f582621a778f5b58c2c177882a443')

prepare() {
  local expected

  expected="$(awk -v f="${_appimage}" '
    $2 == f || $2 == "*" f { print $1; exit }
  ' "${_sumfile}")"

  if [[ ! ${expected} =~ ^[[:xdigit:]]{64}$ ]]; then
    printf 'ERROR: Could not find a valid SHA-256 for %s in %s\n' \
      "${_appimage}" "${_sumfile}" >&2
    return 1
  fi

  printf '%s  %s\n' "${expected}" "${_appimage}" | sha256sum -c -

  chmod +x "${_appimage}"
  rm -rf squashfs-root
  "./${_appimage}" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${_appimage}" \
    "${pkgdir}/opt/${pkgname}/Lightning.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Lightning.AppImage" \
    "${pkgdir}/usr/bin/lightning"
  ln -s "/opt/${pkgname}/Lightning.AppImage" \
    "${pkgdir}/usr/bin/lightning-matrix"

  # Use the upstream desktop metadata, but point Exec at the AUR wrapper name
  # rather than the generic internal binary name `matrix-client`.
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/lightning.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Lightning
GenericName=Matrix Client
Comment=Native Qt Matrix chat client
Exec=lightning --backend=rust
Icon=lightning
Terminal=false
Categories=Network;Chat;InstantMessaging;
Keywords=Matrix;Chat;Messaging;
StartupNotify=true
StartupWMClass=matrix-client
DESKTOP

  # AppImages normally expose their application icon at the root. Fall back to
  # an icon shipped under usr/share if the release layout changes.
  local icon=''
  for candidate in \
    squashfs-root/lightning.svg \
    squashfs-root/lightning.png \
    squashfs-root/usr/share/icons/hicolor/scalable/apps/lightning.svg \
    squashfs-root/usr/share/pixmaps/lightning.png; do
    if [[ -f ${candidate} ]]; then
      icon=${candidate}
      break
    fi
  done

  if [[ -z ${icon} ]]; then
    icon="$(find squashfs-root -type f \
      \( -iname 'lightning.svg' -o -iname 'lightning.png' \) \
      -print -quit)"
  fi

  if [[ -n ${icon} ]]; then
    case ${icon##*.} in
      svg)
        install -Dm644 "${icon}" \
          "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lightning.svg"
        ;;
      png)
        install -Dm644 "${icon}" \
          "${pkgdir}/usr/share/pixmaps/lightning.png"
        ;;
    esac
  else
    printf 'WARNING: upstream AppImage contains no Lightning icon\n' >&2
  fi
}

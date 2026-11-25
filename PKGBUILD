# Maintainer: Dreamink0 <Dream_ink@qq.com>
pkgname=vrcs-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Real-time caption, translation, learning and AI tool for VRChat"
arch=('x86_64')
url="https://github.com/Dreaminko/VRCS"
license=('AGPL-3.0-only')
provides=('vrcs')
conflicts=('vrcs')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libpipewire'
  'libsoup3'
  'opus'
  'polkit'
  'vulkan-icd-loader'
  'webkit2gtk-4.1'
)
optdepends=(
  'noto-fonts-cjk: CJK subtitle font rendering'
  'openxr: OpenXR VR overlay support'
  'org.freedesktop.secrets: system keyring credential storage'
  'xdg-desktop-portal: desktop OCR, vision capture and global shortcuts'
  'xdg-utils: opening external links and log directories'
)
options=('!strip' '!debug')
_deb="VRCS-${pkgver}-linux-x86_64.deb"
noextract=("${_deb}")
source=("${_deb}::${url}/releases/download/${pkgver}/${_deb}")
sha256sums=('9b032106d9c430ad638b9139a46ce9ef5c86e8af8465008867dc258cdc30970a')

package() {
  local data_tar
  data_tar="$(bsdtar -tf "${srcdir}/${_deb}" | grep -m1 '^data\.tar\.')"
  if [[ -z "${data_tar}" ]]; then
    echo "error: data.tar.* not found inside ${_deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${_deb}" "${data_tar}" | bsdtar --no-same-owner -xf - -C "${pkgdir}"

  chmod 0755 "${pkgdir}/usr/bin/vrcs-desktop"
  if [[ -d "${pkgdir}/usr/lib/vrcs" ]]; then
    chmod 0755 "${pkgdir}/usr/lib/vrcs"
  fi
  chmod 0644 "${pkgdir}/usr/share/polkit-1/actions/app.vrcs.network-capture.policy"

  if [[ -f "${pkgdir}/usr/lib/VRCS/LICENSE" ]]; then
    install -Dm644 "${pkgdir}/usr/lib/VRCS/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
  if [[ -f "${pkgdir}/usr/lib/VRCS/THIRD_PARTY_NOTICES.md" ]]; then
    install -Dm644 "${pkgdir}/usr/lib/VRCS/THIRD_PARTY_NOTICES.md" \
      "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
  fi
}

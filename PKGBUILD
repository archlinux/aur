# Maintainer: vho <v_h@me.com>

pkgname=lucidlink-bin
pkgver=3.9.8826
pkgrel=1
pkgdesc="Your private filespace in the cloud"
arch=('x86_64')
url="https://www.lucidlink.com/"
license=('custom')
depends=(
  'alsa-lib'
  'bash-completion'
  'fuse3'
  'gtk3'
  'libappindicator-gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
provides=('lucidlink')
conflicts=('lucidlink')
install="${pkgname}.install"
source=("https://releases.lucidlink.com/prod/linux-deb/lucidlink_${pkgver}_amd64.deb")
sha256sums=('ce61b8db317d047204f0f539d6b9e64835c32df140eabb01d42befcfe01bf3f7')

package() {
  bsdtar -xf "${srcdir}/lucidlink_${pkgver}_amd64.deb" -C "${srcdir}"

  # Upstream has shipped data.tar.xz and data.tar.zst at different times, so
  # don't hardcode the compression -- take whichever member the .deb contains.
  local data
  data="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  [[ -n "${data}" ]] || { echo "no data.tar.* inside the .deb" >&2; return 1; }
  bsdtar -xf "${data}" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  if [[ -e "${pkgdir}/usr/local/bin/lucidlink" ]]; then
    mv "${pkgdir}/usr/local/bin/lucidlink" "${pkgdir}/usr/bin/lucidlink"
  elif [[ -e "${pkgdir}/usr/local/bin/LucidLink" ]]; then
    mv "${pkgdir}/usr/local/bin/LucidLink" "${pkgdir}/usr/bin/lucidlink"
  fi

  if [[ -e "${pkgdir}/usr/local/bin/lucid" ]]; then
    mv "${pkgdir}/usr/local/bin/lucid" "${pkgdir}/usr/bin/lucid"
  fi

  if [[ -e "${pkgdir}/usr/local/bin/lucid3" ]]; then
    mv "${pkgdir}/usr/local/bin/lucid3" "${pkgdir}/usr/bin/lucid3"
  fi

  rmdir "${pkgdir}/usr/local/bin" 2>/dev/null || true
  rmdir "${pkgdir}/usr/local" 2>/dev/null || true
}

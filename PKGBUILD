# Maintainer: Agastya <me@hanabi.in>
# Copied from:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=spacedrive-clean

# Maintaining only the FOSS distribution of spacedrive;
# after the project was relicensed to FSL-1.1-ALv2
# https://github.com/spacedriveapp/spacedrive/commit/53b030c492e05498dc0f7fd9cb4271a5edd0e449
# Project will be under a free license after March 24, 2028, 9:32 PM GMT

pkgname=spacedrive-clean-foss
pkgver=0.4.3
pkgrel=1
pkgdesc="The FOSS distribution of spacedrive; a file manager from the future - powered by a virtual distributed filesystem.  Cleaner Arch repack of the official Linux binary."
arch=('x86_64')
url="https://www.spacedrive.com"
license=('AGPL-3.0-only')

depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'dbus'
  'xdotool'
  'glibc'
)

makedepends=(
  'patchelf'
)

provides=('spacedrive')
conflicts=('spacedrive' 'spacedrive-bin' 'spacedrive-git' 'spacedrive-clean')

source=("${pkgname}-${pkgver}.deb::https://github.com/spacedriveapp/spacedrive/releases/download/${pkgver}/Spacedrive-linux-x86_64.deb")
sha256sums=('30b0801cd2c9ffd6dd0812c106cb2ba64f7cbaf2937c7b3d606c66c49d75fe86')

options=(!strip)

package() {
  cd "${srcdir}"

  bsdtar -xf "${pkgname}-${pkgver}.deb"

  local data_archive
  data_archive="$(find . -maxdepth 1 -type f \( -name 'data.tar.xz' -o -name 'data.tar.gz' -o -name 'data.tar.zst' \) | head -n1)"

  [[ -n "${data_archive}" ]] || {
    echo "The data.tar.* file was not found inside the .deb package"
    return 1
  }

  bsdtar -xf "${data_archive}" -C "${pkgdir}"

  if [[ -d "${pkgdir}/usr/lib/Spacedrive" ]]; then
    mv "${pkgdir}/usr/lib/Spacedrive" "${pkgdir}/usr/lib/spacedrive"
  fi

  if [[ -f "${pkgdir}/usr/bin/spacedrive" ]]; then
    chmod 755 "${pkgdir}/usr/bin/spacedrive"
  fi

  patchelf --replace-needed libxdo.so.3 libxdo.so.4 "${pkgdir}/usr/bin/spacedrive"
}

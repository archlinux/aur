pkgname=sealantern-connect
pkgver=0.3.0
pkgrel=1
pkgdesc='Lightweight Minecraft Java Edition P2P multiplayer client powered by sculk'
arch=('x86_64' 'aarch64')
url='https://github.com/SeaLantern-Studio/SeaLantern-Connect'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
options=('!strip')
source_x86_64=('sealantern-connect-0.3.0-x86_64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.3.0/SeaLantern.Connect_0.3.0_amd64.deb')
source_aarch64=('sealantern-connect-0.3.0-aarch64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v0.3.0/SeaLantern.Connect_0.3.0_arm64.deb')
sha256sums_x86_64=('e90314475f29975357f7b1c981fd2e9f4d546a770807f111f5b38b91b4a1cd46')
sha256sums_aarch64=('1fbc144f472798115644cbd43bc4f82033571ebf1b09b62a92177fdeca6e70dc')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='sealantern-connect-0.3.0-x86_64.deb' ;;
    aarch64) deb='sealantern-connect-0.3.0-aarch64.deb' ;;
    *) return 1 ;;
  esac

  local unpack_dir="${srcdir}/deb-data"
  rm -rf "${unpack_dir}"
  mkdir -p "${unpack_dir}"
  bsdtar -xf "${srcdir}/${deb}" -C "${unpack_dir}"

  local data_tar
  data_tar="$(find "${unpack_dir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  if [[ -z "${data_tar}" ]]; then
    echo "failed to locate data.tar.* in ${deb}" >&2
    return 1
  fi
  bsdtar -xf "${data_tar}" -C "${pkgdir}"
}

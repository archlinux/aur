pkgname=sealantern-connect
pkgver=1.0.0
pkgrel=1
pkgdesc='Lightweight Minecraft Java Edition P2P multiplayer client powered by sculk'
arch=('x86_64' 'aarch64')
url='https://github.com/SeaLantern-Studio/SeaLantern-Connect'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
options=('!strip')
source_x86_64=('sealantern-connect-1.0.0-x86_64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v1.0.0/SeaLantern.Connect_1.0.0_amd64.deb')
source_aarch64=('sealantern-connect-1.0.0-aarch64.deb::https://github.com/SeaLantern-Studio/SeaLantern-Connect/releases/download/v1.0.0/SeaLantern.Connect_1.0.0_arm64.deb')
sha256sums_x86_64=('2d81dac0ca9db13d82b163b36747d49e022509cfd75b386073759dfd643546bb')
sha256sums_aarch64=('70bb66ff8bcb6f4ebb48688a5e04f05d0cbd5fa774dc81dd99e3c001954ec58d')

package() {
  local deb
  case "${CARCH}" in
    x86_64) deb='sealantern-connect-1.0.0-x86_64.deb' ;;
    aarch64) deb='sealantern-connect-1.0.0-aarch64.deb' ;;
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

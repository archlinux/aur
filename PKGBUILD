# Maintainer: 7Ji <pugokushin@gmail.com>

_pkgname='libv4l-rkmpp'
pkgname="${_pkgname}-git"
pkgver=1.5.1.r5.38da407
pkgrel=2
pkgdesc='A rockchip-mpp V4L2 wrapper plugin for chromium V4L2 VDA/VEA, latest from git'
url="https://github.com/JeffyCN/${_pkgname}"
license=('LGPL2.1')
install=${_pkgname}.install
source=(
  "git+${url}"
  "${_pkgname}"-setup.service
  "${_pkgname}"-setup.sh
)
sha256sums=(
  'SKIP'
  'bd0e9affc10943d6458daac30b0ee10aaa06fb7595d781b7e8095f51a3d5140c'
  '3e8aa46f93d7e410fccaceb5336d0b9107cff53b965af87b8c4ddb9f7fdfd040'
)
arch=('aarch64')
depends=('v4l-utils-mpp' 'librga-multi' 'mpp-git')
makedepends=('meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

_srcname="${_pkgname}"

pkgver() {
  cd "${_srcname}"
  printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  arch-meson "${_srcname}" build
  meson compile -C build
}

package() {
  # Lib
  meson install -C build --destdir "${pkgdir}"
  # Setup helper
  install -Dm755 "${_pkgname}"-setup.sh -t "${pkgdir}"/usr/bin
  install -Dm644 "${_pkgname}"-setup.service -t "${pkgdir}"/usr/lib/systemd/system
  local _profiles="${pkgdir}"/usr/share/"${_pkgname}"-profiles
  echo 'enc' |
    install -Dm644 /dev/stdin "${_profiles}"/default.enc
  local _template='type=%s\ncodecs=%s\nmax-width=%u\nmax-height=%u\n'
  printf "${_template}" dec VP8:VP9:H.264:H.265:AV1 1920 1080 |
    install -Dm644 /dev/stdin "${_profiles}"/default.dec
  printf "${_template}" dec VP8:VP9:H.264:H.265:AV1 7680 4320 |
    install -Dm644 /dev/stdin "${_profiles}"/rk3588.dec
  printf '# The corresponding profile must exist under /usr/share/${_pkgname}-profiles\nPROFILE=rk3588\n' |
    install -Dm644 /dev/stdin "${pkgdir}"/etc/conf.d/"${_pkgname}"
}
# Maintainer: taotieren <admin@taotieren.com>

pkgname=rockutil-git
pkgver=r36.123597f
pkgrel=1
pkgdesc="Most feature complete Rockchip SoC Flashing Utility"
arch=($CARCH)
url="https://github.com/mkschreder/rockutil"
license=('GPL-2.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
  glibc
  libusb
)
makedepends=(
  git
)
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  make 
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install PREFIX=/usr
  install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/51-${pkgname%-git}.rules" << EOF
# /etc/udev/rules.d/51-rockchip.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="2207", MODE="0660", TAG+="uaccess"
EOF
  # install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

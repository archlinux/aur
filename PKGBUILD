# Maintainer: Patrick Wozniak <hello@patwoz.de>
# based on https://aur.archlinux.org/packages/hyperion-git/
# modified for raspberry pi

pkgname=hyperion-rpi-git
pkgver=20150611.r666.e93bd2f
pkgrel=2
pkgdesc="An opensource 'AmbiLight' implementation (build for raspberry pi) (git-version)"

arch=('any')
url="https://github.com/tvdzwan/hyperion"
license=('MIT')

depends=(
)
optdepends=(
)
makedepends=(
  'cmake'
  'git'
)
conflicts=(
  'hyperion-git'
  'hyperion-rpi-bin'
)

source=(
  "${pkgname%-rpi-git}::git+https://github.com/tvdzwan/hyperion.git#branch=master"
  "hyperiond.service"
  "LICENSE"
)
sha256sums=(
  'SKIP'
  'aab12fb3d901ea4c8694bd713b1a2187beae6a6ed40f3355d12fc7ad50aaf3fe'
  '85f28018f946ca13b6de640c45e011cd9fe56114d474cb990d4d1ff91ae1cd60'
)

pkgver() {
  cd "${pkgname%-rpi-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-rpi-git}"

  # https://github.com/tvdzwan/hyperion/blob/master/CompileHowto.txt
  git submodule init
  git submodule update
  cmake ./
  make
}

package() {
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-rpi-git}/LICENSE"

  cd "${pkgname%-rpi-git}"

  install -d "${pkgdir}/opt/hyperion"

  install -Dm755 "bin/hyperiond" "${pkgdir}/usr/bin/hyperiond"
  install -Dm755 "bin/hyperion-remote" "${pkgdir}/usr/bin/hyperion-remote"
  install -Dm755 "bin/hyperion-v4l2" "${pkgdir}/usr/bin/hyperion-v4l2"

  install -m 644 "config/hyperion.config.json" "${pkgdir}/etc/conf.d/hyperion.config.json"

  install -m 644 hyperiond.service "${pkgdir}/usr/lib/systemd/system/"

  cp -r "effects" "${pkgdir}/opt/hyperion/"
}

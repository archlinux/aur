# Maintainer: alvin <alvin@example.com>

pkgname=rime-custom-config-git
pkgver=0.2.0.r0.g442037d
pkgrel=1
pkgdesc="Manage custom Chinese dictionary for fcitx5 rime"
arch=('x86_64')
url="https://github.com/cublueer/rime-custom-config"
install="${pkgname}.install"
license=('MIT')
depends=('gcc-libs' 'fcitx5' 'fcitx5-rime')
makedepends=('cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd rime-custom-config
  local desc=$(git describe --long --tags 2>/dev/null)
  if [[ -n $desc ]]; then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd rime-custom-config
  cargo build --release --locked
}

check() {
  cd rime-custom-config
  cargo test --release --locked
}

package() {
  install -Dm755 rime-custom-config/target/release/rime-custom-config \
    "${pkgdir}/usr/bin/rime-custom-config"
}

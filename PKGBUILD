_pkgname=onagre
pkgname=$_pkgname-git
pkgver=1.0.0_alpha.0.r172.ga7628b1
pkgname=onagre-git
pkgrel=2
pkgdesc='A general purpose application launcher for X and wayland inspired by rofi/wofi and alfred'
arch=('x86_64')
url='https://github.com/oknozor/onagre'
license=('MIT')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'pop-launcher')
makedepends=('cargo' 'git')
optdepends=('libqalculate: calculator and unit conversion support'
            'vulkan-radeon: icon support for AMD GPUs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|sed 's/-/_/g').r$(git rev-list --count HEAD).g$(git describe --always)
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked
}

build() {
  cd "${pkgname%-*}"
  cargo build --release --frozen
}

package() {
  cd "${pkgname%-*}"
  install -Dm 755 target/release/onagre "$pkgdir/usr/bin/onagre"
}

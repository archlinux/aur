# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='luxtorpeda-git'
pkgver=30.0.0.r270.415ad45
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64' 'i686')
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL2')
depends=('openssl' 'xz')
makedepends=('git' 'rust')
optdepends=('steam: The Steam client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git"
        'reproducible-build.patch'
        'size-optimisations.patch')
sha256sums=('SKIP'
            'e97cf95dedcf60c97edb3a693052964e4ce6da795631ca5c9f04182462f67895'
            '2bd6a8b0586cf5f382d4e98ed8803bc34af2b5227f31a3f219957b4d6f50ada3')

pkgver() {
  cd "${pkgname%-git}"
  local base="$(grep -oP '(?<=^version = ")[^"]+(?="$)' Cargo.toml)"
  local revision_count="$(git rev-list --count HEAD)"
  local revision_commit="$(git rev-parse --short HEAD)"
  echo "$base.r$revision_count.$revision_commit"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/reproducible-build.patch"
  patch -Np1 -i "$srcdir/size-optimisations.patch"
}

build() {
  cd "${pkgname%-git}"
  mkdir -p "target/release"
  make luxtorpeda
}

check() {
  cd "${pkgname%-git}"
  make test
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

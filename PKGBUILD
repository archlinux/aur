# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='luxtorpeda-git'
pkgver=0.1.0.r143.e770a4f
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64' 'i686')
url='https://luxtorpeda.gitlab.io/'
license=('GPL2')
depends=('openssl' 'xz')
makedepends=('git' 'rust')
optdepends=('steam: The Steam client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('git+https://github.com/dreamer/luxtorpeda.git'
        'size-optimisations.patch'
        'reproducible-build.patch')
sha256sums=('SKIP'
            '6161875cd2fb3d98881c323872f74c8fbc730287273c0d4574fd1ac1f67388db'
            'e97cf95dedcf60c97edb3a693052964e4ce6da795631ca5c9f04182462f67895')

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

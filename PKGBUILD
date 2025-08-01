# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus'
pkgver=0.6
pkgrel=1
pkgdesc="SSH server for Incus instances"
arch=(
  'x86_64'
  'aarch64'
)
url='https://ssh2incus.com/'
license=('GPL-3.0-only')
depends=()
makedepends=(
  'just'
)
optdepends=('incus')

backup=('etc/default/ssh2incus')
install=ssh2incus.install

source=(
  "${pkgname}-${pkgver}::git+https://github.com/mobydeck/ssh2incus.git#tag=${pkgver}"
)
sha256sums=(
  'SKIP'
)
source_x86_64=(
  'amd64.patch'
)
sha256sums_x86_64=(
  '276c724b106316d9845626c154950cff087a5c56ca635d94ff2bcfffb646ae58'
)
source_aarch64=(
  'arm64.patch'
)
sha256sums_aarch64=(
  '7701caa5ecb4e4927b2afcbc3b45aeba30739c59b5d3a3a7aa5dc451895fc3e2'
)

_buildarch="$CARCH"
if [[ "$CARCH" == "x86_64" ]]; then
  _buildarch="amd64"
elif [[ "$CARCH" = "aarch64" ]]; then
  _buildarch="arm64"
fi

prepare() {
  patch -d "${pkgname}-${pkgver}" -Np1 -i ../${_buildarch}.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  just build-sftp-server $_buildarch
  just build-stdio-proxy $_buildarch
  just version=$pkgver build-for linux $_buildarch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "dist/ssh2incus-linux-${_buildarch}" "$pkgdir/usr/bin/ssh2incus"
  install -Dm644 "packaging/ssh2incus.env" "$pkgdir/etc/default/ssh2incus"
  install -Dm644 "packaging/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}
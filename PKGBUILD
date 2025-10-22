# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus'
pkgver=0.8
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
  'go'
  'just'
)
optdepends=('incus')

backup=('etc/default/ssh2incus')
install=ssh2incus.install

source=(
  "git+https://github.com/mobydeck/ssh2incus.git#tag=${pkgver}"
)
sha256sums=(
  '7337a6d5064eb48d991677906c73e5eaf40259207b5e1dfb16fddbf8d1b9c566'
)

_buildarch="$CARCH"
if [[ "$CARCH" == "x86_64" ]]; then
  _buildarch="amd64"
elif [[ "$CARCH" = "aarch64" ]]; then
  _buildarch="arm64"
fi

build() {
  cd "$srcdir/$pkgname"

  just build-sftp-server-all
  just build-stdio-proxy-all
  just version=$pkgver build-for linux $_buildarch
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "dist/ssh2incus-linux-${_buildarch}" "$pkgdir/usr/bin/ssh2incus"
  install -Dm644 "packaging/ssh2incus.env" "$pkgdir/etc/default/ssh2incus"
  install -Dm644 "packaging/config.yaml" "$pkgdir/etc/ssh2incus/config.yaml"
  install -Dm644 "packaging/create-config.yaml" "$pkgdir/etc/ssh2incus/create-config.yaml"
  install -Dm644 "packaging/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}
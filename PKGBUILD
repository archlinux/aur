# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus'
pkgver=0.6
pkgrel=2
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
  "git+https://github.com/mobydeck/ssh2incus.git#tag=${pkgver}"
)
sha256sums=(
  'f3329cff779af0112c60d3e8f8652b9af70ccb97269456d499fb3f957e024315'
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
  install -Dm644 "packaging/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}
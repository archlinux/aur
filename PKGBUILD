# Maintainer: Joe <joe@kitsunehosting.net>

pkgname=rpi-image-gen
pkgver=2.4.0
pkgrel=1
pkgdesc="Tool to generate highly customised software images for Raspberry Pi devices"
arch=('x86_64' 'aarch64')
url="https://github.com/raspberrypi/rpi-image-gen"
license=('BSD-3-Clause')
depends=(
  bash
  coreutils
  python
  python-yaml
  python-debian
  python-jsonschema
  python-ruamel-yaml
  dpkg
  podman
  shadow
  dbus
  zip
  dosfstools
  e2fsprogs
  rsync
  curl
  mtools
  zstd
  pv
  btrfs-progs
  util-linux
  make
  autoconf
  automake
  libtool
  gettext
  flex
  pkg-config
  python-pip
  mmdebstrap
)
optdepends=(
  'dctrl-tools: Debian control file tools (from AUR)'
  'arch-test: Feature testing (from AUR)'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/raspberrypi/rpi-image-gen/archive/refs/tags/v$pkgver.tar.gz"
  "arch-deps-check.patch"
  "registry.defs::https://raw.githubusercontent.com/raspberrypi/rpi-image-gen/master/registry.defs"
)
sha256sums=(
  '31fcfd83730ed6ef7cdd9c4ba37b8a1e2971629970631d6f0be73d5d561f11a9'
  'a1f05ec1f2553e229466d08a719ee5bc5523d9a78580dec646bd9ffa475aa416'
  '9542b75c64541aae24f2b11810f7cdebeaa62194c95e0b592ff859cf0fd738d6'
)

prepare() {
  cd "$srcdir/rpi-image-gen-$pkgver"
  patch -p1 -i "$srcdir/arch-deps-check.patch"
  # registry.defs not in release tarball; install from upstream
  install -m644 "$srcdir/registry.defs" .
}

package() {
  cd "$srcdir/rpi-image-gen-$pkgver"

  # Install tree under /usr/share (script looks for /usr/share/rpi-image-gen)
  install -dm755 "$pkgdir/usr/share/rpi-image-gen"
  cp -a bin config contrib device docs examples image keydir layer layer-hooks lib package scripts site templates test \
        depends install_deps.sh LICENSE registry.defs rpi-image-gen \
        "$pkgdir/usr/share/rpi-image-gen/"

  # Entry point in PATH
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/rpi-image-gen/rpi-image-gen "$pkgdir/usr/bin/rpi-image-gen"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

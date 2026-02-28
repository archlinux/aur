# Maintainer: Joe <joe@kitsunehosting.net>

pkgname=rpi-image-gen
pkgver=2.2.0
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
  'b027516515e4e3f5da11da2f008e9f0f2df416ddf3054b62d447c495497525f5'
  'a1f05ec1f2553e229466d08a719ee5bc5523d9a78580dec646bd9ffa475aa416'
  'ef604a194ad49d848966e3b6127d1f6b23a3be20c222f4f5758da497715fb64b'
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

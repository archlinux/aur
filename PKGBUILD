# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>
#
# Note: This assumes that you have a local podman installation configured.
#       Alternatively, if you have a Docker installation where your local user
#       is in the `docker` group (which is potentially dangerous!), remove the
#       `podman` makedependency and remove the `export USE_PODMAN=True` line.

pkgname=tezos-serokell
pkgver=11.0
_distver=$pkgver-1
pkgrel=1
pkgdesc='Build Tezos from source in a local Podman container using the build scripts by Serokell.'
arch=('x86_64')
url='https://github.com/serokell/tezos-packaging'
license=('MIT')
provides=('tezos')
conflicts=('tezos')
makedepends=('podman')
options=()
depends=()
source=(
  # Dir: docker/
  'docker-static-build.sh'
  'protocols.json'
  # Dir: docker/build/
  'Dockerfile'
  'build-libusb-and-hidapi.sh'
  'build-tezos.sh'
  'static_libs.patch'
  # Other files
  'systemd_sysusers.d_tezos.conf'
  'tezos-node.service'
  'tezos-serokell.install'
)
sha256sums=('c9955a43a7cb6811b9f2ced2f4fc757092c5959405298ca887c189acec24f352'
            '552c9b3f54049d92f59d649f3b3220b1a4070745204ea7e71d77b4ba3def62a2'
            'c2c670ec6017f649a5c758fe53d9dcfe40607914a87a543b0c3c3fc1744c9742'
            '3efaeb530efbfee94eb842176a120335cf3dfe8aa1d1473922a5e0d709e10c90'
            'c944539ccc4478b25b2fa18396ec76a38e58c28d6a97c68891317ed2aa80b93d'
            '8314fdf62ba8440a11a3bdc408cf7e3f5874dced84a0209a7a05075f42a8291b'
            'ef749a4f8cb69da8e400918c3d3e46b3c76743ad876d4a75e6fb1d85d12d2592'
            'f6c661a12e0ee6cb5df7ba847998d9dcd3cb357494c8de2f770454874a94d274'
            'a55713bc79b71d56b73db458ab20c0b07750a846d2c7a528f7b04573e0be4c46')
install=${pkgname}.install

build() {
  cd "$srcdir"

  # Config
  export USE_PODMAN=True
  export TEZOS_VERSION="v${pkgver}"

  # Set up build scripts
  DIR="docker"
  mkdir -p "$DIR/build/"
  cp docker-static-build.sh "$DIR/"
  cp protocols.json "$DIR/"
  cp Dockerfile "$DIR/build/"
  cp build-libusb-and-hidapi.sh "$DIR/build/"
  cp build-tezos.sh "$DIR/build/"
  cp static_libs.patch "$DIR/build/"
  chmod +x "$DIR/build/build-libusb-and-hidapi.sh"
  chmod +x "$DIR/build/build-tezos.sh"

  # Build
  cd "$DIR"
  bash ./docker-static-build.sh
}

package() {
  # Install binaries
  mkdir -p "$pkgdir"/usr/bin/
  cp "$srcdir"/docker/tezos-* "$pkgdir"/usr/bin/
  chown root:root "$pkgdir"/usr/bin/*
  chmod 755 "$pkgdir"/usr/bin/*

  # Install zcash params
  mkdir -p "$pkgdir"/usr/share/zcash-params
  install -o root -g root -m 644 "$srcdir"/docker/sapling-output.params "$pkgdir"/usr/share/zcash-params
  install -o root -g root -m 644 "$srcdir"/docker/sapling-spend.params "$pkgdir"/usr/share/zcash-params

  # Install systemd service
  install -Dm644 "$srcdir"/tezos-node.service \
                 "$pkgdir"/usr/lib/systemd/system/tezos-node.service

  # Install sysusers hook
  install -Dm644 "$srcdir"/systemd_sysusers.d_tezos.conf \
                 "$pkgdir"/usr/lib/sysusers.d/tezos.conf
}

# vim:set ts=2 sw=2 et:

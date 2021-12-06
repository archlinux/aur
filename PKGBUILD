# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tezos-mainnet-git
_name=tezos
pkgver=r3797.a67ca32c6
pkgrel=1
pkgdesc="Tezos is a distributed consensus platform with meta-consensus capability."
arch=('x86_64' 'i686')
url="https://gitlab.com/tezos/tezos"
license=('MIT')
depends=('gmp' 'hidapi' 'libev')
makedepends=('git' 'opam' 'dune')
provides=('tezos-client' 'tezos-node' 'tezos-signer' 'tezos-protocol-compiler' 'tezos-admin-client')
conflicts=()
options=(!emptydirs)
source=(
  'git+https://gitlab.com/tezos/tezos.git/#branch=mainnet'
  'systemd_sysusers.d_tezos.conf'
  'tezos-node.service'
  'tezos-mainnet-git.install'
)
install=${pkgname}.install
sha256sums=(
  'SKIP'
  'ef749a4f8cb69da8e400918c3d3e46b3c76743ad876d4a75e6fb1d85d12d2592'
  'f6c661a12e0ee6cb5df7ba847998d9dcd3cb357494c8de2f770454874a94d274'
  'a55713bc79b71d56b73db458ab20c0b07750a846d2c7a528f7b04573e0be4c46'
)

prepare() {
  cd "$srcdir/$_name"
  # Disable sandboxing with bwrap since AUR is doing that already
  opam init --bare -n --disable-sandboxing --no-opamrc --root=$srcdir/opam
  make build-deps
}

build() {
  cd "$srcdir/$_name"
  eval $(opam env)
  make
}

package() {
  cd "$srcdir/$_name"

  # Install binaries
  mkdir -p $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-accuser-* $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-admin-client $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-baker-* $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-client $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-endorser-* $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-node $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-protocol-compiler $pkgdir/usr/bin
  install -o root -g root -m 755 tezos-signer $pkgdir/usr/bin

  # Install bash completions
  mkdir -p $pkgdir/usr/share/bash-completion/completions
  install -o root -g root -m 644 \
    src/bin_client/bash-completion.sh \
    $pkgdir/usr/share/bash-completion/completions/tezos-client

  # Install systemd service
  install -Dm644 "${srcdir}"/tezos-node.service \
                 "${pkgdir}"/usr/lib/systemd/system/tezos-node.service
  install -Dm644 "${srcdir}"/systemd_sysusers.d_tezos.conf \
                 "${pkgdir}"/usr/lib/sysusers.d/tezos.conf
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:

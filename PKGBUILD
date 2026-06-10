# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/tabbyml-bin

pkgname=tabbyml-bin
pkgver=0.32.0 # renovate: datasource=github-releases depName=TabbyML/tabby
pkgrel=3
pkgdesc="Self-hosted AI coding assistant (prebuilt CPU binary)"
arch=('x86_64')
url="https://github.com/TabbyML/tabby"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'bash')
optdepends=('katana: crawl developer documentation context providers (upstream requires >= 1.1.2)')
provides=("tabbyml=${pkgver}")
conflicts=('tabbyml' 'tabbyml-git' 'tabbyml-cuda-bin' 'tabbyml-vulkan-bin')
options=('!strip')
install="${pkgname}.install"
_asset='tabby_x86_64-manylinux_2_28'
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/TabbyML/tabby/releases/download/v${pkgver}/${_asset}.tar.gz"
  "tabbyml.service"
  "tabbyml.env"
  "config.toml"
)
sha256sums=('048b44cf251519398c67fd880dc9f0d44e2e01c56f1e4e2f2c83b26120b14497'
            '0add0c190349ff65fc804d02261c606a7d59235aa8a1a0edf0701b18fbd3c1d6'
            '1b8536492f16db6424d51f1fd51904d0b70ce8f57320b9f73422289bca31a89e'
            '019d34e8cde65c2ea7d198df2d1e0062bdbfa449510b4432fa90800364a64816')

package() {
  install -Dm755 "$srcdir/$_asset/tabby" \
    "$pkgdir/usr/lib/tabbyml/tabby"

  install -Dm755 "$srcdir/$_asset/llama-server" \
    "$pkgdir/usr/lib/tabbyml/llama-server"

  local _lib
  shopt -s nullglob
  for _lib in "$srcdir/$_asset"/*.so*; do
    install -Dm755 "$_lib" "$pkgdir/usr/lib/tabbyml/$(basename "$_lib")"
  done
  shopt -u nullglob

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tabbyml" <<'EOF'
#!/bin/sh
export PATH="/usr/lib/tabbyml:${PATH}"
exec /usr/lib/tabbyml/tabby "$@"
EOF

  install -Dm644 "$srcdir/tabbyml.service" "$pkgdir/usr/lib/systemd/user/tabbyml.service"
  install -Dm644 "$srcdir/tabbyml.env" "$pkgdir/usr/share/doc/$pkgname/tabbyml.env"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml"

  local _license
  shopt -s nullglob
  for _license in "$srcdir/$_asset"/LICENSE*; do
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_license")"
  done
  shopt -u nullglob
}

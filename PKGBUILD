# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/tabbyml-bin

pkgname=tabbyml-bin
pkgver=0.32.0 # renovate: datasource=github-releases depName=TabbyML/tabby
pkgrel=1
pkgdesc="Self-hosted AI coding assistant (prebuilt CPU binary)"
arch=('x86_64')
url="https://github.com/TabbyML/tabby"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'bash')
optdepends=('katana: crawl developer documentation context providers (upstream requires >= 1.1.2)')
provides=("tabbyml=${pkgver}")
conflicts=('tabbyml' 'tabbyml-git' 'tabbyml-cuda-bin' 'tabbyml-vulkan-bin')
options=('!strip')
_asset='tabby_x86_64-manylinux_2_28'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TabbyML/tabby/releases/download/v${pkgver}/${_asset}.tar.gz")
sha256sums=('048b44cf251519398c67fd880dc9f0d44e2e01c56f1e4e2f2c83b26120b14497')

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

  local _license
  shopt -s nullglob
  for _license in "$srcdir/$_asset"/LICENSE*; do
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_license")"
  done
  shopt -u nullglob
}

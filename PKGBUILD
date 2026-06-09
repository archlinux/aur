# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/tabbyml-vulkan-bin

pkgname=tabbyml-vulkan-bin
pkgver=0.32.0 # renovate: datasource=github-releases depName=TabbyML/tabby
pkgrel=2
pkgdesc="Self-hosted AI coding assistant (prebuilt Vulkan binary)"
arch=('x86_64')
url="https://github.com/TabbyML/tabby"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'bash' 'curl' 'vulkan-icd-loader')
optdepends=('katana: crawl developer documentation context providers (upstream requires >= 1.1.2)')
provides=("tabbyml=${pkgver}")
conflicts=('tabbyml' 'tabbyml-git' 'tabbyml-bin' 'tabbyml-cuda-bin')
options=('!strip')
install="${pkgname}.install"
_asset='tabby_x86_64-manylinux_2_28-vulkan'
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/TabbyML/tabby/releases/download/v${pkgver}/${_asset}.tar.gz"
  "tabbyml.service"
  "tabbyml.env"
  "config.toml"
)
sha256sums=('33de79ba7de0520bb6b158faaac3c41f0690477f97b4f393f3883320b206113b'
            '65408048199058b54d6cf7d048361e3fa30308e7e68b40e4e92bed610deaad57'
            'cae696b2a290de40cb08b423b64a2fd208dfb109640635b223430f3ab46fad04'
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
export LD_LIBRARY_PATH="/usr/lib/tabbyml${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
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

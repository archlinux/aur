# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/tabbyml-cuda-bin

pkgname=tabbyml-cuda-bin
pkgver=0.32.0 # renovate: datasource=github-releases depName=TabbyML/tabby
pkgrel=1
pkgdesc="Self-hosted AI coding assistant (prebuilt CUDA binary)"
arch=('x86_64')
url="https://github.com/TabbyML/tabby"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'zlib' 'bash' 'cuda' 'nvidia-utils')
optdepends=('katana: crawl developer documentation context providers (upstream requires >= 1.1.2)')
provides=("tabbyml=${pkgver}")
conflicts=('tabbyml' 'tabbyml-git' 'tabbyml-bin' 'tabbyml-vulkan-bin')
options=('!strip')
_asset='tabby_x86_64-manylinux_2_28-cuda123'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TabbyML/tabby/releases/download/v${pkgver}/${_asset}.tar.gz")
sha256sums=('ce1eb25870702a008583c31b147c70e5feda73501a9136196199ba1ace2d211e')

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

  local _license
  shopt -s nullglob
  for _license in "$srcdir/$_asset"/LICENSE*; do
    install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$_license")"
  done
  shopt -u nullglob
}

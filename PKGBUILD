# Maintainer: zaidejjo
# AUR package for the ZZ programming language toolchain.
# Prebuilt upstream release zips — installs in seconds, no compilation.
# This file is generated from PKGBUILD.template by
# packaging/aur/render.sh (or .github/workflows/aur-publish.yml).
# Do NOT edit pkgver/sha256sums by hand — CI rewrites them on every
# GitHub Release. Edit the template instead.
#
# Installs:
#   /usr/bin/zz      -> `zz run main.zz`, `zz check`, `zz build`, REPL
#   /usr/bin/zz-lsp  -> language server
#   /usr/lib/zz/     -> prebuilt native runtime (libzz_native_rt.a +
#                       static libstd rlib) so `zz build` links with no
#                       sources and no Rust toolchain. AOT outputs carry
#                       no libstd dependency and no RUNPATH (#303), so
#                       downstream packages ship no lib/ dir.

pkgname=zz-lang
pkgver=0.2.2
pkgrel=1
pkgdesc='ZZ programming language toolchain — prebuilt binary (zz run main.zz, plus zz-lsp)'
arch=('x86_64' 'aarch64')
url='https://github.com/zaidejjo/zz'
license=('Apache')
depends=('gcc-libs' 'curl' 'sqlite')
makedepends=('unzip')
conflicts=('zz')
source_x86_64=("$pkgname-$pkgver-$CARCH.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-x86_64.zip")
source_aarch64=("$pkgname-$pkgver-$CARCH.zip::https://github.com/zaidejjo/zz/releases/download/v$pkgver/zz-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('be7de833b94a3e2f7c9abdaea488b0744c0ec65d6271cbd2a8556f80dd1c0812')
sha256sums_aarch64=('0506aa2348ea260ac123859fab43bbbda40cd4ae4bcf24f9612e3d0f084dd5a3')

check() {
  # Prebuilt binaries: smoke-test only (full suite ran in CI pre-release).
  # zz-lsp is a stdio server with no --version flag — assert executable
  # instead of running it (would block on stdin).
  ./zz --version
  test -x ./zz-lsp
}

package() {
  install -Dm755 zz "$pkgdir/usr/bin/zz"
  install -Dm755 zz-lsp "$pkgdir/usr/bin/zz-lsp"
  install -Dm644 lib/libzz_native_rt.a "$pkgdir/usr/lib/zz/libzz_native_rt.a"
  install -Dm644 lib/libstd-*.rlib "$pkgdir/usr/lib/zz/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

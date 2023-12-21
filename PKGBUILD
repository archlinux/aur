# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the meson package (https://gitlab.archlinux.org/archlinux/packaging/packages/meson)

_pkgname=meson
pkgname=meson-rust
pkgver=1.3.0
pkgrel=2
pkgdesc="High productivity build system (version with improved Rust support)"
url="https://mesonbuild.com/"
arch=(any)
license=(Apache)
depends=(
  ninja
  python-tqdm
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=("meson=$pkgver")
conflicts=(meson)
source=(
  https://github.com/mesonbuild/meson/releases/download/"$pkgver"/meson-"$pkgver".tar.gz{,.asc}
  "meson-reference-$pkgver.3::https://github.com/mesonbuild/meson/releases/download/$pkgver/meson-reference.3"
  "meson-reference-$pkgver.json::https://github.com/mesonbuild/meson/releases/download/$pkgver/reference_manual.json"
  arch-meson
  cross-lib32
  native-clang
  rustc-rebuild.patch
)
b2sums=('cb9ac8e00fe924df67166938687584a9de35e784e1e52bff281649d787695d37e3044ea3d6d5869181fe1e9676b5136548293dbd5cdbd091a6de0c449b8932f5'
        'SKIP'
        '553cdd8e165593a50570777f0e862a8e20d15dc5b7262c32ca8c86c54c8f2ee1b759be3439e9eec5917c88b3275d755b4f072e979dab400edf18908cb9fbf68e'
        'f50c3569c6330e8671c402953247fb456505dd75555c8fbf1487bd43881dcdc766d88348814a6c2bb631c571ad4c4efabb271b5a1e7f01748ae2d9a332b39330'
        '211cee61f117fd1d582d7a613a8634f044e9e307791c4154c6da72bccd5f06856801b14bcb26157ee682b5935c48ffd2098a5fabab2232726d7758cf091c07f7'
        '9b16477aa77a706492e26fb3ad42e90674b8f0dfe657dd3bd9ba044f921be12ceabeb0050a50a15caee4d999e1ec33ed857bd3bed9e4444d73bb4a4f06381081'
        '7d88929d5a3b49d91c5c9969f19d9b47f3151706526b889515acaeda0141257d5115875ac84832e9ea46f83a7700d673adcc5db84b331cd798c70ae6e90eac1e'
        '1cf2521f6ebfdbedf1c58c09abfc0f77fcc0d59d903cca6634443d11cb5998cf51c3bfa61c6b17dca98a87f32c12e59558d6da25c57d8b341ae4c266ecd8857a')
validpgpkeys=(
  19E2D6D9B46D8DAA6288F877C24E631BABB1FE70  # Jussi Pakkanen <jpakkane@gmail.com>
)

prepare() {
  cd ${_pkgname}-${pkgver}

  # Rebuild targets after a rustc update (https://github.com/mesonbuild/meson/pull/12536)
  # (this should fix Rust project compile issues after a compiler update)
  patch -Np1 -i ../rustc-rebuild.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -rt "$pkgdir/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dm644 data/shell-completions/bash/* -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 data/shell-completions/zsh/*  -t "$pkgdir/usr/share/zsh/site-functions"

  install -Dm644 ../meson-reference-$pkgver.3    "$pkgdir/usr/share/man/man3/meson-reference.3"
  install -Dm644 ../meson-reference-$pkgver.json "$pkgdir/usr/share/doc/$pkgname/reference_manual.json"

  install -D ../arch-meson -t "$pkgdir/usr/bin"

  install -Dm644 ../cross-lib32 "$pkgdir/usr/share/meson/cross/lib32"
  install -Dm644 ../native-clang "$pkgdir/usr/share/meson/native/clang"
}

# vim:set sw=2 sts=-1 et:

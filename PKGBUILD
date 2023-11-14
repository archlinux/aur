# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the meson package (https://gitlab.archlinux.org/archlinux/packaging/packages/meson)

_pkgname=meson
pkgname=meson-rust
pkgver=1.3.0rc3
pkgrel=1
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
)
b2sums=('2bd5564b766240a849620a26a7fd9c47ff1973a3636c95b9f52634ff980b04b203e62aa790eed3d5ae027e992435be945d18ddea2d85b9da3f437a38d6c7556b'
        'SKIP'
        '50725346b56a749d8d25c19e52a8c7f2a9ab1fb106cd42fcd1b308402c6751ba12e5f15b57334add65d2cc1d7d6c2722bfb14c5ce089cb6edfd7528f73c8318c'
        '5d501abb6f5bc7e4ff0cb1bfde41527d0267e55821dc9426e77afb0e6945281769411c29c22935e97eff5a27dbc4cdebaa1df96156b4d8a966f05c36c7745d41'
        '211cee61f117fd1d582d7a613a8634f044e9e307791c4154c6da72bccd5f06856801b14bcb26157ee682b5935c48ffd2098a5fabab2232726d7758cf091c07f7'
        'e56c75dd9122d866e8a92381f1f8a3fa268451d13a18b73906c0089601d3e6edf28602b36f40d8a32758e9958a167a1bdccd70283581e19b2ed39863640daf95'
        '7d88929d5a3b49d91c5c9969f19d9b47f3151706526b889515acaeda0141257d5115875ac84832e9ea46f83a7700d673adcc5db84b331cd798c70ae6e90eac1e')
validpgpkeys=(
  19E2D6D9B46D8DAA6288F877C24E631BABB1FE70  # Jussi Pakkanen <jpakkane@gmail.com>
)

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

#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=pix2tex
pkgname=python-$_pkgname
pkgver=0.0.31
pkgrel=3
pkgdesc="Using a ViT to convert images of equations into LaTeX code."
arch=(any)
url=https://github.com/lukas-blecher/LaTeX-OCR
depends=(python-tqdm python-munch python-pytorch python-opencv python-requests
  python-einops python-x-transformers python-transformers python-tokenizers
  python-numpy python-pillow python-yaml python-pandas python-timm
  python-albumentations python-screeninfo python-pynput python-pyqt5-webengine)
optdepends=(gnome-screenshot)
makedepends=(python-installer)
license=(MIT)
_py=py3
source=(
  "https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
  "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/image_resizer.pth"
  "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/weights.pth"
)
sha256sums=(
  '55e41560a6d43d10c562b6b438f5e50d26af6f4958856fcf8d04ef44d1c864bc'
  '1c3820659985ad142b526490bb25c23d977176ac2073591b3bddada692718458'
  'a63d9141c53d266cb682fb5a8bd83bd5cbe283145e0e78ebdc0f895195a1dfaa'
)

package() {
  cd "$srcdir" || return 1
  python -m installer --destdir="$pkgdir" ./*.whl
  target_dir="$pkgdir$(python -c'import sys; print(sys.path[-1])')/${_pkgname//-/_}/model/checkpoints"
  install -Dm644 ../image_resizer.pth -t "$target_dir"
  install -Dm644 ../weights.pth -t "$target_dir"
}

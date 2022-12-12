# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=stable-diffusion-intel
pkgver=20220908
pkgrel=2
pkgdesc='Image generator that uses stable diffusion, vino (Intel CPU) and includes "txt2img"'
arch=(x86_64)
url='https://github.com/bes-dev/stable_diffusion.openvino'
license=(Apache2)
makedepends=(git)
depends=(openvino python-diffusers python-ftfy python-huggingface-hub python-numpy python-opencv python-pytorch python-scipy python-streamlit python-tqdm python-transformers python-watchdog)
source=("git+$url#commit=72d3ad67f078b25bc5ae191f6e49078cebd1f791")
b2sums=(SKIP)

prepare() {
  echo -e '#!/bin/sh\nexport PYTHONPATH+=/opt/intel/openvino/python/python3.10\ntime /usr/bin/python3 /opt/stable-diffusion-intel/txt2img "$@"' > txt2img.sh
}

package() {
  install -d "$pkgdir/opt"
  cp -r stable_diffusion.openvino "$pkgdir/opt/$pkgname"
  mv "$pkgdir/opt/$pkgname/demo.py" "$pkgdir/opt/$pkgname/txt2img"
  install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/opt/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 txt2img.sh "$pkgdir/usr/bin/txt2img"
  rm -r "$pkgdir/opt/$pkgname/.git" "$pkgdir/opt/$pkgname/.gitignore"
}

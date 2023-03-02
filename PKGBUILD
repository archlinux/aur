# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=stable-diffusion-intel
pkgver=20220908
pkgrel=4
pkgdesc='Image generator that uses stable diffusion, vino (Intel CPU) and includes "txt2img"'
arch=(x86_64)
url='https://github.com/bes-dev/stable_diffusion.openvino'
license=(Apache 'custom: CreativeML Open RAIL-M')
makedepends=(git)
depends=(
	openvino
	python-diffusers
	python-ftfy
	python-huggingface-hub
	python-numpy
	python-opencv
	python-pytorch
	python-scipy
	python-streamlit
	python-tqdm
	python-transformers
	python-watchdog
)
source=(
	"git+$url#commit=72d3ad67f078b25bc5ae191f6e49078cebd1f791"
	remove-tensor-format.patch
	txt2img.sh
)
sha256sums=(
	SKIP
	8d2e28e19488992103fdda2685f3f64908c153d256ce545731261bed17cc406c
	35329c631245260dfca4bf64521e748f86547248f8236a617f370bc54485f026
)

prepare() {
	patch -N -i "${srcdir}"/remove-tensor-format.patch stable_diffusion.openvino/demo.py
}

package() {
	install -Dm755 txt2img.sh "$pkgdir/usr/bin/txt2img"
	cd stable_diffusion.openvino
	rm -r .git .gitignore
	install -d "$pkgdir/opt"
	cp -r . "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s "$pkgdir/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

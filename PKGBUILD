# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

# This package ships the DeepBump CLI (cli.py). The Blender add-on part of
# upstream requires the legacy add-on system (bl_info), which Blender 5.x
# from the repos no longer supports (scripts/addons removed), so it is not
# packaged here. Revisit if upstream ports to the Extensions system.
pkgname=deepbump
pkgver=8
pkgrel=1
pkgdesc="Generate normal, height and curvature maps from single pictures with ML (DeepBump CLI)"
arch=('x86_64')
url="https://github.com/HugoTini/DeepBump"
license=('GPL-3.0-or-later')
depends=('python-numpy' 'python-onnxruntime' 'python-imageio')
options=('!debug')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HugoTini/DeepBump/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bca85b5955d2620e39cffa09a3a2f0d9eafb3a79c8c03ede3c4f1d92b8b12f98')

package() {
    cd "DeepBump-${pkgver}"

    local _dir=/usr/share/${pkgname}
    install -dm755 "${pkgdir}${_dir}"
    install -m644 __init__.py cli.py utils.py utils_inference.py \
        module_color_to_normals.py module_normals_to_curvature.py \
        module_normals_to_height.py module_lowres_to_highres.py \
        "${pkgdir}${_dir}/"
    install -m644 deepbump256.onnx upscale256.onnx "${pkgdir}${_dir}/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python3 /usr/share/deepbump/cli.py "$@"
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

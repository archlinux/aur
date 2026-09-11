# Maintainer: komagata
pkgname=screen-lens-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Image-context desktop translation with an Omarchy panel'
arch=('x86_64')
url='https://github.com/komagata/screen-lens'
license=('MIT' 'Apache-2.0')
provides=('screen-lens')
conflicts=('screen-lens')
depends=('python>=3.14' 'python<3.15' 'python-numpy' 'python-opencv'
         'python-pillow' 'python-shapely' 'python-pyclipper' 'python-six'
         'python-omegaconf' 'python-requests' 'python-colorlog' 'python-tqdm'
         'python-flatbuffers' 'python-protobuf' 'python-packaging'
         'python-gobject' 'python-cairo' 'libsecret' 'noto-fonts-cjk'
         'quickshell' 'hyprland' 'grim' 'imagemagick' 'libnotify' 'libgcc')
options=('!strip' '!debug')
_commit=b0eabe7bf28ff8cdfd615b30e87dfdeb7b096dce
source=("screen-lens-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'ort.whl::https://files.pythonhosted.org/packages/65/54/9f197c578d3d3d7bea16971e233e5483981228eec73748585cf7b5933403/onnxruntime-1.29.0-cp314-cp314-manylinux_2_28_x86_64.whl'
        'rapid.whl::https://files.pythonhosted.org/packages/55/ed/0ee9b9281986974be9d2406ae0134c8d7c91d2fc613f16ffda9701eeda6f/rapidocr-3.9.2-py3-none-any.whl'
        'https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.9.2/onnx/PP-OCRv5/det/ch_PP-OCRv5_det_mobile.onnx'
        'https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.9.2/onnx/PP-OCRv6/rec/PP-OCRv6_rec_small.onnx'
        'https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.9.2/onnx/PP-OCRv4/cls/ch_ppocr_mobile_v2.0_cls_mobile.onnx')
noextract=('ort.whl' 'rapid.whl')
sha256sums=('1090f90c10bf262f2719d54842774476d28a7565e44640fec0180d2dba47e206'
            '6c0c37b92f67ed68dd36221ce0403e1d9bd4f7efce724439978a2597848530e5'
            '04d6b8d151f823d930bd91910555f57bea897c0c44fa6794267b94cf9c1ef9a0'
            '4d97c44a20d30a81aad087d6a396b08f786c4635742afc391f6621f5c6ae78ae'
            '6f327246b50388f3c176ae304bd95767ea6dc0c9ae92153ef8cbe210b3c14884'
            'e47acedf663230f8863ff1ab0e64dd2d82b838fceb5957146dab185a89d6215c')

package() {
  local app="$pkgdir/usr/lib/screen-lens"
  local tree="$srcdir/screen-lens-$_commit"
  install -d "$app/runtime" "$app/models" "$pkgdir/usr/bin"
  for file in "$tree"/*.py; do
    [[ ${file##*/} == test_* ]] || install -m644 "$file" "$app/"
  done
  install -m644 "$tree"/*.qml "$tree/manifest.json" "$app/"
  cp -r "$tree/panel" "$tree/assets" "$app/"
  bsdtar -xf "$srcdir/ort.whl" -C "$app/runtime"
  bsdtar --exclude 'rapidocr/models/*' -xf "$srcdir/rapid.whl" -C "$app/runtime"
  install -m644 "$srcdir"/*.onnx "$app/models/"
  printf '%s\n' '{"python":[3,14],"profile":"v5-v6"}' > "$app/runtime-manifest.json"
  touch "$app/system-package"
  install -m755 "$tree/packaging/arch/screen-lens" "$pkgdir/usr/bin/screen-lens"
  install -Dm644 "$tree/packaging/arch/screen-lens.desktop" "$pkgdir/usr/share/applications/screen-lens.desktop"
  install -Dm644 "$tree/assets/languages.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/screen-lens.svg"
  install -Dm644 "$tree/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$tree/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  chmod -R go-w "$app"
}

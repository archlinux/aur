# Maintainer: zer0def <zer0def@github>
pkgname=lens-bin
pkgver=4.0.2
pkgrel=1
pkgdesc='The Kubernetes IDE (previously Kontena Lens)'
arch=('x86_64')
url='https://k8slens.dev'
license=('MIT')
depends=('libxss' 'libxtst')
provides=('lens')
conflicts=('lens')

source=(
  "https://github.com/lensapp/lens/releases/download/v${pkgver}/Lens-${pkgver}.AppImage"
  "lens.desktop"
  "lens.sh"
)
sha512sums=(
  '5bf5b4a49d9f6327b108f74077f9f30ba0e8da960468d41afbcdf89aba4b87f98bbdf6dc102214f5d83f9c264bebb8a7d62b10aa5db57ed59f896c8e7d321347'
  'ff81d0bfd155766462b1a7b37fe1aed4cb1b80b5afe2310a922a94b4f8801e104fde56d279fe5944dcd36dff38650b0d83bc99d11613a4dc87064a952a2b9364'
  '382f51df6df222dee97021cc0dc2eca76dd510f32461da836a9265fad28549be43e272e7b36a65332e7bd53beb27128e1b0379b430a4f07ad327e14cea3596a1'
)

prepare() {
  chmod +x "Lens-${pkgver}.AppImage"
  "./Lens-${pkgver}.AppImage" --appimage-extract &>/dev/null
}

package() {
  install -d "${pkgdir}/opt"
  cp -a "${srcdir}/squashfs-root" "${pkgdir}/opt/lens"

  install -Dm644 squashfs-root/kontena-lens.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/kontena-lens.png
  rm -rf "${pkgdir}/opt/lens/usr"
  
  install -Dm644 "${srcdir}/lens.desktop" "${pkgdir}/usr/share/applications/lens.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/squashfs-root/resources/LICENSE" \
    "${srcdir}/squashfs-root/LICENSE.electron.txt" \
    "${srcdir}/squashfs-root/LICENSES.chromium.html"
  install -Dm755 "${srcdir}/lens.sh" "${pkgdir}/usr/bin/lens"
  chmod -R a+rx "${pkgdir}/opt/lens"
}

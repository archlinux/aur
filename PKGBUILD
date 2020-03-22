# Maintainer: David Runge <dvzrv@archlinux.org>

_name=helm
pkgname=helm-synth
pkgver=0.9.0
pkgrel=8
pkgdesc="A cross-platform, polyphonic synthesizer, available standalone and as an LV2 plugin"
arch=('x86_64')
url="https://tytel.org/helm/"
license=('GPL3')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxext' 'libxinerama')
makedepends=('alsa-lib' 'freetype2' 'jack' 'libxcursor' 'lv2')
replaces=('helm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mtytel/${_name}/archive/v${pkgver}.tar.gz"
        "${pkgname}-0.9.0-gcc91.patch"
        "${pkgname}-0.9.0-rename_helm-synth.patch")
sha512sums=('241c6bf3aec422e9ccaf7c7113eec7e30a11baadd30fe8f05f0abfac9c41d0c8a9fb284f0cae49bcaf0d3d08aa952737f6ff3eb7d48c2b2e22c60932738aeaa4'
            '4c12575c6a58c6a03644b9c7d560e3a794fa3575ac10eb9301ca911a58a86eb5c721f0e4c8c1c5bfcf81b6efba25ed7bdba2a12fe68ec49eb18581067cec06bb'
            '99df61242d6fd5629440c72210c541f3ce0e711190ab2472ebc066a9044d79499c657c9554b39570867a95e061da3c32ceefce3706e84fc6b4cb540e59289607')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  # gcc > 9.1 fixes:
  # https://github.com/mtytel/helm/pull/233
  patch -Np1 -i "../${pkgname}-0.9.0-gcc91.patch"
  # rename to helm-synth as (kubernetes) helm will be in the repos
  patch -Np1 -i "../${pkgname}-0.9.0-rename_helm-synth.patch"
  # prevent from linking against libcurl.so for no reason
  sed -e 's/libcurl //g' \
      -i {builds/linux/{LV2,VST},standalone/builds/linux}/Makefile*
}

build() {
  cd "${pkgname}-${pkgver}"
  make CONFIG='Release' \
       PREFIX="/usr" \
       standalone lv2 vst
}

package() {
  depends+=('libasound.so' 'libfreetype.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" \
       VSTDIR="${pkgdir}/usr/lib/vst" \
       install_standalone install_lv2 install_vst
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

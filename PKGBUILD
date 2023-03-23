# Maintainer: David Runge <dvzrv@archlinux.org>

_name=helm
pkgbase=helm-synth
pkgname=(helm-synth helm-synth-{common,lv2,standalone,vst})
pkgver=0.9.0
pkgrel=10
pkgdesc="A cross-platform, polyphonic synthesizer, available standalone and as an LV2 plugin"
arch=(x86_64)
url="https://tytel.org/helm/"
license=(GPL3)
makedepends=(
  alsa-lib
  freetype2
  hicolor-icon-theme
  jack
  libxcursor
  libglvnd
  libx11
  libxext
  libxinerama
  lv2
)
source=(
  https://github.com/mtytel/$_name/archive/v$pkgver/$_name-v$pkgver.tar.gz
  $pkgname-0.9.0-gcc91.patch
  $pkgname-0.9.0-rename_helm-synth.patch
)
sha512sums=('241c6bf3aec422e9ccaf7c7113eec7e30a11baadd30fe8f05f0abfac9c41d0c8a9fb284f0cae49bcaf0d3d08aa952737f6ff3eb7d48c2b2e22c60932738aeaa4'
            '4c12575c6a58c6a03644b9c7d560e3a794fa3575ac10eb9301ca911a58a86eb5c721f0e4c8c1c5bfcf81b6efba25ed7bdba2a12fe68ec49eb18581067cec06bb'
            '99df61242d6fd5629440c72210c541f3ce0e711190ab2472ebc066a9044d79499c657c9554b39570867a95e061da3c32ceefce3706e84fc6b4cb540e59289607')
b2sums=('1b6811f32cf36a1c1f954cc071cd64f3dca656ee0bd420c01d0be3db516210a92adc3694ac49731cf2d7cf057a9eccf2c2dcefc14d24cf8582a3eb69efe1d0e1'
        '54c3c5baf336ee1c2739922be6040d69309db94394967be335103fe325c96afe69f05fbdde0516c153bc47763fc3686c9e0461c6b12dbec59476c85a003e4397'
        'c95fb6c4080a47bf2a137d986c62f0510b021bafd89b1c9d2f8662f9ad9f086b7d5f7cb08a3dd65ef43f6bc119695ebbda132acc33972454a0d82a05578d48f5')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  # gcc > 9.1 fixes:
  # https://github.com/mtytel/helm/pull/233
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.9.0-gcc91.patch
  # rename to helm-synth as (kubernetes) helm will be in the repos
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.9.0-rename_helm-synth.patch
  # prevent from linking against libcurl.so for no reason
  sed -e 's/libcurl //g' -i $_name-$pkgver/{builds/linux/{LV2,VST},standalone/builds/linux}/Makefile*
}

build() {
  local make_options=(
    CONFIG=Release
    PREFIX=/usr
    standalone
    lv2
    vst
    -C $_name-$pkgver
  )

  make "${make_options[@]}"
}

package_helm-synth() {
  local make_options=(
    DESTDIR="$pkgdir/"
    VSTDIR="$pkgdir/usr/lib/vst"
    install_lv2
    install_standalone
    install_vst
    -C $_name-$pkgver
  )
  depends=(
    $pkgbase-lv2=$pkgver
    $pkgbase-standalone=$pkgver
    $pkgbase-vst=$pkgver
  )

  make "${make_options[@]}"

  (
    cd "$pkgdir"

    # make sure that find-libdeps is able to find dependencies:
    # https://gitlab.archlinux.org/archlinux/devtools/-/issues/102
    find usr/lib/lv2 -type f -iname "*.so" -exec chmod +x {} \;

    _pick $pkgbase-common usr/share/doc
    _pick $pkgbase-common usr/share/$pkgbase

    _pick $pkgbase-lv2 usr/lib/lv2

    _pick $pkgbase-standalone usr/bin
    _pick $pkgbase-standalone usr/share/{applications,icons,man}

    _pick $pkgbase-vst usr/lib/vst
  )
}

package_helm-synth-common() {
  pkgdesc+=" - common files"
  
  mv -v $pkgname/* "$pkgdir"
}

package_helm-synth-lv2() {
  pkgdesc+=" - LV2 plugin"
  groups=(
    pro-audio
    lv2-plugins
  )

  depends+=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common
    libglvnd
    libx11
    libxext
    libxinerama
    lv2-host
  )

  mv -v $pkgname/* "$pkgdir"
}

package_helm-synth-standalone() {
  pkgdesc+=" - standalone"
  groups=(
    pro-audio
  )
  depends=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common
    hicolor-icon-theme
    libglvnd
    libx11
    libxext
    libxinerama
  )

  mv -v $pkgname/* "$pkgdir"
}

package_helm-synth-vst() {
  pkgdesc+=" - VST plugin"
  groups=(
    pro-audio
    vst-plugins
  )
  depends=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common
    libglvnd
    libx11
    libxext
    libxinerama
    vst-host
  )

  mv -v $pkgname/* "$pkgdir"
}

pkgbase=ot-bboi
pkgname=("${pkgbase}-docs" "${pkgbase}-clap" "${pkgbase}-vst3" "${pkgbase}-standalone")
pkgver=1.0.1
pkgrel=2
pkgdesc='A drum machine inspired by the Casio Rapman sound toys'
arch=('x86_64')
url='https://punklabs.com/ot-bboi'
license=('GPL-3.0-or-later')
groups=('pro-audio')
_common_depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'xcb-util-wm'
)
makedepends=(
  'alsa-lib'
  'rust'
  'jack'
  'python'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'xcb-util-wm'
)
source=(
  "$pkgbase-$pkgver.zip::https://punklabs.com/content/projects/ot-bboi/downloads/OneTrickBBOI-Source-v$pkgver.zip"
  "$pkgbase-$pkgver-UserGuide.pdf::https://punklabs.com/content/projects/ot-bboi/downloads/OneTrick%20B-BOI%20User%20Guide.pdf"
)
sha512sums=('e30a61fa9354d0d72129b8dd1119d4fa932db0abc940ef09a3bd6a6d7401d85c8d1be0083a12d70dd1a2955da8500f3364614d0f8e6fb0691148681df2b33aab'
            'd18cb86d92e2385ed7107c4e1ef55d103fb6edc7b4af43630054e45373f807959850fe2a7ddf2367b0f97023d416c831de84860dd3e5943123a30aeb0fb82b73')
b2sums=('66df75a73ee5061e9d0c585f3a095606227e2a344cc5d2c3d58a461d44f07a046fc004be8fa31784b83ef87047c3bd16f47e9f706f15c697941ec32df0ffa5e5'
        '157d4cc6ea40af014846e5c044215564ef3e78e853203882adcb8ca7ca0466a3814f5147e98dcbab05d67351aee22cd88ad3ce188949f6e1702f313a3a3737aa')

prepare() {
  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cargo xtask bundle onetrick_bboi --release
}

package_ot-bboi-docs() {
  pkgdesc+=' - documentation'

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" ./*.txt
  install -vDm644 "$pkgbase-$pkgver-UserGuide.pdf" "$pkgdir/usr/share/doc/$pkgbase/UserGuide.pdf"
}

package_ot-bboi-clap() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )
  optdepends=('ot-bboi-docs: documentation')

  install -vDm644 -t "$pkgdir/usr/lib/clap" target/bundled/OneTrick\ B-BOI.clap
}

package_ot-bboi-vst3() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )
  optdepends=('ot-bboi-docs: documentation')

  install -vd "$pkgdir/usr/lib/vst3"
  cp -vr target/bundled/OneTrick\ B-BOI.vst3 "$pkgdir/usr/lib/vst3"
}

package_ot-bboi-standalone() {
  pkgdesc+=' - standalone'
  depends=("${_common_depends[@]}")
  optdepends=(
    'jack: audio backend'
    'alsa-lib: audio-backend'
    'ot-bboi-docs: documentation'
  )

  install -vDm755 -t "$pkgdir/usr/bin" target/bundled/OneTrick\ B-BOI
}


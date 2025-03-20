pkgbase=ot-chonk
pkgname=("${pkgbase}-docs" "${pkgbase}-clap" "${pkgbase}-vst3" "${pkgbase}-standalone")
pkgver=1.0.0
pkgrel=2
pkgdesc='A classic, physically modeled electric bass monosynth'
arch=('x86_64')
url='https://punklabs.com/ot-chonk'
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
  "$pkgbase-$pkgver.zip::https://punklabs.com/content/projects/ot-chonk/downloads/OneTrickCHONK-Source-v$pkgver.zip"
  "$pkgbase-$pkgver-UserGuide.pdf::https://punklabs.com/content/projects/ot-chonk/downloads/OneTrick%20CHONK%20User%20Guide.pdf"
)
sha512sums=('d9e26848b6da1cf8b402df8f7817f16bc3c7741ce54ae92a6c8b2bfe68f3ef91a2e7dcebfa45676470666cbfda84fc8b31d3ee6ddbb142f23918008ce88b09c2'
            'ced2b017d85e54a6fa58718f24a209e5f69c9e8a3c8f95b6704586df1c01c19c1332901f8368ba3d96db4df4597f326e4625e2412a698fe3c43f857b340b8fad')
b2sums=('b8a83351fa8a15376797dd8b79d387787ee7eb3cbb3be93e9f293f519bc714b9e1fc3eb9dacbaf099d8e13bd896af30bf14c9b298b484cb4a2b816e7a9a6aa88'
        'a6930a31f301ca1161b089329c362b3ba0cbc9fdbd02dfdbc969df844f9de2676ba8c2daa4de670cdaa09f4a26ebff31e3e36895b01291ae0a791280d6ff3671')

prepare() {
  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cargo xtask bundle onetrick_chonk --release
}

package_ot-chonk-docs() {
  pkgdesc+=' - documentation'

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" ./*.txt
  install -vDm644 "$pkgbase-$pkgver-UserGuide.pdf" "$pkgdir/usr/share/doc/$pkgbase/UserGuide.pdf"
}

package_ot-chonk-clap() {
  pkgdesc+=' - CLAP plugin'
  groups+=('clap-plugins')
  depends=(
    "${_common_depends[@]}"
    'clap-host'
  )
  optdepends=('ot-chonk-docs: documentation')

  install -vDm644 -t "$pkgdir/usr/lib/clap" target/bundled/OneTrick\ CHONK.clap
}

package_ot-chonk-vst3() {
  pkgdesc+=' - VST3 plugin'
  groups+=('vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )
  optdepends=('ot-chonk-docs: documentation')

  install -vd "$pkgdir/usr/lib/vst3"
  cp -vr target/bundled/OneTrick\ CHONK.vst3 "$pkgdir/usr/lib/vst3"
}

package_ot-chonk-standalone() {
  pkgdesc+=' - standalone'
  depends=("${_common_depends[@]}")
  optdepends=(
    'jack: audio backend'
    'alsa-lib: audio-backend'
    'ot-chonk-docs: documentation'
  )

  install -vDm755 -t "$pkgdir/usr/bin" target/bundled/OneTrick\ CHONK
}

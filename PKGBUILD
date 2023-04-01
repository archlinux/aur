# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=ninjas2
pkgname=(ninjas2 ninjas2-{lv2,standalone,vst})
pkgver=0.2.0
pkgrel=3
pkgdesc="A sample slicer audio plugin"
arch=(x86_64)
url="https://github.com/rghvdberg/ninjas2"
license=(GPL3)
makedepends=(
  aubio
  gendesk
  jack
  libsamplerate
  libsndfile
)
checkdepends=(lv2lint)
source=(
  $url/releases/download/v$pkgver/$pkgname-v$pkgver-source.zip
  $pkgbase-0.2.0-devendor_aubio.patch
)
sha512sums=('b05c4d2eaba91a1104cb2700b857e0b428a9bb574973616c1477a6c993c6290bb31343f071d0607c0d6c21830fd29523d814aff2bb12442a8ca45e06efd75506'
            '36e73831866ef1167f0f12eb9b808e90bceb0501f3a0c7d3d66007a903ce287e820630e21c0fffac620e0bd49cd67131b8a66a467c576151c6751b82fb600ea0')
b2sums=('aac12947bbb217b22a81a6c53801cfd39e11ed37fbc63b5882825b918d5033517f62cd1c8479cd87e6af5410f78e1481eb28e0b73f6afa21c49a837829fdb218'
        '70f52daef1c3621ba9707c3465287e50383135a0d4c52db11df23e624e2278e3c31e8f73bb66573bc797b95999dd57dd3223750589361bdd8828568d2119bd74')

prepare() {
  gendesk -n \
          --pkgname $pkgname \
          --name "Ninjas2" \
          --genericname "Sample Slicer" \
          --categories "AudioVideo;Audio"

  # devendor aubio
  patch -Np1 -d $pkgbase-v$pkgver -i ../$pkgbase-0.2.0-devendor_aubio.patch
}

build() {
  make -C $pkgbase-v$pkgver
}

check() {
  local lv2lint_options=(
    -Mpack
    # disable tests that are broken due to upstream
    # https://github.com/clearly-broken-software/ninjas2/issues/76
    -t "Plugin Symbols"
    -t "Port Properties"
    -t "UI Symbols"
    -t "Plugin License"
    -I "$pkgbase-v$pkgver/bin/$pkgbase.lv2/"
    "$url"
  )
  lv2lint "${lv2lint_options[@]}"
}

package_ninjas2() {
  depends=(
    ninjas2-{lv2,standalone,vst}
  )
}

package_ninjas2-lv2() {
  pkgdesc+=" - LV2 plugin"
  groups=(
    lv2-plugins
    pro-audio
  )
  depends=(
    aubio libaubio.so
    gcc-libs
    glibc
    libglvnd
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libx11
    lv2-host
  )

  install -vDm 755 $pkgbase-v$pkgver/bin/$pkgbase.lv2/*.so -t "$pkgdir/usr/lib/lv2/$pkgbase.lv2/"
  install -vDm 644 $pkgbase-v$pkgver/bin/$pkgbase.lv2/*.ttl -t "$pkgdir/usr/lib/lv2/$pkgbase.lv2/"
}

package_ninjas2-standalone() {
  pkgdesc+=" - JACK standalone"
  groups=(
    pro-audio
  )
  depends=(
    aubio libaubio.so
    gcc-libs
    glibc
    jack
    libglvnd
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libx11
  )

  install -vDm 755 $pkgbase-v$pkgver/bin/$pkgbase -t "$pkgdir/usr/bin/"
  install -vDm 644 $pkgbase.desktop -t "$pkgdir/usr/share/applications/"
}

package_ninjas2-vst() {
  pkgdesc+=" - VST plugin"
  groups=(
    vst-plugins
    pro-audio
  )
  depends=(
    aubio libaubio.so
    gcc-libs
    glibc
    libglvnd
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libx11
    vst-host
  )

  install -vDm 755 $pkgbase-v$pkgver/bin/$pkgbase-vst.so -t "$pkgdir/usr/lib/vst/"
}


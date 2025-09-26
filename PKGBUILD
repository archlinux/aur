# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgbase=yabridge-wine10-git
pkgname=(
  yabridge-wine10-git
  yabridgectl-wine10-git
)
_vst3sdk_commit=3ff02a8fb91f8e14f61c4e26130841b51d601575
_bundled_vst3sdk=1
pkgver=r3077.42e0794d
pkgrel=1
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux (git version branch=new-wine10-embedding)"
arch=(x86_64)
url="https://github.com/robbert-vdh/yabridge"
license=(GPL-3.0-or-later)
makedepends=(
  asio
  bitsery
  clap
  cmake
  function2
  ghc-filesystem
  git
  libxcb
  meson
  rust
  tomlplusplus
  wine
)
if (( _bundled_vst3sdk == 0 )); then
  makedepends+=(vst3sdk)
fi
options=(!lto)
source=(
  "git+$url#branch=new-wine10-embedding"
  $pkgbase-vst3sdk::git+https://github.com/robbert-vdh/vst3sdk.git#commit=$_vst3sdk_commit
  $pkgbase-vst3_base::git+https://github.com/steinbergmedia/vst3_base.git
  $pkgbase-vst3_pluginterfaces::git+https://github.com/steinbergmedia/vst3_pluginterfaces.git
  $pkgbase-vst3_public_sdk::git+https://github.com/steinbergmedia/vst3_public_sdk.git
)
sha512sums=('SKIP'
            '39d8b7188aa5b07442e9bf998644bce5d54e3c30000dbf3922cee76c4864e859ff850abe6699d178399948d3d73f3b4a639738429320aa2ebc4b1e0c85d63792'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('SKIP'
        '3f09ff6929db53a5387661be68a363726edbd966346605444191e791565cf596503e9f88138b7921d15366d1aa1688a41730e3d4163bdc694448269855d982a9'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd yabridge
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  pushd yabridge > /dev/null

  # remove version pinning
  sed -e "s/'==/'>=/" -i meson.build
  sed -e "s/, '<1.2'//" -i meson.build
  popd > /dev/null

  # remove all wraps
  rm -rv yabridge/subprojects/*
  mkdir -vp yabridge/subprojects/vst3

  if (( _bundled_vst3sdk == 1 )); then
    (
      cd $pkgbase-vst3sdk
      git submodule init
      git config submodule.base.url "$srcdir/$pkgbase-vst3_base"
      git config submodule.pluginterfaces.url "$srcdir/$pkgbase-vst3_pluginterfaces"
      git config submodule.publik.sdk.url "$srcdir/$pkgbase-vst3_public_sdk"
      git -c protocol.file.allow=always submodule update
    )
    cp -av $pkgbase-vst3sdk/* yabridge/subprojects/vst3/
  else
    cp -av /usr/src/vst3sdk/* yabridge/subprojects/vst3/
    cp -v $pkgbase-vst3sdk/meson.build yabridge/subprojects/vst3/meson.build
  fi

  cd yabridge/tools/yabridgectl
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  local meson_options=(
    --cross-file=yabridge/cross-wine.conf
    -D bitbridge=false
    -D build.cpp_std=c++20
    -D b_lto=false
    -D b_pie=false
    -D build.cpp_link_args="$LDFLAGS"
    -D cpp_link_args="$LDFLAGS -mwindows"
  )

  arch-meson yabridge build "${meson_options[@]}"
  ninja -C build

  cd yabridge/tools/yabridgectl
  cargo build --frozen --release --all-features
}

package_yabridge-wine10-git() {
  groups=(pro-audio)
  depends=(
    gcc-libs
    glibc
    libxcb
    sh
    wine
  )
  optdepends=(
    'libnotify: for notification integration'
    'yabridgectl-wine10-git: for optional setup and management utility'
  )
  provides=(yabridge)
  conflicts=(yabridge)

  install -vDm 755 build/yabridge-host.exe{,.so} -t "$pkgdir/usr/bin"
  install -vDm 755 build/libyabridge-{,chainloader-}{clap,vst2,vst3}.so -t "$pkgdir/usr/lib/"
}

package_yabridgectl-wine10-git() {
  depends=(
    gcc-libs
    glibc
  )
  provides=(yabridgectl)
  conflicts=(yabridgectl)

  pkgdesc="Optional utility to help set up and manage yabridge (git version)"

  install -vDm 755 yabridge/tools/yabridgectl/target/release/yabridgectl -t "$pkgdir/usr/bin"
}

# Maintainer: AdrianoML <com gmail adriano.lols>
# Contributor: script from the official package: David Runge <dvzrv@archlinux.org>

pkgbase=lsp-plugins-git
_gitname=lsp-plugins
pkgname=(lsp-plugins-git lsp-plugins-{clap,docs,ladspa,lv2,standalone,vst}-git liblsp-r3d-glx-lib-git)
pkgver=1.2.14.r16.gd0d3b2f8
pkgrel=1
pkgdesc="Collection of open-source plugins"
arch=(x86_64)
url="https://lsp-plug.in"
license=(LGPL-3.0-or-later)
makedepends=(
  cairo
  gcc-libs
  glibc
  hicolor-icon-theme
  libglvnd
  libx11
  libxrandr
  jack
  ladspa
  libsndfile
  lv2
  php
)
checkdepends=(
  jq
  lv2lint
)
source=("git+https://github.com/lsp-plugins/lsp-plugins#branch=devel")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
    cd "$_gitname"
	git describe --long --tags | sed 's/^sdk-//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  local config_options=(
    config
    VERBOSE=1
    ARTIFACT_EXPORT_HEADERS=1
    FEATURES='clap doc lv2 vst2 jack ladspa xdg'
    PREFIX=/usr
    -C $_gitname
  )

  make clean -C $_gitname
  make "${config_options[@]}"
  make fetch -C $_gitname
  make VERBOSE=1 -C $_gitname
}

check() {
  local _plugin
  local _lv2_uri="http://lsp-plug.in/plugins/lv2/"

  # install to temporary location
  make FEATURES=lv2 DESTDIR="$PWD/test" install -C $_gitname

  for _plugin in $(jq -r '.plugins[].id' $_gitname/.build/target/lsp-plugin-fw/plugins.json); do
    printf "Testing plugin %s\n" "$_plugin"
    lv2lint -Mpack -I "$PWD/test/usr/lib/lv2/$pkgname.lv2/" $_lv2_uri$_plugin
  done
}

package_lsp-plugins-git() {
  depends=($_gitname-{clap,ladspa,lv2,standalone,vst}-git)
  optdepends=(
    'lsp-plugins-docs-git: for documentation'
  )
  conflicts=(lsp-plugins)
  provides=(lsp-plugins)

  make PREFIX=/usr DESTDIR="$pkgdir" install -C $_gitname
  printf "successfully installed to pkgdir\n"

  (
    cd "$pkgdir"
    _pick liblsp-r3d-glx-lib-git usr/include/*
    _pick liblsp-r3d-glx-lib-git usr/lib/liblsp*
    _pick liblsp-r3d-glx-lib-git usr/lib/pkgconfig/*
    _pick $_gitname-clap-git usr/lib/clap/*
    _pick $_gitname-docs-git usr/share/doc/*
    _pick $_gitname-ladspa-git usr/lib/ladspa/*
    _pick $_gitname-lv2-git usr/lib/lv2/*
    _pick $_gitname-standalone-git etc/*
    _pick $_gitname-standalone-git usr/bin/*
    _pick $_gitname-standalone-git usr/lib/$_gitname/*
    _pick $_gitname-standalone-git usr/share/applications/*
    _pick $_gitname-standalone-git usr/share/desktop-directories/*
    _pick $_gitname-standalone-git usr/share/icons/*
    _pick $_gitname-vst-git usr/lib/vst/*
  )
}

package_liblsp-r3d-glx-lib-git() {
  pkgdesc="GLX-based 3D backend library for rendering scenes"
  depends=(
    gcc-libs
    glibc
    libglvnd libGL.so
    libx11
  )
  conflicts=(liblsp-r3d-glx-lib)
  provides=(liblsp-r3d-glx-lib)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-clap-git() {
  pkgdesc+=" - CLAP"
  groups=(clap-plugins)
  depends=(
    cairo
    clap-host
    freetype2
    gcc-libs
    glibc
    liblsp-r3d-glx-lib-git=$pkgver
    libsndfile libsndfile.so
    libx11
    libxrandr
  )
  conflicts=(lsp-plugins-clap)
  provides=(lsp-plugins-clap)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-docs-git() {
  pkgdesc+=" (documentation)"
  conflicts=(lsp-plugins-docs)
  provides=(lsp-plugins-docs)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-ladspa-git() {
  pkgdesc+=" - LADSPA"
  groups=(ladspa-plugins)
  depends=(
    gcc-libs
    glibc
    ladspa-host
    liblsp-r3d-glx-lib-git=$pkgver
    libsndfile libsndfile.so
  )
  conflicts=(lsp-plugins-ladspa)
  provides=(lsp-plugins-ladspa)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-lv2-git() {
  pkgdesc+=" - LV2"
  groups=(lv2-plugins)
  depends=(
    cairo
    freetype2
    gcc-libs
    glibc
    lv2-host
    liblsp-r3d-glx-lib-git=$pkgver
    libsndfile libsndfile.so
    libx11
    libxrandr
  )
  conflicts=(lsp-plugins-lv2)
  provides=(lsp-plugins-lv2)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-standalone-git() {
  pkgdesc+=" - JACK standalone"
  groups=(pro-audio)
  depends=(
    cairo
    freetype2
    gcc-libs
    glibc
    hicolor-icon-theme
    jack libjack.so
    liblsp-r3d-glx-lib-git=$pkgver
    libsndfile libsndfile.so
    libx11
    libxrandr
  )
  conflicts=(lsp-plugins-standalone)
  provides=(lsp-plugins-standalone)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-vst-git() {
  pkgdesc+=" - VST2"
  groups=(vst-plugins)
  depends=(
    cairo
    freetype2
    gcc-libs
    glibc
    liblsp-r3d-glx-lib-git=$pkgver
    libsndfile libsndfile.so
    libx11
    libxrandr
    vst-host
  )
  conflicts=(lsp-plugins-vst)
  provides=(lsp-plugins-vst)

  mv -v $pkgname/* "$pkgdir"
}

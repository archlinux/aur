# Maintainer: AdrianoML <com gmail adriano.lols>
# Contributor: David Runge <dvzrv@archlinux.org>
# modified from the official package by David Runge

pkgbase=lsp-plugins-git
_gitname=lsp-plugins
pkgname=(
  lsp-plugins{,-{clap,docs,gst,ladspa,lv2,standalone,vst,vst3}}-git
  liblsp-{audio-{jack,pipewire},r3d-glx}-lib-git
)
pkgver=1.2.37.r3.g50743656
pkgrel=1
pkgdesc="Collection of open-source plugins"
arch=(x86_64)
url="https://lsp-plug.in"
license=(LGPL-3.0-or-later)
makedepends=(
  cairo
  gcc-libs
  glibc
  gstreamer
  gst-plugins-base
  hicolor-icon-theme
  libglvnd
  libx11
  libxrandr
  jack
  ladspa
  libsndfile
  libpipewire
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
    FEATURES='clap doc gst jack ladspa launcher lv2 pipewire standalone ui vst2 vst3 xdg'
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
    lv2lint -Mpack -I "$PWD/test/usr/lib/lv2/$_gitname.lv2/" $_lv2_uri$_plugin
  done
}

package_lsp-plugins-git() {
  depends=($_gitname-{clap,gst,ladspa,lv2,standalone,vst,vst3}-git)
  optdepends=(
    'lsp-plugins-docs-git: for documentation'
  )
  conflicts=(lsp-plugins)
  provides=(lsp-plugins)

  make PREFIX=/usr DESTDIR="$pkgdir" install -C $_gitname
  printf "successfully installed to pkgdir\n"

  (
    cd "$pkgdir"
    _pick liblsp-audio-jack-lib-git usr/include/lsp-plug.in/audio/jack/*
    _pick liblsp-audio-jack-lib-git usr/lib/liblsp-audio-jack-*
    _pick liblsp-audio-jack-lib-git usr/lib/pkgconfig/lsp-audio-jack-lib.pc
    _pick liblsp-audio-pipewire-lib-git usr/include/lsp-plug.in/audio/pipewire/*
    _pick liblsp-audio-pipewire-lib-git usr/lib/liblsp-audio-pipewire-*
    _pick liblsp-audio-pipewire-lib-git usr/lib/pkgconfig/lsp-audio-pipewire-lib.pc
    _pick liblsp-r3d-glx-lib-git usr/include/lsp-plug.in/r3d/*
    _pick liblsp-r3d-glx-lib-git usr/lib/liblsp-r3d-glx-lib*
    _pick liblsp-r3d-glx-lib-git usr/lib/pkgconfig/lsp-r3d-glx-lib.pc
    _pick $_gitname-clap-git usr/lib/clap/*
    _pick $_gitname-docs-git usr/share/doc/*
    _pick $_gitname-gst-git usr/lib/gstreamer-1.0/*
    _pick $_gitname-gst-git usr/lib/lsp-plugins/liblsp-plugins-gstreamer-*.so
    _pick $_gitname-ladspa-git usr/lib/ladspa/*
    _pick $_gitname-lv2-git usr/lib/lv2/*
    _pick $_gitname-standalone-git usr/bin/*
    _pick $_gitname-standalone-git usr/lib/$_gitname/*
    _pick $_gitname-standalone-git usr/share/applications/*
    _pick $_gitname-standalone-git usr/share/icons/*
    _pick $_gitname-vst-git usr/lib/vst/*
    _pick $_gitname-vst3-git usr/lib/vst3/*
  )

  rm -rv "$pkgdir/etc"
  rm -rv "$pkgdir/usr"
}

package_liblsp-r3d-glx-lib-git() {
  pkgdesc="GLX-based 3D backend library for rendering scenes"
  depends=(
    glibc
    libglvnd libGL.so
    libx11
  )
  conflicts=(liblsp-r3d-glx-lib)
  provides=(liblsp-r3d-glx-lib)

  mv -v $pkgname/* "$pkgdir"
}

package_liblsp-audio-jack-lib-git() {
  pkgdesc="Audio backend for JACK"
  depends=(
    glibc
    jack libjack.so
  )

  conflicts=(liblsp-audio-jack-lib)
  provides=(liblsp-audio-jack-lib)

  mv -v $pkgname/* "$pkgdir"
}

package_liblsp-audio-pipewire-lib-git() {
  pkgdesc="Audio backend for PipeWire"
  depends=(
    glibc
    libpipewire libpipewire-0.3.so
  )

  conflicts=(liblsp-audio-pipewire-lib)
  provides=(liblsp-audio-pipewire-lib)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-clap-git() {
  pkgdesc+=" - CLAP"
  groups=(clap-plugins)
  depends=(
    cairo
    clap-host
    fontconfig
    freetype2
    glibc
    libglvnd libGL.so
    libsndfile libsndfile.so
    libstdc++
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

package_lsp-plugins-gst-git() {
  pkgdesc+=" - GStreamer"
  groups=(gstreamer-plugins)
  depends=(
    glib2 libglib-2.0.so libgobject-2.0.so
    glibc
    gstreamer
    gst-plugins-base-libs
    libsndfile libsndfile.so
    libstdc++
  )
  conflicts=(lsp-plugins-gst)
  provides=(lsp-plugins-gst)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-ladspa-git() {
  pkgdesc+=" - LADSPA"
  groups=(ladspa-plugins)
  depends=(
    glibc
    ladspa-host
    libsndfile libsndfile.so
    libstdc++
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
    fontconfig
    freetype2
    glibc
    libglvnd libGL.so
    libsndfile libsndfile.so
    libstdc++
    libx11
    libxrandr
    lv2-host
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
    fontconfig
    freetype2
    glibc
    hicolor-icon-theme
    libglvnd libGL.so
    libsndfile libsndfile.so
    libstdc++
    libx11
    libxrandr
  )
  optdepends=(
    'liblsp-audio-pipewire-lib-git: for PipeWire support'
    'liblsp-audio-jack-lib-git: for JACK support'
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
    fontconfig
    freetype2
    glibc
    libglvnd libGL.so
    libsndfile libsndfile.so
    libstdc++
    libx11
    libxrandr
    vst-host
  )

  conflicts=(lsp-plugins-vst)
  provides=(lsp-plugins-vst)

  mv -v $pkgname/* "$pkgdir"
}

package_lsp-plugins-vst3-git() {
  pkgdesc+=" - VST3"
  groups=(vst3-plugins)
  depends=(
    cairo
    fontconfig
    freetype2
    glibc
    libglvnd libGL.so
    libsndfile libsndfile.so
    libstdc++
    libx11
    libxrandr
    vst3-host
  )

  conflicts=(lsp-plugins-vst3)
  provides=(lsp-plugins-vst3)

  mv -v $pkgname/* "$pkgdir"
}

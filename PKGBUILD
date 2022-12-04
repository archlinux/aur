# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lsp-plugins-noicons
pkgver=1.2.3
pkgrel=2
pkgdesc="Collection of free plugins compatible with LADSPA, LV2 and LinuxVST (without XDG icons)"
arch=(x86_64)
url="https://lsp-plug.in"
license=(LGPL3)
provides=(lsp-plugins)
conflicts=(lsp-plugins)
makedepends=(cairo gcc-libs glibc hicolor-icon-theme libglvnd libx11 libxrandr jack ladspa libsndfile lv2 php)
checkdepends=(jq lv2lint)
source=(https://github.com/sadko4u/${pkgname%-noicons}/releases/download/$pkgver/${pkgname%-noicons}-src-$pkgver.tar.gz)
sha512sums=('1db849ebceffb24540879fcd0971ddd8bffe9a0ecaaebf4b69bf8633a267562bb3eb5cd55dce8b804868d880efdec95b19a312ee017c2a9334b5e764eebbbb30')
b2sums=('c28a4b5cfdbbe5fe42c3f4821ce323cb097b84eddc850f43adcc14e8a9edb2e313236ce44e4eca17dd226c578113a5749d06754deb45a6c2e7c2ff37bfed4fc2')

build() {
  make config VERBOSE=1 FEATURES='lv2 vst2 jack ladspa' PREFIX=/usr -C ${pkgname%-noicons}
  make VERBOSE=1 -C ${pkgname%-noicons}
}

check() {
  local _plugin
  local _lv2_uri="http://lsp-plug.in/plugins/lv2/"

  # install to temporary location
  make FEATURES=lv2 DESTDIR="$PWD/test" install -C ${pkgname%-noicons}

  for _plugin in $(jq -r '.plugins[].id' ${pkgname%-noicons}/.build/target/lsp-plugin-fw/plugins.json); do
    printf "Testing plugin %s\n" "$_plugin"
    lv2lint -Mpack -I "$PWD/test/usr/lib/lv2/${pkgname%-noicons}.lv2/" $_lv2_uri$_plugin
  done
}

package() {
  groups=(ladspa-plugins lv2-plugins pro-audio vst-plugins)
  depends=(cairo gcc-libs glibc hicolor-icon-theme libglvnd libsndfile.so libx11 libxrandr)
  optdepends=(
    'jack: for standalone applications'
    'ladspa-host: for LADSPA plugins'
    'lsp-plugins-docs: for documentation'
    'lv2-host: for LV2 plugins'
    'vst-host: for VST plugins'
  )

  make PREFIX=/usr DESTDIR="$pkgdir" install -C ${pkgname%-noicons}
}

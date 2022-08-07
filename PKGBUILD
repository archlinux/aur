# Maintainer: Miguel Barrio Orsikowsky <megamik79@protonmail.com>

pkgname=(lsp-plugins-noicons)
pkgver=1.2.2
pkgrel=1
pkgdesc="Collection of free plugins compatible with LADSPA, LV2 and LinuxVST (without XDG icons)"
arch=(x86_64)
url="https://lsp-plug.in"
license=(LGPL3)
makedepends=(cairo gcc-libs glibc hicolor-icon-theme libglvnd libx11 libxrandr jack ladspa libsndfile lv2 php)
checkdepends=(jq lv2lint)
provides=(lsp-plugins)
conflicts=(lsp-plugins)
source=(
  https://github.com/sadko4u/${pkgname%-noicons}/releases/download/$pkgver/${pkgname%-noicons}-src-$pkgver.tar.gz
  ${pkgname%-noicons}-1.2.2-default_make_flags.patch
  ${pkgname%-noicons}-1.2.2-lv2_h_include.patch
)
sha512sums=('63a1da2007a91db0e9bed97c26de5c5621b429d801b8d0eaf0e8d26aba2a57631824566e2c0ad48ea5943a5050cc40d4328c30427e4986b85d2878773a51dae1'
            '4b8e3950bb0fd4d5492b283dd93cd585d0577b5c078c343b9a9b3cd60d39ace7884439f97eedb59ad5f3673d0d5e0a2fda7ec955511d542f26ae49fbc7d5b12a'
            '55ac71d022caa3faf4cd1edcc84cf0b1ca90601da176cb1003aeca63985bfc3e0451d152c2c866614e9c1c35483967d6aa843fccc82067114c182bd8fd70d1a0')
b2sums=('4c72745d3aeb81cfddc5aef6214062a26016ea8ee092f9167abf56f602eaf1f9e1e5e113adc679089109180ebfedc9a70ac58df3178027bc2f1054a464337899'
        '1cf5b69d712a3cb8aeeab2a587a5be277af37dea5b2d8d113b4fb94726197361d0e3cfff383d0ba8290e1237455fae990f517766130898e93bfc9619396629d5'
        'd4e1592e395f99e859c008e9b797b72a60fe8b5fff64a2b49289441759b3489e76fbba5546a597e66a858e3b953038f0fddf892022bb190d37d5e8c00acd99b4')

prepare() {
  # fix issues with default CFLAGS/CXXFLAGS: https://github.com/sadko4u/lsp-plugins/issues/257
  patch -Np1 -d ${pkgname%-noicons} -i ../${pkgname%-noicons}-1.2.2-default_make_flags.patch
  # fix lv2.h include path
  patch -Np1 -d ${pkgname%-noicons} -i ../${pkgname%-noicons}-1.2.2-lv2_h_include.patch
}

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

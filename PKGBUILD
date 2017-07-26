# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# ToDo: Enable propretary codec
# Bugs: Permission issue, wants to write to /opt/depot_tools/external_bin chmod -R a+w :/

pkgname=nwjs
pkgver=0.24.0
pkgrel=2
pkgdesc="node-webkit is an app runtime based on Chromium and node.js"
arch=("i686" "x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
makedepends=("depot-tools-git" "libtinfo5")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
source=("nwjs-nw-v${pkgver}.tar.gz::https://github.com/nwjs/nw.js/archive/nw-v${pkgver}.tar.gz"
	"node-nw-v${pkgver}.tar.gz::https://github.com/nwjs/node/archive/nw-v${pkgver}.tar.gz"
	"v8-nw-v${pkgver}.tar.gz::https://github.com/nwjs/v8/archive/nw-v${pkgver}.tar.gz"
	"chromium-nw-v${pkgver}.tar.gz::https://github.com/nwjs/chromium.src/archive/nw-v${pkgver}.tar.gz")
sha512sums=("97ec6f8c1bfd9b5dcec2edaf84a546a7d88572f127fab0dbdda4b85ee5c19caf798fa87cd51b12a3f13fbd3d55dc2b3225dfb27e9b221a280bb7c7039e629f2a"
	    "0d2fdce53635f5109d9a408b8a536f502c73fc724507fd917205919a7456dce8d9de8a32360b44b25c6eadf0d5589af488c3658847deda9fff61f6f86eea41cc"
	    "467556bc39fd3fdc9a6feab79fe6e1364a96b6656ec3d8051defe7ae6b7af37a4044eeb1f3e0bcb5eb14513026fe068110e15ce33ce4bd0a39baad8dc6384431"
	    "0a5008643cfb8f2fe44653dde422a87810c51373edc7314c53517cddb0c0486f0bd8b4c2eb63b01b14771cdf41a624078e6eada50146fd24e98478424ad7a4f3")

prepare() {
  cd "${srcdir}/"

  # Fix forced Python2 requirement
  mkdir -p path
  ln -s /usr/bin/python2 path/python

  # Removing references to git version in build config,
  # since we will use the stable source tarball
  sed -i '/\"\:commit_id\"/d' "nw.js-nw-v${pkgver}/content/nw/BUILD.gn"
}
  
build() {
  cd "${srcdir}/"
  mkdir -p nwjs
  cd nwjs

  export PATH="/opt/depot_tools:$PATH"
  export PATH="${srcdir}/path:$PATH"
  export GYP_DEFINES="target_arch=x64"

  gclient config --name=src https://github.com/nwjs/chromium.src.git@origin/nw24
  gclient sync --with_branch_heads --nohooks

  mv "${srcdir}/nw.js-nw-v${pkgver}" src/content/nw
  mv "${srcdir}/node-nw-v${pkgver}" src/third_party/node-nw
  mv "${srcdir}/v8-nw-v${pkgver}" src/v8

  gclient runhooks

  cd src
  gn gen out/nw --args='is_debug=false is_component_ffmpeg=true target_cpu="x64"'

  GYP_CHROMIUM_NO_ACTION=0 ./build/gyp_chromium -I third_party/node-nw/common.gypi third_party/node-nw/node.gyp

  /usr/bin/ninja -C out/nw nwjs
  /usr/bin/ninja -C out/Release node
  /usr/bin/ninja -C out/nw copy_node
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}

# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nwjs
pkgver=0.33.3
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js"
arch=("i686" "x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
makedepends=("depot-tools-git" "libtinfo5" "python" "perl" "gperf" "nss" "alsa-lib" "gconf" "glib2" "gtk2" "nspr" "ttf-ms-fonts" "freetype2" "cairo" "dbus" "libgnome-keyring")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
source=("nwjs-nw-v${pkgver}.tar.gz::https://github.com/nwjs/nw.js/archive/nw-v${pkgver}.tar.gz"
	"node-nw-v${pkgver}.tar.gz::https://github.com/nwjs/node/archive/nw-v${pkgver}.tar.gz"
	"v8-nw-v${pkgver}.tar.gz::https://github.com/nwjs/v8/archive/nw-v${pkgver}.tar.gz"
	"chromium-nw-v${pkgver}.tar.gz::https://github.com/nwjs/chromium.src/archive/nw-v${pkgver}.tar.gz")
sha512sums=('2250a50e7490a211ca5da8b95721dd87ce0f10ba434a719cfbbe08ce4f8981891e35f9b13d2599ed12838bf84fffba5cb2c7d23b576daab4b35eccd2145a13b5'
            '9c790c8419b58cc5b521553c9df56d10aac305e4b791c2e464dd9c23184865f668f9b1204d402d2d7ab71e2f6c7e31c4ca2f6d2da0a762b06186be69d19251b2'
            '5db3d17f260f5af4c04d60508d3ce9300742e1cf54385d30da1630c771246fc1a93f8ff679e8d1b80c66de25a1336682273f507fa5bc0a59ed993b3aa317c497'
            'ab038c33ad8b3505356fd30f9c9a7a9ce5a36d1a1b68aaab97e705b75c4de371c53fd716031012b9880ff9714c59f0d58a2067d2887a0142269b6a36c36507d7')

prepare() {
  cd "${srcdir}/"

  # Fix forced Python2 requirement
  mkdir -p path
  ln -s /usr/bin/python2 path/python

  # Removing references to git version in build config,
  # since we will use the stable source tarball
  # sed -i '/\"\:commit_id\"/d' "nw.js-nw-v${pkgver}/BUILD.gn"

  # Local copy of depot_tools to manage temporary write permissions
  cp -r /opt/depot_tools .
}
  
build() {
  cd "${srcdir}/"
  mkdir -p nwjs
  cd nwjs

  export PATH="${srcdir}/depot_tools:$PATH"
  export PATH="${srcdir}/path:$PATH"
  export GYP_DEFINES="target_arch=x64"

  gclient config --name=src https://github.com/nwjs/chromium.src.git@origin/nw24
  gclient sync --with_branch_heads --nohooks

  #mv "${srcdir}/nw.js-nw-v${pkgver}" src/content/nw
  #mv "${srcdir}/node-nw-v${pkgver}" src/third_party/node-nw
  #mv "${srcdir}/v8-nw-v${pkgver}" src/v8
  git clone -b nw24 https://github.com/nwjs/node.git src/third_party/node-nw
  git clone -b nw24 https://github.com/nwjs/v8.git src/v8
  git clone -b nw24 https://github.com/nwjs/nw.js.git src/content/nw

  gclient runhooks

  cd src
  gn gen out/nw --args='is_debug=false is_component_ffmpeg=true target_cpu="x64"'

  GYP_CHROMIUM_NO_ACTION=0 ./build/gyp_chromium -I third_party/node-nw/common.gypi third_party/node-nw/node.gyp

  /usr/bin/ninja -C out/nw nwjs

  # Fix some wired compile errors
  find third_party/icu -type f -exec sed -i 's/<math\.h>/<cmath>/g' {} \;
  find third_party/node-nw ! -name 'des_locl.h' -type f -exec sed -i 's/<math\.h>/<cmath>/g' {} \;
  export C_INCLUDE_PATH="${srcdir}/nwjs/src/build/linux/debian_jessie_amd64-sysroot/usr/include/x86_64-linux-gnu"
  export CPLUS_INCLUDE_PATH="${srcdir}/nwjs/src/build/linux/debian_jessie_amd64-sysroot/usr/include/x86_64-linux-gnu"

  /usr/bin/ninja -C out/Release node
  /usr/bin/ninja -C out/nw copy_node
}

package() {
  cd "${srcdir}/nwjs/src"
  install -Ddm755 "${pkgdir}/var/lib/nwjs"
  install -Ddm755 "${pkgdir}/usr/bin"
  cp -r out/nw/{nw,lib,locales,natives_blob.bin,nw_100_percent.pak,nw_200_percent.pak,resources.pak,snapshot_blob.bin,icudtl.dat} "${pkgdir}/var/lib/nwjs/"
  ln -s "/var/lib/nwjs/nw" "${pkgdir}/usr/bin/nw"
}

# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: wowario <wowario[at]protonmail[dot]com>

pkgname=wowlet-git
_pkgname=${pkgname%-git}
pkgver=4.1.1.r2.g330edac
pkgrel=6
pkgdesc='a free Wownero desktop wallet'
arch=('x86_64')
license=('BSD')
url="https://git.wownero.com/wowlet/wowlet"
depends=('openssl' 'readline' 'zeromq' 'hidapi' 'protobuf' 'libusb' 'miniupnpc' 'libgcrypt' 'qrencode' 'expat' 'qt5-base' 'qt5-websockets' 'qt5-svg' 'tor' 'qt5-multimedia')
makedepends=('git' 'cmake' 'boost' 'wownero-seed-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+https://git.wownero.com/wowlet/wowlet"
        "git+https://github.com/KDAB/KDMacTouchBar"
        "git+https://github.com/dlbeer/quirc"
        "git+https://git.wownero.com/wownero/wownero"
        "git+https://github.com/Tencent/rapidjson"
        "git+https://github.com/google/googletest"
        "git+https://github.com/trezor/trezor-common"
        "git+https://github.com/ethereum-lists/tokens"
        "git+https://github.com/monero-project/supercop"
        "git+https://git.wownero.com/wownero/RandomWOW"
        "daemon-gui-crash-fix.patch"
        "miniupnpc-use-gnu-extensions.patch"
        "wownero-include-cstdint.patch")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            9e6b6339e667a8103351ad347a7d99c2cd9b70c22e2d690dfcadfa1aa7dc5909
            4ed7d996e36cf4cb6406ce70042e424f718e32b262b7cbf112fd9fb2708976d2
            f2ff167063ab715e2eedc8bdc2be800519df6a2bb3ebaf6689c84e269cc55f82)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.contrib/KDMacTouchBar.url "$srcdir/KDMacTouchBar"
  git config submodule.contrib/quirc.url "$srcdir/quirc"
  git config submodule.wownero.url "$srcdir/wownero"
  git -c protocol.file.allow=always submodule update
  patch -Np1 < "${srcdir}/daemon-gui-crash-fix.patch" || [ $? -eq 1 ]

  (
    cd wownero
    git submodule init
    git config submodule.external/rapidjson.url "$srcdir/rapidjson"
    git config submodule.external/miniupnp.url "$srcdir/miniupnp"
    git config submodule.external/trezor-common.url "$srcdir/trezor-common"
    git config submodule.external/supercop.url "$srcdir/supercop"
    git config submodule.external/randomwow.url "$srcdir/RandomWOW"
    git -c protocol.file.allow=always submodule update
    patch -Np1 < "${srcdir}/wownero-include-cstdint.patch" || [ $? -eq 1 ]

    (
      cd external/rapidjson
      git submodule init
      git config submodule.thirdparty/gtest.url "$srcdir/googletest"
      git -c protocol.file.allow=always submodule update
    )

    (
      cd external/miniupnp
      patch -Np1 < "${srcdir}/miniupnpc-use-gnu-extensions.patch" || [ $? -eq 1 ]
    )

    (
      cd "$srcdir/trezor-common"
      git submodule init
      git config submodule.defs/ethereum/tokens.url "$srcdir/tokens"
      git -c protocol.file.allow=always submodule update
    )
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  export CFLAGS="-fPIC" CPPFLAGS="-fPIC" CXXFLAGS="-fPIC"
  cmake -DMANUAL_SUBMODULES=1 -DUSE_DEVICE_TREZOR=OFF -DUSE_SINGLE_BUILDDIR=ON -DDEV_MODE=ON -DSTACK_TRACE=OFF -DARCH=x86-64 ..
  make
}

package_wowlet-git() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 build/bin/wowlet "${pkgdir}/usr/bin/wowlet"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 docs/SECURITY.md "${pkgdir}/usr/share/doc/${_pkgname}/SECURITY"
  install -Dm644 docs/HACKING.md "${pkgdir}/usr/share/doc/${_pkgname}/HACKING"
  install -Dm644 src/assets/org.wowlet.wowlet.desktop "${pkgdir}/usr/share/applications/org.wowlet.wowlet.desktop"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -Dm644 src/assets/wowlet.1.gz "${pkgdir}/usr/share/man/man1/wowlet.1.gz"
  install -Dm644 src/assets/images/appicons/wowlet.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wowlet.svg"
  install -Dm644 src/assets/images/appicons/48x48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/wowlet.png"
  install -Dm644 src/assets/images/appicons/64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/wowlet.png"
  install -Dm644 src/assets/images/appicons/96x96.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/wowlet.png"
  install -Dm644 src/assets/images/appicons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/wowlet.png"
  install -Dm644 src/assets/images/appicons/192x192.png "${pkgdir}/usr/share/icons/hicolor/192x192/apps/wowlet.png"
  install -Dm644 src/assets/images/appicons/256x256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wowlet.png"
}

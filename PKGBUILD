# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>
# Contributer: Alpin <alpin 'at' alpindale 'dot' dev>
# Author: LostRuins (concedo)

# Build configuration could be change with environment variables.
# Or via `${XDG_CONFIG_HOME}/koboldcpp_build.conf` (default is `~/.config/koboldcpp_build.conf`).
#
# Disabling portable build
# KOBOLDCPP_NO_PORTABLE:
#   '0' - Keep portable build enabled (default)
#   '1' or any other value that isn't '0' - Disable portable build.

: ${KOBOLDCPP_BUILD_CONF:=${XDG_CONFIG_HOME:-~/.config}/koboldcpp_build.conf}
: ${KOBOLDCPP_NO_PORTABLE:=0}

pkgname=koboldcpp
pkgver=1.77
pkgrel=4
pkgdesc="An easy-to-use AI text-generation software for GGML and GGUF models"
arch=('x86_64')
url="https://github.com/LostRuins/koboldcpp"
license=('AGPL-3.0-only')
depends=(
  'python'
  'cblas'
  'clblast'
  'vulkan-icd-loader'
)
optdepends=(
  'python-customtkinter: for GUI launcher'
  'python-psutil: increasing the process CPU priority'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/LostRuins/koboldcpp/archive/refs/tags/v$pkgver.tar.gz"
  'koboldcpp.desktop'
  'koboldcpp.png'
)
sha256sums=(
  '43ca0c9caf57ed1bd1f40fc6052793a9841ee91f97e20c3cbab4f110685c95f5'
  'fcec7b843b908e1c03496fdc0605e6509f52526a855c43db16e287ef646503ef'
  'd244788c74a693a383bea7db6ab2bb2f762e6020de900be977b16e18dcd20f54'
)

build() {
  if [ -f "${KOBOLDCPP_BUILD_CONF}" ]; then
    echo "Using config from ${KOBOLDCPP_BUILD_CONF}"
    source "${KOBOLDCPP_BUILD_CONF}"
  fi

  if [ "${KOBOLDCPP_NO_PORTABLE}" == "0" ]; then
    export LLAMA_PORTABLE=1
  fi

  export LLAMA_VULKAN=1
  export LLAMA_CLBLAST=1

  cd "$srcdir/koboldcpp-$pkgver"

  make clean && make
}

package() {
  cd "$srcdir/koboldcpp-$pkgver"

  install -d "$pkgdir/usr/share/koboldcpp"

  install -Dm644 ./*.so "$pkgdir/usr/share/koboldcpp/"
  install -Dm644 ./*.embd "$pkgdir/usr/share/koboldcpp/"

  install -d "$pkgdir/usr/share/koboldcpp/kcpp_adapters"
  install -m644 "kcpp_adapters"/* "$pkgdir/usr/share/koboldcpp/kcpp_adapters/"

  install -Dm644 "koboldcpp.py" "$pkgdir/usr/share/koboldcpp/koboldcpp.py"

  echo '#!/bin/sh' > koboldcpp
  echo 'python /usr/share/koboldcpp/koboldcpp.py "$@"' >> koboldcpp

  install -Dm755 koboldcpp "$pkgdir/usr/bin/koboldcpp"

  install -Dm644 "$srcdir/koboldcpp.desktop" "$pkgdir/usr/share/applications/koboldcpp.desktop"
  install -Dm644 "$srcdir/koboldcpp.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/koboldcpp.png"
}

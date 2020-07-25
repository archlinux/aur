# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=renderdoc-nightly
pkgver=2020.07.24
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool - nightly builds"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=(MIT)
depends=(libxcb libx11 libxcb mesa libgl qt5-base qt5-svg qt5-x11extras xcb-util-keysyms fontconfig freetype2 glu libproxy python desktop-file-utils hicolor-icon-theme)
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')
conflicts=(renderdoc)
provides=(renderdoc)

prepare() {
  msg2 "Looking up latest nightly build"
  local page=$(curl -sL https://renderdoc.org/builds)
  local url=$(grep -oE '/autobuilds/[^/]+/[0-9]+/renderdoc_[0-9_]+_[0-9a-f]+.tar.gz' <<< "$page" | head -1)
  local tarball=$(basename "$url")
  local basename=$(basename "$tarball" .tar.gz)

  msg2 "Found $tarball; downloading it now"
  wget -q -c "https://renderdoc.org/$url"{,.sig}

  msg2 "Verifying $tarball"
  if ! gpg_output=$(gpg --verify "$tarball.sig" 2>&1)
  then
    echo "$gpg_output"
    msg2 "Tarball failed verification!"
    false
  fi
  if ! grep -q "$validgpgkeys" <<< "$gpg_output"
  then
    echo "$gpg_output"
    msg2 "Unexpected key used in signature (but the tarball signature passed)"
    false
  fi

  msg2 "Extracting $tarball"
  tar xf "$tarball"

  rm -rf renderdoc_nightly
  mv "$basename" renderdoc_nightly

  # patch library prefix
  sed -i 's|/io/dist|/usr|' renderdoc_nightly/etc/vulkan/implicit_layer.d/renderdoc_capture.json
}

pkgver() {
  echo renderdoc_*_*_*_*.tar.gz | sed -r 's/^.*_([0-9]+)_([0-9]+)_([0-9]+)_.*$/\1.\2.\3/g'
}

package() {
  cd renderdoc_nightly
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/renderdoc-bin/LICENSE.md
  cp -rt "$pkgdir" etc
  cp -rt "$pkgdir"/usr bin include lib share
}

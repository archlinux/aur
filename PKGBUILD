
# Maintainer: Gus deMayo <gus.demayo@gmail.com>
pkgname=calfnxt
pkgver=2.16.0
pkgrel=1
pkgdesc="VST3 audio plugin suite with web-based UI"
arch=('x86_64')
url="https://github.com/boomshop/calfnxt"
license=('GPL-3.0-or-later')

depends=(
  glibc
  gcc-libs
  gtk3
  webkit2gtk-4.1
  gtk4
  webkitgtk-6.0
  libx11
)

makedepends=(
  cmake
  ninja
  pkgconf
  python
  git
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/boomshop/calfnxt/archive/refs/tags/v$pkgver.tar.gz"
  "calfnxt-ui-dist.tar.xz::https://github.com/boomshop/calfnxt/releases/download/v$pkgver/calfnxt-$pkgver-ui-dist.tar.xz"
  "vst3sdk::git+https://github.com/steinbergmedia/vst3sdk.git#tag=v3.8.0_build_66"
)

sha256sums=(
  '6813d20270526346f5ee8977df65584b309fc026abdad56769b4810313dbe06a'
  'c8030bca8649681cbcea8f430d54bc3c0ee07d5a9520476bf1d93902f9cbf033'
  'SKIP'
)


prepare() {
  local _src="$srcdir/calfnxt-$pkgver"
  local _sdk="$srcdir/vst3sdk"

  cd "$_src"

  # Correct all VST3 SDK submodule URLs.
  cat > "$_sdk/.gitmodules" <<'EOF'
[submodule "base"]
    path = base
    url = https://github.com/steinbergmedia/vst3_base.git
[submodule "cmake"]
    path = cmake
    url = https://github.com/steinbergmedia/vst3_cmake.git
[submodule "doc"]
    path = doc
    url = https://github.com/steinbergmedia/vst3_doc.git
[submodule "pluginterfaces"]
    path = pluginterfaces
    url = https://github.com/steinbergmedia/vst3_pluginterfaces.git
[submodule "public.sdk"]
    path = public.sdk
    url = https://github.com/steinbergmedia/vst3_public_sdk.git
[submodule "tutorials"]
    path = tutorials
    url = https://github.com/steinbergmedia/vst3_tutorials.git
[submodule "vstgui4"]
    path = vstgui4
    url = https://github.com/steinbergmedia/vstgui.git
EOF

  # Remove stale local URL configuration.
  git -C "$_sdk" config --local --remove-section submodule.base 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.cmake 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.doc 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.pluginterfaces 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.public.sdk 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.tutorials 2>/dev/null || true
  git -C "$_sdk" config --local --remove-section submodule.vstgui4 2>/dev/null || true

  # Synchronize corrected URLs.
  git -C "$_sdk" submodule sync --recursive

  # Initialize SDK dependencies.
  git -C "$_sdk" submodule update --init --recursive

  # Link SDK into project.
  mkdir -p "$_src/external"
  rm -rf "$_src/external/vst3sdk"
  ln -s "$_sdk" "$_src/external/vst3sdk"

  # Extract prebuilt WebUI.
  tar -xf "$srcdir/calfnxt-ui-dist.tar.xz" -C "$_src"

  # Validate UI.
  [[ -f "$_src/ui/dist/.stamp" ]] || {
    error "Prebuilt UI missing ui/dist/.stamp"
    return 1
  }

  # Validate SDK.
  [[ -f "$_sdk/CMakeLists.txt" ]] || {
    error "VST3 SDK CMakeLists.txt missing"
    return 1
  }
}


build() {
  cd "$srcdir/calfnxt-$pkgver"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCALFNXT_USE_PREBUILT_UI=ON \
    -DCALFNXT_WEB_HOST_GTK4=ON \
    -DCALFNXT_VST3_INSTALL_DIR=lib/vst3 \
    -DSMTG_ENABLE_VSTGUI_SUPPORT=OFF

  cmake --build build \
    --target calfnxt-plugins \
    --parallel "$(nproc)"
}

package() {
  cd "$srcdir/calfnxt-$pkgver"

  DESTDIR="$pkgdir" \
    cmake --install build --prefix /usr

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}


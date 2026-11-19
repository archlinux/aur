# Maintainer: Markus Hoffmann

pkgname=livewdf-git
pkgver=r51.g708b507
pkgrel=1
pkgdesc='Real-time analog audio circuit simulator with a schematic editor and VST3 plugin'
arch=('x86_64')
url='https://github.com/Yahiake/LiveWDF'
license=('AGPL-3.0-only' 'MIT' 'OFL-1.1')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'libgcc' 'libstdc++'
         'libx11' 'libxcomposite' 'libxcursor' 'libxext' 'libxi' 'libxinerama'
         'libxrandr' 'libxrender')
makedepends=('cmake' 'git' 'jack' 'ninja')
optdepends=('jack: JACK audio backend for the standalone audio application')
provides=("livewdf=$pkgver" 'livewdf-vst3')
conflicts=('livewdf')
_srcname=livewdf-upstream
source=(
  "${_srcname}::git+${url}.git#branch=main"
  'JUCE::git+https://github.com/juce-framework/JUCE.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_srcname"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_srcname"
  # Use makepkg's cached JUCE repository to check out the upstream submodule revision.
  git submodule init -- modules/JUCE
  git config submodule.modules/JUCE.url "$srcdir/JUCE"
  git -c protocol.file.allow=always submodule update --init -- modules/JUCE
}

build() {
  cmake -S "$_srcname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIVEWDF_BUILD_EDITOR=ON \
    -DLIVEWDF_BUILD_PLUGIN=ON \
    -DLIVEWDF_BUILD_RENDER=OFF
  cmake --build build --target LiveWDF_Editor LiveWDF_Plugin_Standalone LiveWDF_Plugin_VST3
}

check() {
  cmake --build build --target livewdf_tests livewdf_editor_tests
  ctest --test-dir build --output-on-failure
}

package() {
  local _src="$srcdir/$_srcname"
  local _plugin="$srcdir/build/plugin/LiveWDF_Plugin_artefacts/Release"
  local _editor="$srcdir/build/editor/LiveWDF_Editor_artefacts/Release"

  install -Dm755 "$_plugin/Standalone/LiveWDF" "$pkgdir/usr/bin/livewdf"
  install -Dm755 "$_editor/LiveWDF Editor" "$pkgdir/usr/bin/livewdf-editor"
  install -dm755 "$pkgdir/usr/lib/vst3"
  cp -r "$_plugin/VST3/LiveWDF.vst3" "$pkgdir/usr/lib/vst3/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/livewdf.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=LiveWDF
Comment=Run analog circuits on live audio
Exec=livewdf
Terminal=false
Categories=AudioVideo;Audio;
EOF
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/livewdf-editor.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=LiveWDF Editor
Comment=Design analog audio circuits
Exec=livewdf-editor
Terminal=false
Categories=AudioVideo;Audio;
EOF

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$_src/LICENSE" "$_src/THIRD-PARTY-NOTICES.md" "$_src/modules/JUCE/JUCE.spdx.json" \
    "$_src"/editor/assets/fonts/*-OFL.txt
  install -Dm644 "$_src/modules/JUCE/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/JUCE-LICENSE.md"
  install -Dm644 "$_src/modules/JUCE/modules/juce_audio_processors_headless/format_types/VST3_SDK/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/VST3-SDK-LICENSE.txt"
}

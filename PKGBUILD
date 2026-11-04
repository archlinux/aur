# Maintainer: guglovich <https://github.com/guglovich>
# Created with assistance from Qwen3.8 Flash Next.
# Lineage II map previewer, geodata generator and map/radar renderer.
# Upstream has no tagged releases yet: the package pins the current master commit
# and downloads the submodules as tarballs at their pinned SHAs (real checksums,
# no git clones during the build).
# The application resolves its resources (shaders, textures) relative to the
# executable, so the whole ready package installs into /opt/l2mapconv with a
# /usr/bin symlink; job outputs go to XDG_DATA_HOME when /opt is read-only.
pkgname=l2mapconv
_commit=474ffe9c74353efb85e2c77c00be0a6ceceb526d
pkgver=r164.g474ffe9
pkgrel=1
pkgdesc='Lineage II map previewer, geodata generator and map/radar renderer'
arch=('x86_64')
url='https://github.com/guglovich/l2mapconv-linux'
license=('MIT')
options=('!debug')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxext' 'libxi'
         'libxinerama' 'libxkbcommon' 'libxrandr' 'wayland' 'zlib')
makedepends=('cmake' 'git' 'ninja')
optdepends=('zenity: folder and file dialogs (or kdialog)'
            'java-runtime: Pathfinding Lab backend')
source=("l2mapconv-$_commit.tar.gz::https://codeload.github.com/guglovich/l2mapconv-linux/tar.gz/$_commit"
        "cxxopts.tar.gz::https://codeload.github.com/jarro2783/cxxopts/tar.gz/a70771ae894c787337e6393ff016c8e93e4237a3"
        "glew.tar.gz::https://codeload.github.com/Perlmint/glew-cmake/tar.gz/7c2b7514f64234756f7df051b9316f1e46f5a6e7"
        "glfw.tar.gz::https://codeload.github.com/glfw/glfw/tar.gz/da6713cd096a40a4512f468b34c189017e73f987"
        "glm.tar.gz::https://codeload.github.com/g-truc/glm/tar.gz/cc98465e3508535ba8c7f6208df934c156a018dc"
        "imgui.tar.gz::https://codeload.github.com/ocornut/imgui/tar.gz/467a1cd4a583edd55db310c82e2823692616e108"
        "recast.tar.gz::https://codeload.github.com/recastnavigation/recastnavigation/tar.gz/c187b7e88bfc922bca2175e3751881bdf378ff0d"
        "stb.tar.gz::https://codeload.github.com/nothings/stb/tar.gz/af1a5bc352164740c1cc1354942b1c6b72eacb8a")
sha256sums=('68b9e9b3a5640a87ac8fa72c50e87ab6663ed6023db1f288363abc51a2d958ae'
            '17bcd0bde7796e821fe548853a951da667abc8b22ca336f707986b153e87dc59'
            '3d92d6e350c37e53d199f80604a502c4ded7b628344f64338e40d23ebed889ca'
            'b6e26bae80b3461ddc50fb6430e3fb5240a01dbba966ca7335a0c7f4bb1b3a5c'
            '9d4d3e5eddb7d334777cb6bccded313dc7b4f2ee4b21abf27c07639efa419720'
            'c6a586ef65756631c9367d900f17ade5771b0a6120d03b0ab6bb998195616493'
            'cbdeb85b8d6703168545ef6c2c96ab79c2b28863fdecb2664bd1031a389d04bf'
            '936b4e506b5f55db178207e528ecdf5a411f67431447767d06c9b7061765cd7e')

# srcdir is not set when the PKGBUILD is parsed: resolve the tree inside functions
_l2src() { printf '%s/l2mapconv-linux-%s' "$srcdir" "$_commit"; }

_prepare_submodule() {
  # $1: extracted archive dir prefix, $2: submodule path inside the tree
  local prefix="$1" path="$2" main
  main="$(_l2src)"
  rm -rf "$main/$path"
  mkdir -p "$main/$path"
  cp -a "$srcdir/$prefix"-*/. "$main/$path/"
}

prepare() {
  _prepare_submodule cxxopts          libs/cxxopts
  _prepare_submodule glew-cmake       libs/glew
  _prepare_submodule glfw             libs/glfw
  _prepare_submodule glm              libs/glm
  _prepare_submodule imgui            libs/imgui/imgui
  _prepare_submodule recastnavigation libs/recast
  _prepare_submodule stb              libs/stb/stb
}

build() {
  cmake -S "$(_l2src)" -B build -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_TESTING=ON \
      -D BUILD_SHARED_LIBS=OFF \
      -D L2MAPCONV_LOAD_TERRAIN=ON \
      -D L2MAPCONV_LOAD_TEXTURES=OFF
  cmake --build build --parallel
}

check() {
  # headless-safe engine tests only: the window/UI/live-visual suites need a display
  ctest --test-dir build --output-on-failure -E '(window_system|ui_settings|live_visual)_tests'
}

package() {
  DESTDIR="$pkgdir" cmake --install build --component Runtime \
      --prefix "/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/l2mapconv" "$pkgdir/usr/bin/l2mapconv"

  install -Dm644 "$(_l2src)/map.png" \
      "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$(_l2src)/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=l2mapconv
GenericName=Lineage II map tools
Comment=Lineage II map previewer, geodata generator and radar renderer
Exec=l2mapconv
Icon=l2mapconv
Categories=Game;Utility;
Keywords=Lineage;l2j;geodata;navmesh;
EOF
}

# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 17/10/2019

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it as is and copy it into /opt/shadered-git.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered-git
pkgver=1.5.6+2.g780e96791f
pkgrel=1
pkgdesc="Lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(assimp glew glm gtk3 sdl2 sfml)
makedepends=(git cmake ninja python)
provides=('shadered')
conflicts=('shadered')

source=("git+https://github.com/dfranx/SHADERed"
        "git+https://github.com/dfranx/ImGuiColorTextEdit"
        "git+https://github.com/dfranx/SPIRV-VM"
        "git+https://github.com/dfranx/ShaderExpressionParser"
        "git+https://github.com/dfranx/SpvGenTwo"
        "git+https://github.com/dfranx/assimp"
        "git+https://github.com/KhronosGroup/glslang"
        "git+https://github.com/dfranx/imgui"
        "git+https://github.com/jtilly/inih"
        "git+https://github.com/zeux/pugixml"
        "git+https://github.com/KhronosGroup/SPIRV-Headers"
        "git+https://github.com/KhronosGroup/SPIRV-Tools"
        "SHADERed-git.desktop"
        "SHADERed-git.sh")
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
            'SKIP'
            'SKIP'
            '9468e6cdf0097616def7415ef0d47abcd9f9c444fa5f6b23a5a4832d62209ea4'
            '8180864b00b0d413cc7306496ba184b9c1d2ca2e19e1164d6f16dd710c2c2097')

pkgver() {
  git -C SHADERed describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

prepare() {
  cd SHADERed
  git submodule init
  git config submodule.'libs/ImGuiColorTextEdit'.url "$srcdir/ImGuiColorTextEdit"
  git config submodule.'libs/SPIRV-VM'.url "$srcdir/SPIRV-VM"
  git config submodule.'libs/ShaderExpressionParser'.url "$srcdir/ShaderExpressionParser"
  git config submodule.'libs/SpvGenTwo'.url "$srcdir/SpvGenTwo"
  git config submodule.'libs/assimp'.url "$srcdir/assimp"
  git config submodule.'libs/glslang'.url "$srcdir/glslang"
  git config submodule.'libs/imgui'.url "$srcdir/imgui"
  git config submodule.'libs/inih'.url "$srcdir/inih"
  git config submodule.'libs/pugixml'.url "$srcdir/pugixml"
  git config submodule.'libs/spirv-headers'.url "$srcdir/SPIRV-Headers"
  git config submodule.'libs/spirv-tools'.url "$srcdir/SPIRV-Tools"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd SHADERed/
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
  ninja
}

package() {
  cd "$srcdir/SHADERed"
  install -Dm644 "$srcdir/SHADERed/Misc/Icon/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/SHADERed-git.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/SHADERed-git.sh" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}

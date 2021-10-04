# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 27/02/2020

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it (and its dependencies) as is and copy The
# results into /opt/shadered.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered
pkgver=1.5.5
pkgrel=1
pkgdesc="Lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(gtk3 sdl2 sfml assimp glew glm spirv-headers)
makedepends=(git cmake python)

source=("git+https://github.com/dfranx/SHADERed.git#tag=v$pkgver"
        "git+https://github.com/dfranx/ImGuiColorTextEdit"
        "git+https://github.com/dfranx/SPIRV-VM.git"
        "git+https://github.com/dfranx/ShaderExpressionParser"
        "git+https://github.com/dfranx/SpvGenTwo"
        "git+https://github.com/dfranx/assimp.git"
        "git+https://github.com/KhronosGroup/glslang"
        "git+https://github.com/dfranx/imgui.git"
        "git+https://github.com/jtilly/inih"
        "git+https://github.com/zeux/pugixml"
        "git+https://github.com/KhronosGroup/SPIRV-Headers"
        "git+https://github.com/KhronosGroup/SPIRV-Tools.git"
        "SHADERed.sh")
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
            '885a7c14a7e00477c9acce4c64145e075a044be7a9f774b272cd5af7bde31ee9')

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
  git submodule update
}

build() {
  cd SHADERed/
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  install -Dm644 "$srcdir/SHADERed/Misc/Icon/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 "$srcdir/SHADERed/Misc/Linux/org.shadered.SHADERed.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/SHADERed.sh" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r $srcdir/SHADERed/bin/* "$pkgdir/usr/share/$pkgname"
}

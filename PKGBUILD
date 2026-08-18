# Maintainer: Alper T. <luperteverett at proton dot me>

# Note that you'll need to supply the UE1 games you want to play yourself

pkgname=surrealengine-git
pkgdesc="Unreal Engine 1 reimplementation (Git version)"
pkgver=r2222.a43494d
pkgrel=1
arch=('x86_64')
depends=('libx11' 'spirv-tools' 'vulkan-icd-loader' 'opengl-driver' 'vulkan-driver' 'sdl3' 'alsa-lib')
makedepends=('gcc' 'git' 'cmake' 'opengl-driver' 'vulkan-driver' 'sdl3' 'alsa-lib' 'waylandpp')
optdepends=('waylandpp: For SurrealWidgets Wayland backend')
provides=('surrealengine')
url="https://github.com/dpjudas/SurrealEngine"
license=('zlib AND MIT AND LGPL3 (for SurrealVideo) AND various others')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/SurrealEngine"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd SurrealEngine
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..

  make -j 16
}

package() {

  # Copy the built binaries
  install -Dm755 "${srcdir}/SurrealEngine/build/SurrealEngine" "${pkgdir}/usr/bin/surrealengine"
  install -Dm755 "${srcdir}/SurrealEngine/build/SurrealEditor" "${pkgdir}/usr/bin/surrealeditor"
  install -Dm755 "${srcdir}/SurrealEngine/build/SurrealDebugger" "${pkgdir}/usr/bin/surrealdebugger"

  # Copy libSurrealVideo.so
  install -Dm755 "${srcdir}/SurrealEngine/build/libSurrealVideo.so" "${pkgdir}/usr/lib/libSurrealVideo.so"

  # Copy SurrealEngine.pk3
  install -Dm755 "${srcdir}/SurrealEngine/build/SurrealEngine.pk3" "${pkgdir}/usr/share/surrealengine/SurrealEngine.pk3"

  # Copy license file and docs
  install -Dm644 "${srcdir}/SurrealEngine/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/doc/surrealengine/"

  install -Dm644 "${srcdir}/SurrealEngine/README.md" "${pkgdir}/usr/share/doc/surrealengine/readme.md"
  install -Dm644 "${srcdir}/SurrealEngine/Docs/Building.md" "${pkgdir}/usr/share/doc/surrealengine/building.md"
  install -Dm644 "${srcdir}/SurrealEngine/Docs/Status.md" "${pkgdir}/usr/share/doc/surrealengine/status.md"
}

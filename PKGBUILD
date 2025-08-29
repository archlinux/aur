# Maintainer: Carl Klemm <carl@uvos.xyz>

pkgname=lovr
pkgver=0.18.0
pkgrel=2
pkgdesc='Lua Virtual Reality Framework, a VR game engine'
arch=('x86_64')
url='https://lovr.org/'
license=('MIT')
depends=('glfw' 'luajit' 'lua53' 'openxr' 'enet')
makedepends=('cmake')
source=("git+https://github.com/bjornbytes/lovr.git#tag=v0.18.0"
        "Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers"
        "joltc::git+https://github.com/amerkoleci/joltc"
        "lovr-http::git+https://github.com/bjornbytes/lovr-http"
        "lua-enet::git+https://github.com/bjornbytes/lua-enet"
        "msdfgen::git+https://github.com/bjornbytes/msdfgen"
        "openxr-sdk::git+https://github.com/khronosgroup/openxr-sdk"
        "enet::git+https://github.com/lsalzman/enet"
)

sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {

  repo=${pkgname}
  git -C $repo submodule init
  git -C $repo config submodule.deps/joltc.url "file://$srcdir/joltc"
  git -C $repo config submodule.deps/msdfgen.url "file://$srcdir/msdfgen"
  git -C $repo config submodule.deps/vulkan-headers.url "file://$srcdir/Vulkan-Headers"
  git -C $repo config submodule.plugins/lovr-http.url "file://$srcdir/lovr-http"
  git -C $repo config submodule.plugins/lua-enet.url "file://$srcdir/lua-enet"
  git -C $repo -c protocol.file.allow=always submodule update

  repo="${pkgname}/plugins/lua-enet"
  git -C $repo submodule init
  git -C $repo config submodule.enet.url "file://$srcdir/enet"
  git -C $repo -c protocol.file.allow=always submodule update

}


build() {
    cmake -B build -S "${pkgname}" \
        -G 'Unix Makefiles' \
        -Wno-dev\
        -DCMAKE_C_FLAGS=-lm \
        -DLOVR_USE_LUAJIT=On \
        -DLOVR_SYSTEM_LUA=On \
        -DLOVR_USE_GLFW=On \
        -DLOVR_SYSTEM_GLFW=On \
        -DLOVR_ENABLE_HEADSET=On \
        -DLOVR_USE_OPENXR=On \
        -DLOVR_SYSTEM_OPENXR=On \
        -DLOVR_ENABLE_THREAD=On \
        -DLOVR_USE_GLSLANG=Off \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    install -D -m755 "$srcdir/build/bin/lovr" -t "${pkgdir}/usr/bin"
    install -D -m755 "$srcdir/build/bin/libjoltc.so" -t "${pkgdir}/usr/lib"
    install -D -m755 "$srcdir/build/bin/libmsdfgen.so" -t "${pkgdir}/usr/lib"
}

# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributer: Paul <paul@mrarm.io>

pkgname=mcpelauncher-linux
pkgver=1.8.4
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL-3.0-only')
makedepends=('git' 'cmake' 'ninja' 'clang' 'wayland-protocols' 'lld')
depends=('zlib' 'sdl3' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'openssl' 'libstdc++' 'libgcc' 'glibc')
optdepends=('mcpelauncher-ui: GUI for Launcher')
provides=('mcpelauncher-client')
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#tag=v${pkgver}-qt6"
  'git+https://github.com/minecraft-linux/android-support-headers.git'
  'git+https://github.com/minecraft-linux/arg-parser.git'
  'git+https://github.com/minecraft-linux/base64.git'
  'git+https://github.com/minecraft-linux/cll-telemetry.git'
  'git+https://github.com/minecraft-linux/daemon-utils.git'
  'git+https://github.com/minecraft-linux/eglut.git'
  'git+https://github.com/minecraft-linux/epoll-shim.git'
  'git+https://github.com/minecraft-linux/file-picker.git'
  'git+https://github.com/minecraft-linux/file-util.git'
  'git+https://github.com/minecraft-linux/game-window.git'
  'git+https://github.com/ocornut/imgui.git'
  'git+https://github.com/minecraft-linux/libc-shim.git'
  'git+https://github.com/ChristopherHX/libjnivm.git'
  'git+https://github.com/MCMrARM/linux-gamepad.git'
  'git+https://github.com/minecraft-linux/logger.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-client.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-core.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-errorwindow.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-linker.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-linux-bin.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-mac-bin.git'
  'git+https://github.com/minecraft-linux/mcpelauncher-webview.git'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols.git'
  'git+https://github.com/minecraft-linux/msa-daemon-client.git'
  'git+https://github.com/minecraft-linux/osx-elf-header.git'
  'git+https://github.com/minecraft-linux/properties-parser.git'
  'git+https://github.com/MCMrARM/simple-ipc.git'
  'git+https://github.com/minecraft-linux/android_bionic.git'
  'sdl3::git+https://github.com/libsdl-org/SDL.git'
  'git+https://github.com/MCMrARM/axml-parser.git'
  #mcpelauncher-linker submodules
  'git+https://github.com/minecraft-linux/mcpelauncher-apkinfo.git'
  'git+https://github.com/minecraft-linux/android_core'
)

sha256sums=('dffe43d648638ab7f21a26e6fc0643dc41b99fe115668b3a1d11f0a8eb8a1897'
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
            'SKIP')

prepare() {
  cd "$srcdir/mcpelauncher-manifest"
  git submodule init
  for _submodule in {android-support-headers,arg-parser,base64,cll-telemetry,daemon-utils,eglut,epoll-shim,file-picker,file-util,game-window,libc-shim,libjnivm,linux-gamepad,logger,mcpelauncher-client,mcpelauncher-common,mcpelauncher-core,mcpelauncher-errorwindow,mcpelauncher-linker,mcpelauncher-linux-bin,mcpelauncher-mac-bin,mcpelauncher-webview,minecraft-imported-symbols,msa-daemon-client,osx-elf-header,properties-parser,simple-ipc,sdl3,imgui,axml-parser,mcpelauncher-apkinfo}
  do
	  git config submodule.${_submodule}.url "$srcdir/${_submodule}"
  done

  git -c protocol.file.allow=always submodule update
  pushd mcpelauncher-linker
  git submodule init
  git config submodule.bionic.url "$srcdir/android_bionic"
  git config submodule.core.url "$srcdir/android_core"
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
	CXXFLAGS="$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g') -DNDEBUG -flto=thin"
	CFLAGS+=" -flto=thin"
	LDFLAGS+=" -fuse-ld=lld"
	_args=(
	-S mcpelauncher-manifest
	-G Ninja
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_C_COMPILER=clang
	-DCMAKE_CXX_COMPILER=clang++
	-DCMAKE_BUILD_TYPE=None
	-DENABLE_DEV_PATHS=OFF
	-DGAMEWINDOW_SYSTEM=SDL3
	-DSDL3_VENDORED=OFF
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	-Wno-dev
	)
	cmake -B build "${_args[@]}"
	cmake --build build

}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}

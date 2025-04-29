# Maintainer:

## options
: ${_commit:=aa955b8ae28314ae061613f0ddf13183a98aca03} # 0.1.r7465
: ${_scripts:=scripts/deps}

_pkgname="duckstation"
pkgname="$_pkgname"
pkgver=0.1.7465
pkgrel=2
pkgdesc="Playstation emulator"
url="https://github.com/stenzek/duckstation"
arch=('x86_64')

depends=(
  ## duckstation
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'
)
makedepends=(
  ## compiler
  'clang'
  'lld'
  'llvm'

  ## build
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'

  ## duckstation
  'qt6-tools'
  'qt6-wayland'

  ## fixups
  'patchelf'
  'patchutils' # filterdiff
)

_source_duckstation() {
  license=('GPL-3.0-only')

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')

  pkgver() {
    echo "${pkgver:?}"
  }
}

_source_backtrace() {
  source+=(
    "ianlancetaylor.libbacktrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_cpuinfo() {
  _pkgsrc_cpuinfo="stenzek.cpuinfo"
  source+=(
    "$_pkgsrc_cpuinfo"::"git+https://github.com/stenzek/cpuinfo.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_discord_rpc() {
  _pkgsrc_discord_rpc="stenzek.discord-rpc"
  source+=(
    "$_pkgsrc_discord_rpc"::"git+https://github.com/stenzek/discord-rpc.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_lunasvg() {
  _pkgsrc_lunasvg="stenzek.lunasvg"
  source+=(
    "$_pkgsrc_lunasvg"::"git+https://github.com/stenzek/lunasvg.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_shaderc() {
  depends+=(
    'glslang'
    'spirv-tools'
  )
  makedepends+=(
    'spirv-headers'
  )

  _pkgsrc_shaderc="stenzek.shaderc"
  source+=(
    "$_pkgsrc_shaderc"::"git+https://github.com/stenzek/shaderc.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_soundtouch() {
  _pkgsrc_soundtouch="stenzek.soundtouch"
  source+=(
    "$_pkgsrc_soundtouch"::"git+https://github.com/stenzek/soundtouch.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_spirv_cross() {
  source+=(
    "khronosgroup.spirv-cross"::"git+https://github.com/KhronosGroup/SPIRV-Cross.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_prepare_backtrace() (
  local _version_backtrace=$(grep -E -m1 'LIBBACKTRACE=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*LIBBACKTRACE=(\S+)$&\1&')
  echo "backtrace = $_version_backtrace"
  git -c advice.detachedHead=false -C "$srcdir/ianlancetaylor.libbacktrace" checkout -f "$_version_backtrace"
)

_prepare_cpuinfo() (
  local _version_cpuinfo=$(grep -E -m1 'CPUINFO=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*CPUINFO=(\S+)$&\1&')
  echo "cpuinfo = $_version_cpuinfo"
  cd "$srcdir/$_pkgsrc_cpuinfo"
  if ! git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"; then
    echo "upstream deleted commit, using $(git rev-parse HEAD)"
  fi
)

_prepare_discord_rpc() (
  local _version_discord_rpc=$(grep -E -m1 'DISCORD_RPC=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*DISCORD_RPC=(\S+)$&\1&')
  echo "discord-rpc = $_version_discord_rpc"
  cd "$srcdir/$_pkgsrc_discord_rpc"
  if ! git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"; then
    echo "upstream deleted commit, using $(git rev-parse HEAD)"
  fi
)

_prepare_lunasvg() (
  local _version_lunasvg=$(grep -E -m1 'LUNASVG=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*LUNASVG=(\S+)$&\1&')
  echo "lunasvg = $_version_lunasvg"
  cd "$srcdir/$_pkgsrc_lunasvg"
  if ! git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"; then
    echo "upstream deleted commit, using $(git rev-parse HEAD)"
  fi
)

_prepare_shaderc() (
  local _version_shaderc=$(grep -E -m1 'SHADERC=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')
  echo "shaderc = $_version_shaderc"

  cd "$srcdir/$_pkgsrc_shaderc"
  if ! git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"; then
    echo "upstream deleted commit, using $(git rev-parse HEAD)"
  fi

  sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' \
    -i CMakeLists.txt
)

_prepare_soundtouch() (
  local _version_soundtouch=$(grep -E -m1 'SOUNDTOUCH=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SOUNDTOUCH=(\S+)$&\1&')
  echo "soundtouch = $_version_soundtouch"

  cd "$srcdir/$_pkgsrc_soundtouch"
  if ! git -c advice.detachedHead=false checkout -f "$_version_cpuinfo"; then
    echo "upstream deleted commit, using $(git rev-parse HEAD)"
  fi
)

_prepare_spirv_cross() (
  local _version_spirv_cross=$(grep -E -m1 'SPIRV_CROSS=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SPIRV_CROSS=(\S+)$&\1&')
  echo "spirv-cross = $_version_spirv_cross"

  git -c advice.detachedHead=false -C "$srcdir/khronosgroup.spirv-cross" checkout -f "$_version_spirv_cross"

  if [ -e "$srcdir/$_pkgsrc/$_scripts/spirv-cross-changes.patch" ]; then
    filterdiff "$srcdir/$_pkgsrc/$_scripts/spirv-cross-changes.patch" \
      > spirv-cross-changes.patch

    cd "khronosgroup.spirv-cross"
    git apply "$srcdir/spirv-cross-changes.patch"
  fi
)

_prepare_duckstation() {
  local _pkgver=$(pkgver)
  _commit=$(git -C "$_pkgsrc" rev-parse HEAD)

  # disable autoupdate
  sed -E -e 's@#define AUTO_UPDATER_SUPPORTED@@' \
    -e 's@#if !__has_include\("scmversion/tag.h"\) && !defined\(_DEBUG\)@#if 0@' \
    -i "$_pkgsrc/src/duckstation-qt/autoupdaterdialog.cpp"

  # update links
  sed -E \
    -e 's&^(\s*).*g_scm_tag_str.*g_scm_branch_str.*$&\1tr("%1").arg(QLatin1StringView(g_scm_tag_str)));&' \
    -e 's! &lt;stenzek@gmail.com&gt;!!' \
    -e 's& \| <a href="https://\S*discord\S+">.*?</a>&&' \
    -e 's&"https://github.com/\S+/CONTRIBUTORS.md"&"'"$url/raw/${_commit}"'/CONTRIBUTORS.md"&' \
    -e 's&"https://github.com/\S+/LICENSE"&"'"$url/raw/${_commit}"'/LICENSE"&' \
    -e 's&"https://github.com/\S+/duckstation"&"'"$url/tree/${_commit}"'"&' \
    -i "$_pkgsrc/src/duckstation-qt/aboutdialog.cpp"

  sed -e '/addaction name="actionIssueTracker"/d' -i "$_pkgsrc/src/duckstation-qt/mainwindow.ui"

  cat > "0000-help-menu.patch" << 'END'
--- a/src/duckstation-qt/mainwindow.ui
+++ b/src/duckstation-qt/mainwindow.ui
@@ -126,11 +126,6 @@
     <property name="title">
      <string>&amp;Help</string>
     </property>
-    <addaction name="actionGitHubRepository"/>
-    <addaction name="actionDiscordServer"/>
-    <addaction name="separator"/>
-    <addaction name="actionCheckForUpdates"/>
-    <addaction name="separator"/>
     <addaction name="actionViewThirdPartyNotices"/>
     <addaction name="actionAboutQt"/>
     <addaction name="actionAbout"/>
END

  patch -Np1 -F100 -d "$_pkgsrc" -i "../0000-help-menu.patch"

  # fix header
  cat >> "$_pkgsrc/src/scmversion/tag.h" << EOF
#pragma once
#define SCM_RELEASE_ASSET "$pkgname"
#define SCM_RELEASE_TAGS {"latest", "preview"}
#define SCM_RELEASE_TAG "latest"
EOF

  # fix script
  install -Dm755 /dev/stdin "$_pkgsrc/src/scmversion/gen_scmversion.sh" << END
#!/bin/sh
HASH="$(git -C "$_pkgsrc" rev-parse HEAD)"
BRANCH=""
TAG="$_pkgver (AUR)"
DATE=$(git -C "$_pkgsrc" log -1 --date=iso8601-strict --format=%cd)

cat > "scmversion.cpp" << EOF
const char* g_scm_hash_str = "\${HASH}";
const char* g_scm_branch_str = "\${BRANCH}";
const char* g_scm_tag_str = "\${TAG}";
const char* g_scm_date_str = "\${DATE}";

EOF
END
}

_build_backtrace() (
  echo "Building libbacktrace..."
  cd "ianlancetaylor.libbacktrace"

  autoreconf -fi
  ./configure
  make

  install -Dm644 .libs/libbacktrace.a -t "$srcdir/deps/"
  install -Dm644 *.h -t "$srcdir/deps/include/"
)

_build_cpuinfo() {
  echo "Building cpuinfo..."
  local _cmake_cpuinfo=(
    -B build_cpuinfo
    -S "$_pkgsrc_cpuinfo"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCPUINFO_LIBRARY_TYPE=shared
    -DCPUINFO_RUNTIME_TYPE=shared
    -DCPUINFO_LOG_LEVEL=error
    -DCPUINFO_LOG_TO_STDIO=ON
    -DCPUINFO_BUILD_TOOLS=OFF
    -DCPUINFO_BUILD_UNIT_TESTS=OFF
    -DCPUINFO_BUILD_MOCK_TESTS=OFF
    -DCPUINFO_BUILD_BENCHMARKS=OFF
    -DUSE_SYSTEM_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_cpuinfo[@]}"
  cmake --build build_cpuinfo
  DESTDIR="$srcdir/deps" cmake --install build_cpuinfo
}

_build_discord_rpc() {
  echo "Building discord-rpc..."
  local _cmake_discord_rpc=(
    -B build_discord_rpc
    -S "$_pkgsrc_discord_rpc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_discord_rpc[@]}"
  cmake --build build_discord_rpc
  DESTDIR="$srcdir/deps" cmake --install build_discord_rpc
}

_build_lunasvg() {
  echo "Building lunasvg..."
  local _cmake_lunasvg=(
    -B build_lunasvg
    -S "$_pkgsrc_lunasvg"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_lunasvg[@]}"
  cmake --build build_lunasvg
  DESTDIR="$srcdir/deps" cmake --install build_lunasvg
}

_build_shaderc() {
  echo "Building shaderc..."
  local _cmake_shaderc=(
    -B build_shaderc
    -S "$_pkgsrc_shaderc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSHADERC_SKIP_TESTS=ON
    -DSHADERC_SKIP_EXAMPLES=ON
    -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
    -Dglslang_SOURCE_DIR=/usr/include/glslang
    -Wno-dev
  )

  cmake "${_cmake_shaderc[@]}"
  cmake --build build_shaderc
  DESTDIR="$srcdir/deps" cmake --install build_shaderc
}

_build_soundtouch() {
  echo "Building soundtouch..."

  local _cmake_soundtouch=(
    -B build_soundtouch
    -S "$_pkgsrc_soundtouch"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_soundtouch[@]}"
  cmake --build build_soundtouch
  DESTDIR="$srcdir/deps" cmake --install build_soundtouch
}

_build_spirv_cross() {
  echo "Building spirv-cross..."

  local _cmake_spirv_cross=(
    -B build_spirv_cross
    -S "khronosgroup.spirv-cross"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSPIRV_CROSS_SHARED=ON
    -DSPIRV_CROSS_STATIC=OFF
    -DSPIRV_CROSS_CLI=OFF
    -DSPIRV_CROSS_ENABLE_TESTS=OFF
    -DSPIRV_CROSS_ENABLE_GLSL=ON
    -DSPIRV_CROSS_ENABLE_HLSL=OFF
    -DSPIRV_CROSS_ENABLE_MSL=OFF
    -DSPIRV_CROSS_ENABLE_CPP=OFF
    -DSPIRV_CROSS_ENABLE_REFLECT=OFF
    -DSPIRV_CROSS_ENABLE_C_API=ON
    -DSPIRV_CROSS_ENABLE_UTIL=ON
    -Wno-dev
  )

  cmake "${_cmake_spirv_cross[@]}"
  cmake --build build_spirv_cross
  DESTDIR="$srcdir/deps" cmake --install build_spirv_cross
}

_build_duckstation() {
  echo "Building duckstation..."

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON
    -DDiscordRPC_DIR="$srcdir/deps/usr/lib/cmake/DiscordRPC"
    -DLIBBACKTRACE_INCLUDE_DIR="$srcdir/deps/include"
    -DLIBBACKTRACE_LIBRARY="$srcdir/deps/libbacktrace.a"
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so"
    -DShaderc_DIR="$srcdir/deps/usr/lib/cmake/Shaderc" # git
    -DSoundTouch_DIR="$srcdir/deps/usr/lib/cmake/SoundTouch"
    -Dcpuinfo_DIR="$srcdir/deps/usr/share/cpuinfo"
    -Dlunasvg_DIR="$srcdir/deps/usr/lib/cmake/lunasvg"
    -Dspirv_cross_c_shared_DIR="$srcdir/deps/usr/share/spirv_cross_c_shared/cmake"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

prepare() {
  _prepare_backtrace
  _prepare_cpuinfo
  _prepare_discord_rpc
  _prepare_lunasvg
  _prepare_shaderc
  _prepare_soundtouch
  _prepare_spirv_cross

  _prepare_duckstation
}

build() {
  export CC CXX LDFLAGS
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=lld"

  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  _build_backtrace
  _build_cpuinfo
  _build_discord_rpc
  _build_lunasvg
  _build_shaderc
  _build_soundtouch
  _build_spirv_cross

  _build_duckstation
}

package() {
  # rpath
  patchelf --force-rpath --set-rpath '$ORIGIN' "build/bin/$_pkgname-qt"
  patchelf --force-rpath --set-rpath '$ORIGIN' "deps/usr/lib"/*.so

  # main files
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # libraries
  install -Dm644 "deps/usr/lib"/*.so* -t "$pkgdir/opt/$_pkgname/"

  if [ -f "$pkgdir/opt/$_pkgname/libshaderc_ds.so" ]; then
    ln -sf libshaderc_ds.so "$pkgdir/opt/$_pkgname/libshaderc_shared.so"
  elif [ -f "$pkgdir/opt/$_pkgname/libshaderc_shared.so" ]; then
    ln -sf libshaderc_shared.so "$pkgdir/opt/$_pkgname/libshaderc_ds.so"
  else
    echo "warning: shaderc library not found."
  fi

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /opt/$_pkgname/$_pkgname-qt "\$@"
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=$_pkgname
TryExec=$_pkgname
Exec=$_pkgname %f
Terminal=false
StartupNotify=true
Categories=Game;Emulator;Qt;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_source_duckstation
_source_backtrace
_source_cpuinfo
_source_discord_rpc
_source_lunasvg
_source_shaderc
_source_soundtouch
_source_spirv_cross

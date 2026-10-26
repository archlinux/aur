# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-ai-dd5f6f64583af6146f34d072926b2b70169a8111
pkgname=meo-ai-beta
pkgver=0.1.0beta2
pkgrel=8
pkgdesc="Meo AI desktop app and headless AgentService (Beta channel)"
arch=('x86_64')
conflicts=('meo-ai')
provides=('meo-ai=0.1.0beta2')
url='https://github.com/QwQdoge/meo-ai'
license=('GPL-3.0-or-later' 'MIT' 'BSD-3-Clause')
depends=('meo-account' 'meoui-qml>=1.0.4beta3' 'qt6-base' 'qt6-declarative'
         'python' 'python-pip' 'python-openai' 'python-gobject' 'python-cairo' 'python-aiohttp' 'python-requests'
         'python-pillow' 'python-tiktoken' 'python-dbus-next'
         'python-numpy' 'python-pydub' 'python-audioop-lts'
         'python-beautifulsoup4' 'python-cssselect' 'python-feedparser'
         'python-jieba' 'python-lxml' 'python-lxml-html-clean' 'python-nltk'
         'python-dateutil' 'python-yaml' 'python-tldextract' 'python-six'
         'gtk4' 'libadwaita' 'gtksourceview5' 'webkitgtk-6.0' 'vte4')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools' 'meson' 'gettext'
             'python-setuptools' 'python-wheel' 'nodejs' 'rust')
optdepends=('meo-settings: manage Meo Account and device AI connections'
            'python-pyaudio: microphone input'
            'python-mcp: external MCP tools')
options=('!debug')
source=('meo-ai-dd5f6f64583af6146f34d072926b2b70169a8111.tar.gz::https://codeload.github.com/QwQdoge/meo-ai/tar.gz/dd5f6f64583af6146f34d072926b2b70169a8111'
        'org.meo.AI.desktop'
        'newspaper3k-LICENSE'
        'feedfinder2-LICENSE'
        'tinysegmenter-LICENSE'
        'runtime-sources.json'
        'MeoUI-b8ed876b66a5e69fd4986385c734b1a83c567be7.tar.gz::https://codeload.github.com/QwQdoge/MeoUI/tar.gz/b8ed876b66a5e69fd4986385c734b1a83c567be7'
        'feedfinder2-0.0.4.tar.gz::https://files.pythonhosted.org/packages/35/82/1251fefec3bb4b03fd966c7e7f7a41c9fc2bb00d823a34c13f847fd61406/feedfinder2-0.0.4.tar.gz'
        'newspaper3k-0.2.8-py3-none-any.whl::https://files.pythonhosted.org/packages/d7/b9/51afecb35bb61b188a4b44868001de348a0e8134b4dfa00ffc191567c4b9/newspaper3k-0.2.8-py3-none-any.whl'
        'tinysegmenter-0.3.tar.gz::https://files.pythonhosted.org/packages/17/82/86982e4b6d16e4febc79c2a1d68ee3b707e8a020c5d2bc4af8052d0f136a/tinysegmenter-0.3.tar.gz')
sha256sums=('7f7ad44c8b47ed14d0b0a9794944bb9fc1981923e594be8c8b62d9b6c074ba03'
            '330e2822261054e9cb41a802cd51f7b4e1b3696e335a8b10cd6d91552cc11e74'
            '662ea995a58f4d1138128ae1f44a91bccd4ddb114419d04446cf165442b8217c'
            'dd878f923e4dc2e4ee6a4482fc00a94a933888c2ceb51db131827939a26739af'
            '3ecf2511b2bfac0296d6d4efe236e323d8989b779e0dcce281f2482ebdd560af'
            'f38110e262126c355bfe4f5ebe10b38dac960a00f1c20ea5f89f638a36f92706'
            'bf371809a8bf657ccb6fb2da8d7fc18fa1f86bc02b036e117cea193eb2a0631a'
            '3701ee01a6c85f8b865a049c30ba0b4608858c803fe8e30d1d289fdbe89d0efe'
            '44a864222633d3081113d1030615991c3dbba87239f6bbf59d91240f71a22e3e'
            'ed1f6d2e806a4758a73be589754384cbadadc7e1a414c81a166fc9adf2d40c6d')
noextract=('feedfinder2-0.0.4.tar.gz' 'newspaper3k-0.2.8-py3-none-any.whl' 'tinysegmenter-0.3.tar.gz')

prepare() {
  ln -sfn "$srcdir/MeoUI-b8ed876b66a5e69fd4986385c734b1a83c567be7" "$srcdir/meoui"
  mkdir -p "$srcdir/third-party"
  cp -f "$srcdir/feedfinder2-0.0.4.tar.gz" "$srcdir/third-party/feedfinder2-0.0.4.tar.gz"
  cp -f "$srcdir/newspaper3k-0.2.8-py3-none-any.whl" "$srcdir/third-party/newspaper3k-0.2.8-py3-none-any.whl"
  cp -f "$srcdir/tinysegmenter-0.3.tar.gz" "$srcdir/third-party/tinysegmenter-0.3.tar.gz"
}

build() {
  cmake -S "$srcdir/$_srcdir/meo" -B native-build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DMEO_UI_ROOT="$srcdir/meoui" -DBUILD_TESTING=OFF
  cmake --build native-build --parallel 2
  meson setup engine-build "$srcdir/$_srcdir" --prefix=/usr --libdir=lib -Dprofile=release
  meson compile -C engine-build
  # The cloud desktop app (desktop-rs) pins its crates, including the qtbridge git
  # revision, in Cargo.lock. Fetch them here: release builds use --noextract, which
  # skips prepare(); the compile itself then runs offline.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')" \
    --manifest-path "$srcdir/$_srcdir/meo/desktop-rs/Cargo.toml"
  # rustc needs a larger stack for the shared core's large view builders in release mode.
  # qtbridge compiles its C++ bridge through cc; makepkg's -flto would make that GCC LTO
  # bitcode the Rust link step cannot read (undefined cxxbridge symbols), so not here.
  CFLAGS="${CFLAGS//-flto=auto/}" CXXFLAGS="${CXXFLAGS//-flto=auto/}" LDFLAGS="${LDFLAGS//-flto=auto/}" \
  RUST_MIN_STACK=33554432 CARGO_TARGET_DIR="$srcdir/cargo-target" \
    cargo build --frozen --release -j 2 --manifest-path "$srcdir/$_srcdir/meo/desktop-rs/Cargo.toml"
}

package() {
  # Do not install the add_subdirectory MeoUI dependency a second time.
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_LOCAL_ONLY=TRUE -P native-build/cmake_install.cmake
  DESTDIR="$pkgdir" meson install -C engine-build --no-rebuild
  # These three pure-Python modules are absent from Arch's repositories.
  # Stage their immutable upstream hashes, build offline, and keep them
  # private to this application. All other dependencies are pacman-owned.
  PIP_NO_INDEX=1 python -m pip install --no-deps --no-build-isolation \
    --no-compile --target "$pkgdir/usr/share/newelle" \
    "$srcdir/third-party/"*.whl "$srcdir/third-party/"*.tar.gz
  # The inherited Meson launcher mode is owner-executable only (0544).
  # Packaged launchers must also be executable by ordinary desktop users.
  chmod 755 "$pkgdir/usr/bin/newelle" "$pkgdir/usr/bin/meo-agent-service" \
    "$pkgdir/usr/bin/meo-agentd" "$pkgdir/usr/bin/meo-connect-device"
  # The headless compatibility adapter imports src.*, while Meson installs
  # the inherited engine under newelle/. Both names refer to one engine.
  ln -s newelle "$pkgdir/usr/share/newelle/src"
  # Meo AI is the desktop app on the shared Rust core (desktop-rs); it loads its QML
  # from ../share/meo-ai-desktop/qml. It is the only Meo AI launcher and keeps the
  # org.meo.AI id, so existing pins open it. The older native app and the Newelle
  # engine stay installed without launchers: the live installer still runs
  # `meo-ai --live-recovery`, and AgentService uses the engine.
  install -Dm755 "$srcdir/cargo-target/release/meo-ai-desktop" "$pkgdir/usr/bin/meo-ai-desktop"
  install -Dm644 -t "$pkgdir/usr/share/meo-ai-desktop/qml" "$srcdir/$_srcdir/meo/desktop-rs/qml/"*.qml
  rm -f "$pkgdir/usr/share/applications/org.meo.MeoAI.desktop" \
    "$pkgdir/usr/share/applications/io.github.qwersyk.Newelle.desktop"
  install -Dm644 "$srcdir/org.meo.AI.desktop" "$pkgdir/usr/share/applications/org.meo.AI.desktop"
  install -Dm644 "$srcdir/$_srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  for dependency in newspaper3k feedfinder2 tinysegmenter; do
    install -Dm644 "$startdir/$dependency-LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/$dependency-LICENSE"
  done
  install -Dm644 "$startdir/runtime-sources.json" \
    "$pkgdir/usr/share/licenses/$pkgname/runtime-sources.json"
  # User services are shipped disabled; credentials and cloud deployment
  # configuration are never part of this desktop package.
}

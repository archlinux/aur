# Maintainer: taxin-404 <taxin404@duck.com>
#
# Cordial vendors no Roblox code, and fetches the engine rather than shipping
# it -- signature-checked, from a mirror, since v0.9.0. The engine is Roblox's
# official Android x86-64 build, which comes from Google Play and which the
# user supplies -- see the pkgdesc, the .install note and README section 1.
# Every other line here follows from packaging/io.github.luohoa97.Cordial.yml,
# which is the manifest that demonstrably builds.

_pkgname=cordial
pkgname=cordial-git
pkgver=0.17.0.r0.g5412f88
pkgrel=1
pkgdesc="Roblox's official Android build, run natively on Linux -- Cordial ships no Roblox code and fetches a signature-verified one"
arch=('x86_64')
url="https://github.com/luohoa97/cordial"
license=('GPL-3.0-or-later')
depends=(
  # Linked, via the -sys crates' pkg-config probes.
  'gtk4'
  'libadwaita'
  # The in-experience web window. Built in below with the same feature pair the
  # Flatpak manifest uses; without both crates' `webview` the binary links no
  # WebKit at all and account settings silently do nothing.
  'webkitgtk-6.0'
  'zlib'
  # Named because namcap named them: these are the libraries the two binaries
  # actually record in DT_NEEDED, and every one of them is reachable today only
  # through gtk4 or webkitgtk-6.0. Listing them means a transitive dependency
  # dropped upstream turns into a resolvable version bump rather than a package
  # that installs and then cannot start.
  'glib2'
  'pango'
  'graphene'
  'libsoup3'
  # `libgcc` and `libstdc++` rather than `gcc-libs`: Arch has split that package
  # and /usr/lib/libstdc++.so.6 is owned by `libstdc++` on a current install.
  # `gcc-libs` still resolves, so this is right rather than merely working.
  'libgcc'
  'libstdc++'
  'glibc'
  # dlopen'd at run time rather than linked, so namcap will not see them and
  # dropping one produces a missing feature rather than a link error. That is
  # exactly why they are listed by hand: `libvulkan.so.1` in the presenter,
  # `libwayland-client.so.0`/`libwayland-egl.so.1` in the hand-rolled Wayland
  # code, `libxkbcommon.so.0` in the keyboard path, `libEGL`/`libGLESv2` for
  # the engine's GLES2 renderer.
  'vulkan-icd-loader'
  'wayland'
  'libxkbcommon'
  'libglvnd'
  # `native/pipewire_backend.cpp` dlopens libpipewire-0.3.so.0. Without it
  # there is no sound and nothing says so.
  'pipewire'
  'hicolor-icon-theme'
  # Plugins are Deno programs (ADR-008) and Cordial bundles no runtime -- it
  # execs `deno` off PATH. Without it every plugin fails to spawn: the system
  # installs, lists in Settings, grants permissions and cannot run a line,
  # which is what an Arch user reported on 2026-09-02.
  #
  # A hard dependency because a plugin that cannot start is not a degraded
  # feature, and three first-party plugins ship enabled. **Arch is the only
  # format where this line is possible**: `deno` is in `extra` here, and
  # `dnf5 list deno` on Fedora 44 returns nothing, so the rpm and the deb
  # cannot name a package that exists and say so in their own comments.
  'deno'
)
makedepends=(
  'git'
  'cargo'
  'cmake'
  # Not a preference. AOSP bionic uses C11 _Atomic inside C++ headers, which
  # GCC rejects with 144 errors; native/CMakeLists.txt refuses a non-Clang
  # compiler outright rather than letting it fail deep in a *-sys build script
  # naming neither the tool nor the cause.
  'clang'
  'pkgconf'
  # Headers only, for the three audio backends. Both libraries are dlopen'd and
  # neither is linked, so these add nothing to `depends` -- but leaving either
  # out silently compiles the "unavailable" arm of that backend instead of
  # failing the build, which is a loss of audio nobody would attribute to
  # packaging. ADR-023 has the reasoning.
  'libpipewire'
  'libpulse'
  'alsa-lib'
)
optdepends=(
  # `bwrap` is genuinely optional: sandbox.rs only ever *subtracts* from what
  # Cordial already holds, so without it a plugin still runs with zero Deno
  # permissions and the broker still mediates every effect. Recommended, not
  # required.
  'bubblewrap: kernel sandbox under the plugin runtime'
  # ADR-011 makes Wayland the backend Cordial targets. The X11 path still
  # starts and window.rs dlopens these for it; CORDIAL_MONITOR needs Xinerama.
  'libx11: X11 session fallback'
  'libxinerama: CORDIAL_MONITOR monitor selection under X11'
  # Roblox's own Android build, unpacked by Sober, is the copy Cordial looks
  # for first. It is a suggestion and not a dependency because a user-supplied
  # APK works just as well and neither one comes from this package.
  'sober: a Roblox build for Cordial to run (Cordial ships none)'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'cordial-bin')
install="$pkgname.install"
options=('!lto')
source=(
  "$_pkgname::git+https://github.com/luohoa97/cordial.git"
  # The two submodules, and mcpelauncher-linker's own two, declared here rather
  # than fetched by a `git submodule update --init --recursive` in prepare().
  # Same reasoning as the Flatpak manifest's `git` sources: what the build
  # compiles is then pinned by the gitlinks in the checkout, and `makepkg
  # --nobuild` is enough to prove the whole tree resolves.
  "mcpelauncher-linker::git+https://github.com/minecraft-linux/mcpelauncher-linker.git"
  "android_bionic::git+https://github.com/minecraft-linux/android_bionic.git"
  "android_core::git+https://github.com/minecraft-linux/android_core.git"
  "libjnivm::git+https://github.com/ChristopherHX/libjnivm.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"

  # Point each submodule at the clone makepkg already made, so nothing in
  # prepare() or build() touches the network. `protocol.file.allow=always` is
  # required from git 2.38 on: the fix for CVE-2022-39253 blocks the `file`
  # transport for submodules, and without it `submodule update` refuses a local
  # path with "transport 'file' not allowed" -- which reads like a bad URL.
  git submodule init
  git config submodule."third_party/mcpelauncher-linker".url "$srcdir/mcpelauncher-linker"
  git config submodule."third_party/libjnivm".url "$srcdir/libjnivm"
  git -c protocol.file.allow=always submodule update

  cd third_party/mcpelauncher-linker
  git submodule init
  git config submodule.bionic.url "$srcdir/android_bionic"
  git config submodule.core.url "$srcdir/android_core"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  # `git describe --tags` and nothing else, because the window title is
  # `git describe --tags --always --dirty` stamped by
  # crates/cordial-shell/build.rs -- so a package whose version came from
  # anywhere else would disagree with the string the running client prints,
  # and a tagless build shows a bare hash that sorts below everything.
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # See makedepends. cmake-rs passes these through to the native subtree.
  export CC=clang CXX=clang++
  # Both crates' `webview` features, and that is not optional: the shell holds
  # the WebKit window and cordial-runtime holds the presenter that calls it, so
  # one without the other leaves the caller cfg'd out and the feature silently
  # absent. The Flatpak shipped that way once and it was reported as "webview
  # doesnt work in cordial flatpak".
  cargo build --frozen --release \
    --features cordial-shell/webview,cordial-runtime/webview
}

check() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CC=clang CXX=clang++
  # **The same --features as build(), and leaving them off is not a tidy-up.**
  # `cargo test --workspace` without them resolves cordial-runtime with no
  # features, rebuilds `cordial-run` from that resolution, and hardlinks the
  # result over `target/release/cordial-run` -- so package() then installs a
  # binary with no web view in it. Caught here by `readelf -d
  # target/release/cordial-run | grep -i webkit` returning nothing after a
  # green check(), which is the same check the Flatpak manifest names and the
  # same failure it records ("webview doesnt work in cordial flatpak").
  #
  # --release for the ordinary reason as well: it reuses build()'s artefacts
  # rather than compiling the whole workspace again in the debug profile.
  #
  # The two skips are the only ones, and they are not a convenience. Both tests
  # talk to the *builder's own* org.freedesktop.secrets -- they save an item
  # into whatever keyring is on the session bus, read it back and erase it.
  # They guard themselves with `usable()` and skip cleanly where there is no
  # session bus, which is why a clean chroot never sees this; a plain `makepkg`
  # on a desktop does, and then a package build is writing to the user's login
  # keyring, which no package build should.
  #
  # Measured here rather than assumed. On the first full run in an Arch toolbox
  # that inherits the host session bus, both failed with "the secret service did
  # not answer within 5 seconds" while the build was still loading the machine.
  # Re-run afterwards the same test binary passed three times out of three, and
  # with DBUS_SESSION_BUS_ADDRESS unset both printed "skipped: there is no
  # session bus" and passed. So it is flaky under load rather than broken --
  # which is the worse of the two, because it fails a package build for a reason
  # that has nothing to do with the package.
  # The third skip is a different animal and is a finding rather than a
  # nuisance. `deep_link.rs` calls that test a tripwire on GIO's URI reshaping
  # and says in as many words that a failure is a finding; what it is actually
  # measuring is **gvfs**, not GLib. Measured here with a control, one test
  # binary, one machine, glib 2.88.3 throughout:
  #
  #   no gvfs                       FAILED
  #   gvfs installed                ok
  #   gvfs installed, no session bus FAILED
  #
  # So it needs `libgvfsdbus.so` in /usr/lib/gio/modules *and* a session bus to
  # talk to. A clean chroot has neither, and neither is a dependency of
  # Cordial, so gating a package build on it would make the package unbuildable
  # for a reason that has nothing to do with the package. Reported upstream
  # rather than papered over: the comment in deep_link.rs attributes the
  # reshaping to GIO when it belongs to gvfs.
  cargo test --frozen --release --workspace \
    --features cordial-shell/webview,cordial-runtime/webview -- \
    --skip secrets::tests::a_session_survives_the_round_trip_through_the_service \
    --skip secrets::tests::a_plaintext_store_is_adopted_and_destroyed \
    --skip deep_link::tests::gio_reshapes_a_roblox_link_and_is_therefore_not_where_the_string_comes_from
}

package() {
  cd "$srcdir/$_pkgname"

  # A tripwire, because this has already shipped wrong once in the Flatpak and
  # the symptom is silence: with the `webview` feature missing from either
  # crate the linker collects `webview::open`, the binary links no WebKit, and
  # account settings simply do nothing. Cheaper to fail the package here than
  # to have a user report it.
  readelf -d target/release/cordial-run | grep -qi webkit || {
    echo "cordial-run linked no WebKitGTK; the webview features did not take" >&2
    return 1
  }

  # Both binaries, side by side. launch.rs looks for the loader as the sibling
  # of current_exe and nowhere else -- there is no baked-in path and nothing to
  # configure -- so a shell installed without cordial-run beside it is a
  # launcher whose Launch button cannot find anything to launch.
  install -Dm755 target/release/cordial-shell "$pkgdir/usr/bin/cordial-shell"
  # See packaging/aur/cordial/PKGBUILD: `cordial` is the command and
  # `cordial-shell` is the file. cordial-run gets no alias on purpose.
  ln -sf cordial-shell "$pkgdir/usr/bin/cordial"
  # First-party plugins, read-only beside the binary.
  # Until the native packages existed nothing installed these anywhere, so the settings window listed no built-in plugins for anybody -- including Flatpak users, whose /app/share/cordial/plugins the code has looked in from the start and which has never existed.
  for plugin in plugins/*/; do
    id=$(basename "$plugin")
    [ -f "$plugin/plugin.json" ] || continue
    install -Dm644 "$plugin/plugin.json" "$pkgdir/usr/share/cordial/plugins/$id/plugin.json"
    install -Dm644 "$plugin/main.ts"     "$pkgdir/usr/share/cordial/plugins/$id/main.ts"
  done

  install -Dm755 target/release/cordial-run "$pkgdir/usr/bin/cordial-run"

  # The square icons under packaging/icons/hicolor/. Both of them: Frostbite is
  # the twice-a-year name in crates/cordial-shell/src/branding.rs, and a
  # missing one is a blank icon in the task switcher on the one day nobody is
  # watching for it. A test in that file asserts both exist and are square.
  local _icons="usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "packaging/icons/hicolor/scalable/apps/io.github.luohoa97.Cordial.svg" \
    "$pkgdir/$_icons/io.github.luohoa97.Cordial.svg"
  install -Dm644 "packaging/icons/hicolor/scalable/apps/io.github.luohoa97.Cordial.Frostbite.svg" \
    "$pkgdir/$_icons/io.github.luohoa97.Cordial.Frostbite.svg"

  # Exec=cordial-shell %u, and the %u is not decorative: the entry registers
  # x-scheme-handler/roblox-player, which is how a Play button on the website
  # reaches a client at all.
  install -Dm644 "packaging/io.github.luohoa97.Cordial.desktop" \
    "$pkgdir/usr/share/applications/io.github.luohoa97.Cordial.desktop"
  install -Dm644 "packaging/io.github.luohoa97.Cordial.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.luohoa97.Cordial.metainfo.xml"

  # MIT requires its notice in "all copies or substantial portions" and
  # Apache-2.0 section 4(d) requires NOTICE to travel with derivative works.
  # Both apply to a binary package, not only to a source tree.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
  install -Dm644 third_party/libbadcpu/LICENSE.upstream \
    "$pkgdir/usr/share/licenses/$pkgname/libbadcpu-MIT.txt"
  install -Dm644 third_party/mcpelauncher-linker/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/mcpelauncher-linker-MIT.txt"
  install -Dm644 third_party/mcpelauncher-linker/core/NOTICE \
    "$pkgdir/usr/share/licenses/$pkgname/aosp-NOTICE.txt"
  install -Dm644 third_party/libjnivm/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/libjnivm-MIT.txt"
  # The comment above already named this obligation for mocktail-webview too;
  # these two lines were the ones missing to meet it. third_party/mocktail-webview/
  # is Apache-2.0 material -- mocktail's implementation of Roblox's
  # in-experience web window, taken as the basis for Cordial's own -- and
  # NOTICE at the repository root is the section 4(d) attribution for it.
  # Found while giving packaging/aur/cordial/PKGBUILD a licence list to copy
  # from this one; the Flatpak manifest and packaging/rpm/cordial.spec had the
  # same gap and are fixed alongside this.
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 third_party/mocktail-webview/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/mocktail-webview-Apache-2.0.txt"
}

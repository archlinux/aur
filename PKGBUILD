# Maintainer: luohoa97 <luohoa97@users.noreply.github.com>
#
# Cordial vendors no Roblox code. The engine is Roblox's official Android
# x86-64 build; Cordial fetches it on first run from a third-party mirror and
# installs it only if Roblox's own signing certificate signed it, or reads a
# copy Sober unpacked, or one the user points it at. It has been able to fetch
# since v0.9.0, and this comment said it could not until 2026-08-28. The
# .install note was corrected then.
#
# **The pkgdesc was not, and the sentence that used to be here claimed it had
# been.** It went on saying "none is shipped or downloadable" for two more days,
# and `git log -S` puts that string's entire life between 08847fb and 7eb1091
# with nothing in between -- so the claim of a fix was written in the same
# breath as the fix was skipped, and then protected it from being noticed. That
# string is what the AUR and Chaotic-AUR display as the package description, so
# it was on course to be the first sentence about Cordial an Arch user read.
# A comment asserting a correction is not a correction. See README section 1.
#
# The release counterpart to packaging/aur/cordial-git/PKGBUILD, which builds
# whatever commit is at the tip of main. This one tracks tagged releases
# instead, which is what the pkgname (no -git suffix) means on the AUR --
# see packaging/aur/PUBLISHING.md for the account-and-key steps neither
# package has been through yet. Everything that is not about which commit
# gets built is identical between the two on purpose: they should drift only
# where the reason to is "release" vs "git", never by accident.
#
# Doubles as a release artifact: .github/workflows/release.yml runs `makepkg`
# against this file, unmodified, on every tagged build and attaches the
# resulting .pkg.tar.zst to the GitHub release. That is deliberate --
# building it exactly the way an AUR user's own machine would is the best
# test this file gets, and a CI failure here is a real failure of the
# submittable package, not a simulation of one.

pkgname=cordial
pkgver=0.13.2
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
  # Named because namcap named them, for cordial-git: these are the libraries
  # the two binaries actually record in DT_NEEDED, and every one of them is
  # reachable today only through gtk4 or webkitgtk-6.0. Listing them means a
  # transitive dependency dropped upstream turns into a resolvable version
  # bump rather than a package that installs and then cannot start.
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
conflicts=('cordial-git')
install="$pkgname.install"
options=('!lto')
source=(
  # #tag=v$pkgver, not a bare clone: this is what makes the package a release
  # rather than a second copy of cordial-git. The maintainer bumps $pkgver by
  # hand at each release, the same hand-maintenance PUBLISHING.md already
  # documents for .SRCINFO, and for the same stated reason -- there is no
  # `makepkg`/`namcap` on the machine Cordial is developed on, so this is kept
  # in step deliberately rather than generated.
  #
  # CORDIAL_PKGBUILD_TAG overrides the tag without editing this file, and
  # exists for exactly one caller: .github/workflows/release.yml sets it to
  # the tag actually being released, so the CI-built package is always
  # correct even on the day of a release, before anyone has gotten round to
  # bumping $pkgver here by hand. Unset -- the ordinary case, on an AUR
  # user's own machine -- it falls back to v$pkgver, which is what a plain
  # `makepkg` or `makepkg -si` against this committed file builds.
  "$pkgname::git+https://github.com/luohoa97/cordial.git#tag=${CORDIAL_PKGBUILD_TAG:-v$pkgver}"
  # The two submodules, and mcpelauncher-linker's own two, declared here
  # rather than fetched by `git submodule update --init --recursive` in
  # prepare(). A release tag's tarball from GitHub's own archive endpoint
  # would not carry them at all -- codeload does not descend into
  # submodules -- which is why this is a git source with pinned submodules
  # rather than the `archive/refs/tags/...tar.gz` shortcut an AUR package
  # without any submodules would use instead.
  "mcpelauncher-linker::git+https://github.com/minecraft-linux/mcpelauncher-linker.git"
  "android_bionic::git+https://github.com/minecraft-linux/android_bionic.git"
  "android_core::git+https://github.com/minecraft-linux/android_core.git"
  "libjnivm::git+https://github.com/ChristopherHX/libjnivm.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$pkgname"

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

  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$srcdir/$pkgname"
  # `git describe --tags` and nothing else, because the window title is
  # `git describe --tags --always --dirty` stamped by
  # crates/cordial-shell/build.rs -- so a package whose version came from
  # anywhere else would disagree with the string the running client prints.
  # At an exact release tag, which is what the pinned source above checks
  # out, this reduces to the tag itself and reproduces $pkgver above; it is
  # written the same way as cordial-git's rather than as a bare literal so
  # the two stay comparable and so a source pinned to the wrong ref (a
  # branch, a moved tag) is visible as a version that does not match rather
  # than silently accepted.
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
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
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CC=clang CXX=clang++
  # The same --features as build(), the same three skips, for the same
  # reasons packaging/aur/cordial-git/PKGBUILD's check() already documents at
  # length: two talk to whatever org.freedesktop.secrets is on the session
  # bus and are flaky under load rather than broken, the third is a tripwire
  # on gvfs rather than GLib and needs a session bus a clean build has none
  # of. Kept identical between the two packages on purpose -- see this
  # file's header.
  cargo test --frozen --release --workspace \
    --features cordial-shell/webview,cordial-runtime/webview -- \
    --skip secrets::tests::a_session_survives_the_round_trip_through_the_service \
    --skip secrets::tests::a_plaintext_store_is_adopted_and_destroyed \
    --skip deep_link::tests::gio_reshapes_a_roblox_link_and_is_therefore_not_where_the_string_comes_from
}

package() {
  cd "$srcdir/$pkgname"

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
  # **`cordial` is the command; `cordial-shell` is the file.** Asked for on
  # 2026-08-28: nobody wants to type the second word, and every other launcher
  # on a desktop answers to its own name. A symlink rather than a rename so
  # anything already invoking `cordial-shell` keeps working, and `cordial-run`
  # deliberately gets no alias -- it is the loader the shell launches and is not
  # what anyone should run by hand.
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

  # MIT requires its notice in "all copies or substantial portions",
  # Apache-2.0 section 4(d) requires NOTICE to travel with derivative works,
  # and both apply to a binary package, not only to a source tree.
  # mocktail-webview's licence and the root NOTICE are Apache-2.0 material --
  # mocktail's implementation of Roblox's in-experience web window, taken as
  # the basis for Cordial's own -- installed here from the day this package
  # was added rather than found missing later, the way cordial-git's was.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
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
  install -Dm644 third_party/mocktail-webview/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/mocktail-webview-Apache-2.0.txt"
}

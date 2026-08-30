# Maintainer: Kevin López Brante <kevin@kddlb.cl>

# XPCog for Arch, built against the distribution's libraries.
#
# The presets are not used here and that is deliberate: each one names a build
# directory under the source tree and sets VCPKG_BINARY_SOURCES to a cache
# inside it, neither of which a package build wants. What this configures by
# hand is `linux-repo-release` -- XPCOG_USE_SYSTEM_LIBS=ON plus RelWithDebInfo
# -- with the three differences set out below.
#
# **This build reaches the network.** vcpkg cannot be avoided: mgba, libvgm and
# the four libraries the project never substitutes (libogg, libflac, libvorbis,
# zlib) have no system path in cmake/XPCogSystemDeps.cmake, and vcpkg downloads
# each port's sources itself rather than from source=(). The vcpkg tree is
# pinned below and checked against the manifest, so what varies is the download
# and not the version; a build in a network-isolated chroot will still fail.

pkgname=xpcog
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio player ported from Cog, for the formats other players do not open"
arch=('x86_64')
url="https://cog.losno.co/xpcog"
license=('GPL-2.0-or-later')

# What the built binaries link from the repositories.
#
# This list is not only a declaration, it is what makes the build deterministic.
# cmake/XPCogSystemDeps.cmake decides per library, at configure time, whether the
# system has one good enough -- so on a machine without libsidplayfp installed,
# vcpkg quietly builds its own and the package links that instead. makepkg
# installs depends before build(), so naming them here is what guarantees the
# system copy is the one found, and that two builds of the same pkgver agree.
#
# libogg, libflac, libvorbis and zlib are absent on purpose: those four are never
# substituted, vcpkg builds them static, and they end up inside the executable
# rather than beside it.
depends=(
  'wxwidgets-gtk3' 'glib2' 'gcc-libs'
  'ffmpeg' 'taglib' 'sqlite' 'libopenmpt' 'libgme' 'libarchive'
  'curl' 'opusfile' 'wavpack' 'libsoxr' 'rubberband' 'libmpcdec'
  'libsidplayfp' 'hicolor-icon-theme'
)
# nlohmann-json is header-only, so it is wanted at build time and never linked.
# Here for the determinism reason above rather than to save the download.
makedepends=('cmake' 'ninja' 'git' 'pkgconf' 'zip' 'unzip' 'curl' 'tar'
             'nlohmann-json')

# The vcpkg commit is pinned to the manifest's builtin-baseline, and prepare()
# checks that it still is. Left unpinned this would resolve ports from whatever
# vcpkg's default branch says today, which is the one way this package could
# start producing a different program from the same pkgver.
_vcpkg_commit=17f35ad2418007a895ced8a4cece4ab34068a58d

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/losnoco/XPCog/archive/refs/tags/v$pkgver.tar.gz"
  "vcpkg::git+https://github.com/microsoft/vcpkg.git#commit=$_vcpkg_commit"
)
# The release tarball is checksummed; the vcpkg tree is not, because a git
# source is pinned by its commit and makepkg wants SKIP for one.
sha256sums=(
  '78f30470ff2c01bd69673af8b05ce9ca32e628e9f2ca05f5f2db28b2ec2e5385'
  'SKIP'
)

prepare() {
  # That the pin above and the manifest agree. They are two files that have to
  # say the same commit, and nothing else would notice them drifting apart --
  # vcpkg would resolve ports against the tree it was given and build something
  # subtly different without a word.
  local baseline
  baseline=$(sed -n 's/.*"builtin-baseline"[[:space:]]*:[[:space:]]*"\([0-9a-f]*\)".*/\1/p' \
      "XPCog-$pkgver/vcpkg.json")

  if [ "$baseline" != "$_vcpkg_commit" ]; then
      echo "PKGBUILD: _vcpkg_commit is $_vcpkg_commit but vcpkg.json's" >&2
      echo "builtin-baseline is $baseline. Update _vcpkg_commit to match." >&2
      return 1
  fi
}

build() {
  # The Last.fm credentials come through the environment, and nothing here has
  # to forward them: makepkg runs build() with the environment it was invoked
  # with, and app/CMakeLists.txt reads XPCOG_LASTFM_API_KEY and
  # XPCOG_LASTFM_API_SECRET from there when the cache variables are unset. So
  #
  #     XPCOG_LASTFM_API_KEY=... XPCOG_LASTFM_API_SECRET=... makepkg -si
  #
  # produces a package that can scrobble, and a plain `makepkg -si` produces one
  # that compiles all of the scrobbling code and reports the feature as
  # unavailable. Deliberately not a -D: that would put the secret in
  # CMakeCache.txt, which outlives the environment that supplied it.
  #
  # Said out loud in the log so a package built without them is not a surprise
  # discovered later in the Last.fm pane.
  if [ -n "$XPCOG_LASTFM_API_KEY" ] && [ -n "$XPCOG_LASTFM_API_SECRET" ]; then
      echo "Last.fm: credentials supplied to this build."
  else
      echo "Last.fm: no credentials; scrobbling will report itself unavailable."
  fi

  export VCPKG_ROOT="$srcdir/vcpkg"
  # vcpkg ships a bootstrap script rather than a binary in the git tree.
  [ -x "$VCPKG_ROOT/vcpkg" ] || "$VCPKG_ROOT/bootstrap-vcpkg.sh" -disableMetrics

  # Three differences from linux-repo-release, each with a reason a package has
  # and a developer build does not:
  #
  #   sentry OFF   -- crash reporting is the upstream project's, pointed at the
  #                   project's own Sentry, and a distribution package is not
  #                   the right thing to send reports from. It also drops
  #                   sentry-native, crashpad and libunwind from the vcpkg
  #                   build, and frees the system libcurl: cmake/XPCogSystemDeps
  #                   forces vcpkg's curl whenever sentry is asked for, so that
  #                   one process cannot end up holding two libcurls.
  #
  #   tests OFF    -- the suite is not what ships, and building it here would
  #                   pull Catch2 in for binaries the package discards.
  #
  #   libdir       -- lib/xpcog rather than lib. The one bundled shared library
  #                   is vcpkg's libvgmstream.so, and dropping a private copy of
  #                   it into /usr/lib would claim a name a real vgmstream
  #                   package may want. cmake/XPCogInstallRuntime.cmake derives
  #                   both the install destination and the $ORIGIN rpath from
  #                   CMAKE_INSTALL_LIBDIR, so setting it is the whole change.
  cmake -S "XPCog-$pkgver" -B build -G Ninja \
      -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake" \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib/xpcog \
      -DXPCOG_USE_SYSTEM_LIBS=ON \
      -DXPCOG_BUILD_TESTS=OFF \
      -DXPCOG_WITH_SENTRY=OFF \
      -DVCPKG_MANIFEST_FEATURES="ffmpeg;vgmstream;mgba;psf-cores;sid;musepack;adplug;libvgm" \
      -DXPCOG_WITH_FFMPEG=ON \
      -DXPCOG_WITH_VGMSTREAM=ON \
      -DXPCOG_WITH_PSF=ON \
      -DXPCOG_WITH_SID=ON \
      -DXPCOG_WITH_MUSEPACK=ON \
      -DXPCOG_WITH_MIDI=ON \
      -DXPCOG_WITH_ADPLUG=ON \
      -DXPCOG_WITH_LIBVGM=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "XPCog-$pkgver/COPYING" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

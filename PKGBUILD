# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

# Its own AUR package for the same reason the other two greeters are: nobody who
# wants the GTK or the WebKitGTK greeter should have Qt 6 and LayerShellQt in
# their build chroot, and nobody who wants this one should have GTK4 or
# WebKitGTK in theirs. wdm depends on the virtual this provides, so pacman offers
# this as one of the choices when `wdm-wayland` is installed on its own.
#
# The one package in the set that is not built with cargo. greeters/plasma is a
# standalone CMake project that the Rust workspace deliberately does not know
# about — a build.rs shelling out to cmake would make `cargo test --workspace`
# fail on every machine without Qt — so there is no `cargo fetch --locked` and no
# RUSTUP_TOOLCHAIN here, and rust is not a build dependency at all.
pkgname=wdm-plasma-greeter
# The CMake install rules place /etc/wdm/plasma-greeter.ini; backup= is what
# keeps pacman from clobbering an edited one on upgrade.
backup=('etc/wdm/plasma-greeter.ini')
# All four wdm packages share a pkgver, because they are built from one tarball
# and share one checksum. v0.8.0 was the first release containing
# greeters/plasma, so nothing earlier than that is installable here.
pkgver=0.10.0
pkgrel=1
pkgdesc='Qt6/QML greeter for wdm, with themes written in QML'
arch=('x86_64' 'aarch64')
url='https://github.com/quinnjr/wdm'
license=('MIT')
# qt6-base is not just QtCore and QtGui here: on current Arch it is also where
# libQt6WaylandClient and the wayland QPA platform plugin live, and this greeter
# has no other platform it can run on. layer-shell-qt is not optional for the
# same reason gtk4-layer-shell is not optional for the GTK greeter — wdm
# advertises no xdg_toplevel at all, so a window that is not a layer surface is
# closed the moment it is created. wayland is named explicitly because the
# executable links libwayland-client directly: it speaks wdm_greeter_v1 on the
# same connection Qt renders on, rather than through Qt.
depends=('qt6-base' 'qt6-declarative' 'layer-shell-qt' 'wayland')
# cmake and ninja rather than cmake alone: ninja is the generator CI configures
# with, so the build that is checked on every push and the build that produces
# this package are the same one. wayland is here for wayland-scanner as well as
# for the library — the protocol bindings are generated at build time from wdm's
# own XML, because a greeter and the compositor disagreeing about an opcode is
# not a compile error anywhere, it is a login screen that hangs.
#
# catch2 is what makes check() a check rather than a no-op. A missing Catch2
# does not fail the configure — it skips every test target with a STATUS message
# and leaves a ctest that finds nothing and exits 0 — so leaving it out here
# would produce a package built with its whole test suite silently unbuilt.
#
# wayland-protocols is deliberately absent: this project's XML is wdm's own, and
# nothing in the build reaches for a stock protocol definition.
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland' 'catch2' 'qt6-base'
             'qt6-declarative' 'layer-shell-qt')
provides=('wdm-greeter-implementation')
source=("wdm-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# See the note in the `wdm-wayland` package: this is the checksum of the tarball GitHub
# published, and all four wdm packages build from the same one. Never SKIP —
# for a source that is a URL, SKIP means makepkg builds whatever arrives.
sha256sums=('94fbfae480ddd21b18e2c7e5472e135a5a5577dcb172ace989d520170622443b')

# The tarball is the whole workspace whatever the pkgbase is, so the source
# directory is named for the project rather than for this package.
_src="wdm-$pkgver"

build() {
  # Configured against greeters/plasma rather than against the tarball root, and
  # the tarball root is still what has to be unpacked: the CMakeLists reaches up
  # to crates/wdm-protocol for the XML it generates bindings from, and refuses to
  # configure if it is not there.
  #
  # -DCMAKE_BUILD_TYPE=None so that makepkg.conf's CFLAGS, CXXFLAGS and LDFLAGS
  # are the only ones used; any other build type appends CMake's own optimisation
  # and debug flags on top and quietly overrides the distribution's.
  cmake -B build -S "$_src/greeters/plasma" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON \
    -DWDM_PLASMA_QT=ON

  cmake --build build
}

check() {
  # --no-tests=error and not the default. See the makedepends comment: a ctest
  # that finds nothing to run exits 0, so without this a build whose test targets
  # were skipped reports the same green as one that passed 56 cases.
  #
  # No display is needed for any of it. The Qt-free suites construct no Qt object
  # at all, and the Qt ones drive the whole state machine under a
  # QCoreApplication with no QPA platform plugin and no window — which is the
  # property the greeter's layering exists for, and the reason this runs in a
  # build chroot.
  ctest --test-dir build --output-on-failure --no-tests=error
}

package() {
  # The install rules are the CMakeLists', not this file's, so that the four
  # greeters cannot drift apart on where a greeter lives: the binary goes to a
  # literal /usr/lib/wdm/wdm-plasma-greeter — not CMAKE_INSTALL_LIBDIR, which is
  # multiarch and would be lib64 on Fedora and lib/x86_64-linux-gnu on Debian —
  # and the default theme to /usr/share/wdm/plasma-greeter/themes/default. An
  # administrator writes that binary path into `greeter.command` by hand, and a
  # greeter.command naming a path that does not exist is a startup failure with
  # no greeter left on screen to report it.
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

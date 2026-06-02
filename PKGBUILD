# Maintainer: mandalb <1l549rtjz@mozmail.com>
# Based on libfprint by Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# SDCP fork by TenSeventy7: https://github.com/TenSeventy7/libfprint-egismoc-sdcp
# OpenSSL linkage fix by antoskuu: https://github.com/antoskuu/libfprint-egismoc-sdcp-fix
#
# Fixes fingerprint enrollment disappearing after first verify on EgisTec
# Match-on-Chip sensors (egismoc driver). Replaces libfprint with a build
# that adds SDCP support.
#
# Affected USB IDs: 1c7a:0582  1c7a:0583  1c7a:0584  1c7a:0586
#                   1c7a:0587  1c7a:05a1  1c7a:05a5

# The name of the package as it appears in pacman. The -git suffix is a
# convention indicating the package tracks a git branch rather than a release.
pkgname=libfprint-egismoc-sdcp-git

# Placeholder version; overwritten at build time by pkgver() below.
pkgver=0

# Incremented manually when the PKGBUILD itself changes without a new pkgver.
pkgrel=1

# Short human-readable description shown by pacman.
pkgdesc="Library for fingerprint readers, with SDCP support for EgisTec egismoc sensors"

# Upstream project URL shown by pacman.
url="https://github.com/TenSeventy7/libfprint-egismoc-sdcp"

# CPU architectures this package can be built for.
arch=(x86_64)

# SPDX license identifier for the upstream project.
license=(LGPL-2.1-or-later)

# Libraries and tools that must be present at runtime.
depends=(
  gcc-libs      # GCC runtime libraries (libgcc_s, libstdc++)
  glib2         # GLib core library (GObject, GIO, etc.)
  glibc         # GNU C library
  libgudev      # GObject wrapper around libudev, used for device detection
  libgusb       # GObject wrapper around libusb, used for USB communication
  openssl       # Cryptographic library required by the SDCP protocol
  pixman        # Low-level pixel manipulation library used by some image drivers
)

# Tools and libraries needed only at build time, not at runtime.
makedepends=(
  git                    # Required to clone the source repository
  glib2-devel            # GLib headers and glib-mkenums, needed by meson
  gobject-introspection  # Generates GObject introspection data during build
  meson                  # Build system used by libfprint
)

# Packages needed only to run the test suite (optional at runtime).
checkdepends=(
  cairo    # 2D graphics library used by some integration tests
  umockdev # Mocks USB/udev devices for hardware-free testing
)

# Virtual packages this package satisfies, allowing it to fulfil dependencies
# that other packages (e.g. fprintd) declare on libfprint or libfprint-2.so.
provides=(libfprint libfprint-2.so)

# Packages that cannot coexist with this one (same files on disk).
conflicts=(libfprint)

# Logical group this package belongs to; 'fprint' groups all fprint-related packages.
groups=(fprint)

# Source to fetch. The directory name is set explicitly without the -git suffix
# to match the upstream repository name and keep build() and prepare() clean.
source=("libfprint-egismoc-sdcp::git+https://github.com/TenSeventy7/libfprint-egismoc-sdcp.git")

# Checksums for each source entry. SKIP is used for git sources since the
# integrity is guaranteed by git itself.
sha256sums=('SKIP')

# Dynamically generates pkgver from the git history:
# 'r' followed by the total commit count, a dot, and the short commit hash.
# Example output: r1831.a2f3c1b
pkgver() {
  cd libfprint-egismoc-sdcp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libfprint-egismoc-sdcp

  # fpi-sdcp-device.c uses OpenSSL EVP_* functions but meson.build only links
  # OpenSSL for the 'uru4000' driver via driver_helper_mapping. Without this fix
  # the linker fails with dozens of undefined references to OpenSSL symbols.
  # Applied defensively in case TenSeventy7 incorporates the fix upstream.
  if ! grep -q "'egismoc' : \[ 'openssl' \]" meson.build; then
    sed -i "/'uru4000' : \[ 'openssl' \],/a\\    'egismoc' : [ 'openssl' ]," meson.build
  fi
}

build() {
  # Options passed to meson when configuring the build.
  local meson_options=(
    -D drivers=egismoc      # Build only the egismoc driver instead of all drivers,
                            # to avoid overwriting drivers provided by stock libfprint.
    -D doc=false            # Skip documentation generation (requires gtk-doc).
    -D gtk-examples=false   # Skip GTK demo applications.
    -D installed-tests=false # Do not install the test binaries system-wide.
  )

  # arch-meson is an Arch Linux wrapper around 'meson setup' that applies
  # the distro's standard flags, prefix, and optimization settings.
  arch-meson libfprint-egismoc-sdcp build "${meson_options[@]}"

  # Compile the configured build tree.
  meson compile -C build
}

# Run the test suite. The --print-errorlogs flag shows the full log for any
# failing test. Hardware-dependent tests will be skipped automatically.
check() {
  meson test -C build --print-errorlogs
}

# Install the build output into the fake root $pkgdir; pacman will then
# package everything under that directory into the final .pkg.tar.zst.
package() {
  meson install -C build --destdir "$pkgdir"
}

# Vim modeline: sets indentation to 2 spaces and expands tabs to spaces,
# matching the Arch Linux PKGBUILD coding style.
# vim:set sw=2 sts=-1 et:

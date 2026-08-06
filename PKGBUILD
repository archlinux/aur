# Maintainer: Remenod <pixel_borne_0o@icloud.com>

pkgname=duet-httpfs
pkgver=1.0.0
pkgrel=1
pkgdesc="Mount the SD card of a Duet RepRapFirmware controller over its HTTP API"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Remenod/duet3d-driver-fuse"
license=('MIT')

# What the binary links directly: libfuse3.so (fuse3), libcurl.so (curl),
# libc/libm/libresolv (glibc), libgcc_s.so (libgcc), libstdc++.so (libstdc++).
# Arch splits the GCC runtime, so libgcc and libstdc++ are named rather than the
# gcc-libs meta package. Everything else in `ldd` — openssl, krb5, nghttp2,
# zstd … — arrives through libcurl and is that package's business, not ours.
depends=('fuse3' 'curl' 'glibc' 'libgcc' 'libstdc++')

# nlohmann-json is a header-only library: it is needed to compile (the build
# uses its nlohmann_json.pc for -I flags) but nothing is linked against it at
# runtime, so it belongs in makedepends rather than depends. Everything else
# the build needs (gcc, make, pkgconf) is in base-devel and must not be listed.
makedepends=('nlohmann-json')

# GitHub names the tag tarball after the repository, so it extracts to
# duet3d-driver-fuse-$pkgver even though the package and the binary are called
# duet-httpfs.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Remenod/duet3d-driver-fuse/archive/refs/tags/v$pkgver.tar.gz")

# Placeholder: run `updpkgsums` in this directory to fill in the real hash once
# the v1.0.0 tag is pushed. makepkg refuses to build until this is replaced;
# never use SKIP for a non-VCS source.
sha256sums=('8d72e4df54f9299e3356a5d1f9eaca7929c2323b266c6ed74f160048da3e2b15')

build() {
  cd "$srcdir/duet3d-driver-fuse-$pkgver"
  # Do not pass CXXFLAGS/CPPFLAGS/LDFLAGS here: makepkg exports them and the
  # Makefile uses ?= / += , so the hardening and LTO flags survive untouched.
  # Passing them on the command line instead would defeat the += lines and drop
  # -std=c++17 and -D_FILE_OFFSET_BITS=64.
  make VERSION="$pkgver"
}

check() {
  cd "$srcdir/duet3d-driver-fuse-$pkgver"
  # Runs the built binary with --version and --help; touches no network.
  make VERSION="$pkgver" check
}

package() {
  cd "$srcdir/duet3d-driver-fuse-$pkgver"
  # Installs the binary, the mount.fuse.duet-httpfs / mount.duet-httpfs helper
  # symlinks, doc/duet-httpfs.1, README.md into $PREFIX/share/doc/duet-httpfs
  # and LICENSE into $PREFIX/share/licenses/duet-httpfs. MIT has no standalone
  # file in /usr/share/licenses/spdx, so shipping LICENSE is mandatory.
  # VERSION is repeated so an unexpected relink cannot change the baked-in
  # version string.
  make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}

# Maintainer: Remenod <pixel_borne_0o@icloud.com>

pkgname=duet-httpfs-git
pkgver=1.0.0.r0.g2fc92b5
pkgrel=1
pkgdesc='FUSE filesystem for the SD card of a Duet RepRapFirmware controller (git)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Remenod/duet3d-driver-fuse'
license=('MIT')
# What the binary links directly: libfuse3.so (fuse3), libcurl.so (curl),
# libc/libm/libresolv (glibc), libgcc_s.so (libgcc), libstdc++.so (libstdc++).
# Arch splits the GCC runtime, so libgcc and libstdc++ are named rather than the
# gcc-libs meta package. Everything else in `ldd` — openssl, krb5, nghttp2,
# zstd … — arrives through libcurl and is that package's business, not ours.
depends=('fuse3' 'curl' 'glibc' 'libgcc' 'libstdc++')
# nlohmann-json is header-only, so it is only needed to compile.
makedepends=('git' 'nlohmann-json')
provides=("duet-httpfs=${pkgver}")
conflicts=('duet-httpfs')
source=("$pkgname::git+https://github.com/Remenod/duet3d-driver-fuse.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	# Upstream is tagged, so the version is always <tag>.r<commits>.g<hash>.
	# Deliberately no r<commits>.<hash> fallback: vercmp ranks that BELOW a
	# tagged version, so a clone that arrived without tags would quietly build
	# something pacman treats as a downgrade. Failing here is the loud, correct
	# outcome — fetch the tags and build again.
	local _desc
	if ! _desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		error 'no tags in the clone; cannot derive a version'
		return 1
	fi
	printf '%s\n' "${_desc#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	# CXXFLAGS is ?= and CPPFLAGS/LDFLAGS/LDLIBS are += in the Makefile, so
	# makepkg's hardening and LTO flags are picked up from the environment.
	make VERSION="$pkgver"
}

check() {
	cd "$srcdir/$pkgname"
	make VERSION="$pkgver" check
}

package() {
	cd "$srcdir/$pkgname"
	# Installs the binary, the mount.fuse.duet-httpfs / mount.duet-httpfs
	# symlinks, doc/duet-httpfs.1, README.md and LICENSE.
	# LICENSEDIR must match $pkgname or namcap flags the missing licence dir.
	make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX=/usr \
		LICENSEDIR="/usr/share/licenses/$pkgname" install
}

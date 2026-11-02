# Maintainer: Adria Arrufat <adria@lightpanda.io>
# Contributor: xiliuya <xiliuya@aliyun.com>
#
# By default V8 is linked from the prebuilt static archive that upstream's
# release CI uses (zig-v8-fork releases). To compile V8 from source instead
# (downloads depot_tools and the Chromium toolchain, several GB, and takes a
# long time):
#
#   LIGHTPANDA_V8_FROM_SOURCE=1 makepkg -si
#
# For an AVX2 (x86-64-v3) build on x86_64:
#
#   ENABLE_AVX=1 makepkg -si

pkgname=lightpanda
pkgver=1.0.2
pkgrel=1
pkgdesc="Headless browser designed for AI and automation - 11x faster than Chrome, 9x less memory"
arch=('x86_64' 'aarch64')
url="https://lightpanda.io"
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('zig>=0.17.0' 'rust' 'git')
options=(!debug !lto)

# Versions from .github/actions/install/action.yml at the ${pkgver} tag.
_zig_v8=v0.5.9
_v8=15.5.35.13
_v8_from_source=${LIGHTPANDA_V8_FROM_SOURCE:-0}

source=("lightpanda_${pkgver}.tar.gz::https://github.com/lightpanda-io/browser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a7a274acfdbf6d87b573d1a90029d2e17f71f718f78b03099d96d48f514d64e')

if [[ $_v8_from_source == 1 ]]; then
	makedepends+=('python')
else
	_v8_url="https://github.com/lightpanda-io/zig-v8-fork/releases/download/${_zig_v8}"
	source_x86_64=("libc_v8_${_v8}_x86_64.a::${_v8_url}/libc_v8_${_v8}_linux_x86_64.a")
	source_aarch64=("libc_v8_${_v8}_aarch64.a::${_v8_url}/libc_v8_${_v8}_linux_aarch64.a")
	sha256sums_x86_64=('eed0fa1a97d815e2f5000e7a29153d62e06ef92d2d80a024598701394e9322cb')
	sha256sums_aarch64=('30edeb56ec8374364ccbb50965fc6671f3c95addf980b367d6bd4ef9d96cde34')
	noextract=("libc_v8_${_v8}_x86_64.a" "libc_v8_${_v8}_aarch64.a")
fi

prepare() {
	# Dedicated Zig global cache for makepkg; fetch all Zig deps up front.
	export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-global-cache"
	cd "browser-${pkgver}"
	zig build --fetch
}

build() {
	export ZIG_GLOBAL_CACHE_DIR="${srcdir}/.zig-global-cache"
	cd "browser-${pkgver}"

	local _cpu
	case "$CARCH" in
		x86_64)
			if [[ $ENABLE_AVX == 1 ]]; then
				echo "Building for x86_64_v3 (AVX2)"
				_cpu=x86_64_v3
			else
				_cpu=x86_64
			fi
			;;
		aarch64) _cpu=generic ;;
	esac

	local _flags=(-Doptimize=fast -Dcpu="$_cpu" -Dversion="${pkgver}")
	if [[ $_v8_from_source == 1 ]]; then
		if [[ $CARCH == aarch64 ]]; then
			# zig-v8-fork hardcodes clang_base_path=/usr/lib/llvm-23 on aarch64.
			echo "Building V8 from source is not supported on aarch64 with this PKGBUILD" >&2
			return 1
		fi
		echo "Building V8 from source (this takes a while)"
	else
		_flags+=(-Dprebuilt_v8_path="${srcdir}/libc_v8_${_v8}_${CARCH}.a")
	fi

	zig build "${_flags[@]}" snapshot_creator -- src/snapshot.bin

	zig build "${_flags[@]}" \
		-Dsnapshot_path=../../snapshot.bin \
		-Dorderfile=orderfile/lightpanda.ld
}

package() {
	cd "browser-${pkgver}"
	install -Dm755 zig-out/bin/lightpanda "$pkgdir/usr/bin/lightpanda"
}

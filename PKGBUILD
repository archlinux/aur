# Maintainer: hocking <hockinglee@gmail.com>

pkgname=matebook-e-dsi-dkms
pkgver=1.0.0
pkgrel=1

# 内核源码版本。i915 是树内模块, 本包把它整个 vendored 出来做树外编译, 所以
# 这份源码必须与你运行的内核足够接近 —— 同一个 x.y 系列基本没问题, 跨系列
# (7.2 -> 7.3) 通常会编不过。Arch 升级内核系列时, 改这一行与 pkgver, 重新
# 生成 .SRCINFO 即可。
_kernelver=7.2.3

pkgdesc="i915 with the DSI fixes for the HUAWEI MateBook E 2023 (DRR-W56) dual link command mode panel"
arch=(x86_64)
url="https://bbs.archlinux.org/viewtopic.php?id=303555"
license=('GPL-2.0-only')
depends=(dkms)
makedepends=(libarchive)
optdepends=('linux-headers: build against the stock kernel')
install=$pkgname.install
source=("https://cdn.kernel.org/pub/linux/kernel/v${_kernelver%%.*}.x/linux-$_kernelver.tar.xz"
        matebook-e-dsi.patch
        dkms.conf
        Makefile
        zz-matebook-e-dsi-initramfs.hook)
noextract=("linux-$_kernelver.tar.xz")
sha256sums=('8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03'
            '882842e895d3c8f746d58e895a406519c666a06612d425b3f38cf4ca907e0b04'
            '9235910fe420c8a47588595ffaeba65cbfcf3c31e977c78177dc7b38c227d79b'
            '6ac1507b11f32ec557e27d81315dbc883ae58904cd00f789a7d2cdd13468a1b6'
            '6deef16bacc6bedb394b223d1fcadc35222143c5723fdbc9a251dedb3b50de9a')

_tree="$pkgname-$pkgver-tree"

prepare() {
	cd "$srcdir"
	rm -rf "$_tree"; mkdir -p "$_tree"

	# 只取需要的部分: i915 目录本身, 外加 i915_driver.c 通过
	# ../../../platform/x86/intel_ips.h 引用的那一个头文件。
	bsdtar -xf "linux-$_kernelver.tar.xz" -C "$_tree" --strip-components=1 \
		"linux-$_kernelver/drivers/gpu/drm/i915" \
		"linux-$_kernelver/drivers/platform/x86/intel_ips.h"

	patch -p1 -d "$_tree" < matebook-e-dsi.patch

	# TRACE_INCLUDE_PATH 在内核树里写死为 ../../drivers/gpu/drm/i915, 树外
	# 解析不到。define_trace.h 用尖括号包含, 而 i915 的 Makefile 本来就有
	# subdir-ccflags-y += -I$(src), 所以改成「相对 i915 根目录的子目录」即可。
	local i="$_tree/drivers/gpu/drm/i915" f d p
	for f in $(grep -rl 'define TRACE_INCLUDE_PATH' "$i"); do
		d=$(dirname "${f#$i/}")
		[ "$d" = . ] && p=. || p=$d
		sed -i "s|^#define TRACE_INCLUDE_PATH .*|#define TRACE_INCLUDE_PATH $p|" "$f"
	done

	install -m644 Makefile "$_tree/Makefile"
	sed "s/@PKGVER@/$pkgver/" dkms.conf > "$_tree/dkms.conf"
}

package() {
	install -dm755 "$pkgdir/usr/src/matebook-e-dsi-$pkgver"
	cp -a "$srcdir/$_tree/." "$pkgdir/usr/src/matebook-e-dsi-$pkgver/"

	install -Dm644 "$srcdir/zz-matebook-e-dsi-initramfs.hook" \
		"$pkgdir/usr/share/libalpm/hooks/zz-matebook-e-dsi-initramfs.hook"
}

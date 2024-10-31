# Maintainer: 0xGingi <0xgingi@0xgingi.com>

_pkgbasename=ghostty
pkgname=${_pkgbasename}-git-zen3
pkgrel=1
pkgver=r7854.9bc9ea27
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features (Zen 3 optimized)"
arch=('x86_64')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty' 'ghostty-git')
license=('custom')
depends=(
    'bzip2'
    'fontconfig'
    'freetype2'
    'gtk4'
    'harfbuzz'
    'libadwaita'
    'libpng'
    'oniguruma'
    'pixman'
    'zlib'
)
makedepends=('git' 'zig>=0.13.0' 'zig<0.14.0' 'pandoc-cli')
source=("git+https://github.com/ghostty-org/${_pkgbasename}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgbasename}"
    
    # Modify build.zig to include Zen 3 optimizations
    sed -i '/const target = b\.standardTargetOptions(.{}/a \
        if (target.cpu.arch == .x86_64) {\
            target.cpu_features_add |= std.Target.x86.featureSet(&.{\
                .@"64bit", .adx, .aes, .avx, .avx2, .bmi, .bmi2, .clflushopt,\
                .cmov, .cx16, .cx8, .f16c, .fma, .fsgsbase, .fxsr, .lzcnt,\
                .mmx, .movbe, .nopl, .pclmul, .popcnt, .prfchw, .rdpid,\
                .rdrnd, .rdseed, .sahf, .sha, .sse, .sse2, .sse3, .sse4_1,\
                .sse4_2, .ssse3, .vaes, .vpclmulqdq, .wbnoinvd, .xsave,\
                .xsavec, .xsaveopt, .xsaves,\
            });\
        }' build.zig
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
    zig build --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    zig build -p "${pkgdir}"/usr --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
}

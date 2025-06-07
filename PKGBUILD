# Maintainer: 0xGingi <0xgingi@0xgingi.com>

_pkgbasename=ghostty
pkgname=${_pkgbasename}-git-zen3
pkgrel=1
pkgver=1.1.2.r1073.g269d296
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features (Zen 3 optimized)"
arch=('x86_64')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty' 'ghostty-shell-integration' 'ghostty-terminfo')
conflicts=('ghostty' 'ghostty-shell-integration' 'ghostty-terminfo')
license=('MIT')
depends=(
    'bzip2'
    'fontconfig' 'libfontconfig.so'
    'freetype2' 'libfreetype.so'
    'gcc-libs'
    'glibc'
    'glib2' 'libglib-2.0.so' 'libgio-2.0.so' 'libgobject-2.0.so'
    'gtk4' 'libgtk-4.so'
    'gtk4-layer-shell'
    'libx11'
    'harfbuzz' 'libharfbuzz.so'
    'libadwaita' 'libadwaita-1.so'
    'libpng'
    'oniguruma'
    'pixman'
    'wayland' 'libwayland-client.so'
    'zlib'
)
makedepends=('git' 'blueprint-compiler' 'pandoc-cli' 'zig=0.14.1' 'wayland-protocols')
source=("git+https://git@github.com/ghostty-org/${_pkgbasename}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    git describe --long --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgbasename}"
    ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache/" ./nix/build-support/fetch-zig-cache.sh

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
    DESTDIR=build zig build \
        --summary all \
        --prefix "/usr" \
        --system "${srcdir}/zig-global-cache/p" \
        -Doptimize=ReleaseFast \
        -Dgtk-wayland=true \
        -Dgtk-x11=true \
        -Dpie=true \
        -Demit-docs \
        -Dversion-string="${pkgver%.r*}-r${pkgver#*.r}-$pkgrel-zen3-arch"
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    cp -a build/* "${pkgdir}/"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

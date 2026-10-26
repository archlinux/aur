# Maintainer: Eugene Flanagin <eflanagin@pm.me>
# Experimental: tested on one RX 9070 XT system, two games. Not affiliated with NVIDIA or AMD.
pkgname=ngx-fsr4
pkgver=0.1.0
pkgrel=1
pkgdesc="EXPERIMENTAL: stand-in for NVIDIA's NGX runtime that answers DLSS Super Resolution with AMD FSR 4 (Proton)"
arch=('any')
url="https://github.com/eugenesflanagin-spec/ngx-fsr4"
license=('MIT' 'LicenseRef-AMD-FidelityFX')
depends=('bash' 'python' 'coreutils' 'findutils' 'procps-ng')
# any llvm-mingw build works: llvm-mingw, llvm-mingw-w64-toolchain-ucrt-bin, ...-msvcrt-bin (all AUR)
makedepends=('llvm-mingw-w64-toolchain')
optdepends=('goverlay: provides an FSR 4.1.1 amd_fidelityfx_upscaler_dx12.dll'
            'steam: the games and Proton it works with')
conflicts=('ngx-fsr4-git')
options=('!strip' '!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1262c67b2235bfc8f44965d501aa3a0edd471cb2d5a7adf8c80b3d970128677a')

_llvm_mingw() {
    local d
    for d in "$LLVM_MINGW" /opt/llvm-mingw /opt/llvm-mingw/llvm-mingw-ucrt /opt/llvm-mingw/llvm-mingw-msvcrt; do
        [[ -n $d && -x $d/bin/x86_64-w64-mingw32-clang ]] && { echo "$d"; return; }
    done
    echo "llvm-mingw not found; set LLVM_MINGW=/path/to/llvm-mingw" >&2
    return 1
}

build() {
    cd "$pkgname-$pkgver"
    # Windows binaries: host CFLAGS/LDFLAGS do not apply
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS make LLVM_MINGW="$(_llvm_mingw)"
}

check() {
    cd "$pkgname-$pkgver"
    # no GPU or Wine needed: the DLL's PE exports, and the helper against a fake Steam library
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS make LLVM_MINGW="$(_llvm_mingw)" check
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 build/nvngx.dll "$pkgdir/usr/lib/ngx-fsr4/nvngx.dll"
    install -Dm644 build/harness.exe "$pkgdir/usr/lib/ngx-fsr4/harness.exe"
    install -Dm644 build/gpu.exe "$pkgdir/usr/lib/ngx-fsr4/gpu.exe"
    install -Dm755 tools/ngx-fsr4 "$pkgdir/usr/bin/ngx-fsr4"
    install -Dm644 -t "$pkgdir/usr/share/doc/ngx-fsr4" README.md CHANGELOG.md CREDITS.md docs/USER-GUIDE.md
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 third_party/ffx/docs/license.md "$pkgdir/usr/share/licenses/$pkgname/FidelityFX-LICENSE.md"
}

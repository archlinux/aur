# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# The crates.io tarball is the build source: the GitHub tag tarball drags in
# test data, Train-FIRE and py-ft (67 MB vs 3.5 MB). The crate normalizes the
# workspace member molecular-annotation to a registry dep, so the pinned
# Cargo.lock still builds with --locked. No LICENSE file ships anywhere
# (repo, crate, release tarball); Cargo.toml says MIT, so the text is written
# out here with the author's attribution.

pkgname=fibertools-rs
_tag=v0.13.1
pkgver=0.13.1
pkgrel=1
pkgdesc="Fiber-seq toolkit for creating and interacting with Fiber-seq BAM files"
arch=('x86_64' 'aarch64')
url="https://github.com/fiberseq/fibertools-rs"
license=('MIT')
depends=('glibc' 'libgcc' 'bzip2')
makedepends=('rust' 'cmake')
conflicts=('fibertools-rs-bin')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('0ade4a43a28f5d1f9215046aef5d63b415f4385ad9a8ed554770e781737570a9')

# hts-sys compiles its own bundled htslib (zlib-ng, lzma, curl and openssl
# vendored statically; bzip2-sys prefers the system libbz2 via pkg-config), so
# no system htslib is needed and only bzip2 leaks in as a runtime dep; cmake
# comes in through libz-sys' zlib-ng build. Arch's -flto=auto breaks rustc's
# lto=thin link for those bundled C crates. Outside a git checkout vergen-git2
# degrades to a placeholder SHA, which only dents the "ft --version" suffix.

build() {
    cd "$pkgname-$pkgver"
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export LDFLAGS="${LDFLAGS//-flto=auto/}"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/ft "$pkgdir/usr/bin/ft"
    cat > LICENSE <<'EOF'
MIT License

Copyright (c) 2021 Mitchell R. Vollger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

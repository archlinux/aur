# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. Cargo.toml declares `license = "MIT"` even though the tree
# ships no LICENSE file, so the MIT text is written out here with the author's
# attribution (upstream should carry a real LICENSE file).

pkgname=badclip
_tag=b1825a9053c1729936fcf8537e234d91fcb123f0
pkgver=20261003
pkgrel=1
pkgdesc="Extract breakends and structural-variant signals from long-read alignments"
arch=('x86_64' 'aarch64')
url="https://github.com/lh3/badclip"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('33e386fa401c1ddb3ffe82ea31009f48049c326471b1850a321b917e255cffbc')

build() {
    cd "$srcdir/$pkgname-$_tag"
    # Arch's -flto=auto breaks rustc's lto=thin link for bundled C crates.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export LDFLAGS="${LDFLAGS//-flto=auto/}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    cat > LICENSE <<'EOF'
MIT License

Copyright (c) 2026 Heng Li

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

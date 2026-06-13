# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=wirelog
pkgver=0.51.0
pkgrel=1
pkgdesc='Embedded-to-Enterprise Datalog Engine'
arch=('x86_64')
url='https://github.com/semantic-reasoning/wirelog'
license=('LGPL-3.0-or-later' 'Apache-2.0')
depends=('glibc' 'xxhash' 'mbedtls')
makedepends=('meson' 'ninja' 'gcc')
conflicts=("$pkgname-git")

# nanoarrow is built from the upstream meson wrap (pinned to the revision
# in subprojects/nanoarrow.wrap). It is not packaged separately in Arch, so
# its source is vendored into the source array and dropped into the wrap
# directory in prepare() to keep the build offline (no network in build()).
_nanoarrow_commit=65ab7e9f29244589ccbe7f95900c1295633baf42

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "arrow-nanoarrow-$_nanoarrow_commit.tar.gz::https://github.com/apache/arrow-nanoarrow/archive/$_nanoarrow_commit.tar.gz"
)
sha256sums=(
    '094de1dfe59c70d051c8ca880716293e770e0b91b33a32f276577729154ce666'
    '9389f02c59996a2edbe45e33b9183af98ab208f5a2a4fd3f340ef0cf240d53b9'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # nanoarrow: keep the meson wrap build, but pre-place the pinned source
    # so configuration needs no network. The .wrap is left in place for
    # provenance; meson uses the existing directory over a git clone.
    rm -rf subprojects/nanoarrow
    cp -r "$srcdir/arrow-nanoarrow-$_nanoarrow_commit" subprojects/nanoarrow

    # xxhash: use the system library (Arch: xxhash) instead of the bundled
    # wrap build. Upstream calls subproject('xxhash') unconditionally, so
    # drop the wrap and rewrite the dependency to the system libxxhash.pc.
    rm -f subprojects/xxhash.wrap
    sed -i \
        -e "/^xxhash_proj = subproject('xxhash'/d" \
        -e "s|^xxhash_dep = xxhash_proj.get_variable('xxhash_dep')|xxhash_dep = dependency('libxxhash')|" \
        meson.build
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # arch-meson forces --auto-features enabled (and --wrap-mode nodownload),
    # which would flip the nanoarrow subproject's optional features
    # (benchmarks, integration tests, ...) on and make it fetch further wraps
    # (google-benchmark, gtest, ...) that nodownload rejects. wirelog itself
    # has no 'feature'-type options, so restoring 'auto' only trims nanoarrow.
    arch-meson . build \
        -Dtests=false \
        -DmbedTLS=enabled \
        --auto-features=auto
    meson compile -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir"

    # wirelog ships under LGPL-3.0-or-later; the vendored nanoarrow backend
    # (libnanoarrow.so + headers, pulled in via the wrap) is Apache-2.0.
    # Install both license texts under the Arch licenses dir.
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 subprojects/nanoarrow/LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/nanoarrow-LICENSE.txt"
    install -Dm644 subprojects/nanoarrow/NOTICE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/nanoarrow-NOTICE.txt"
}

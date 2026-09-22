# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=wirelog
pkgver=0.70.0
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
_nanoarrow_commit=ec8a58cae18beaa241c7fea7cb26816ac27c280f

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "arrow-nanoarrow-$_nanoarrow_commit.tar.gz::https://github.com/apache/arrow-nanoarrow/archive/$_nanoarrow_commit.tar.gz"
)
sha256sums=(
    '0ec8f31e020a442317d769ec9aecedd91d5fee5ef1c3e3e158120a11051c311d'
    '5401734d8476140defdf3e0946e802cc9038af060067afe665806b3f7c555fc5'
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

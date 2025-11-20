# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: bcc <ben at copeland dot me dot uk>

pkgname=smatch
pkgver=1.73
_fedora_spec_url="https://src.fedoraproject.org/rpms/smatch/raw/rawhide/f/smatch.spec"
pkgrel=3
pkgdesc="Static analysis tool for C programs that performs semantic analysis to detect bugs and vulnerabilities."
arch=(x86_64)
url="https://github.com/error27/smatch"
license=(GPL-2.0-or-later MIT BSD-3-Clause)
depends=(sqlite openssl perl perl-dbd-sqlite perl-try-tiny)
source=("smatch-${pkgver}.tar.gz::https://github.com/error27/smatch/archive/refs/tags/${pkgver}.tar.gz"
        "do-not-build-sparse-binaries.patch"
        "fix-datadir-path.patch"
        "use-distribution-ldflags.patch"
        "preserve-install-timestamps.patch"
        "add-BSD-3-license.patch"
        "fix-gcc14-compilation-errors.patch")
sha256sums=('a11273552c49cea0d87e595015c8643257960f068a0d8be28226b84d99dac10c'
            '2d82b6be8c5276ebd0b728d51ebd3c24515b7a135a3f704d1a43b7201eee53f2'
            '7233956231f7f6b5de831a5d5c1683c7a5595e5b30a3133be1383e36c056e143'
            'd655b979e18d2d144b5f8088a68b8c4bb42ae2e2445405fa87fd9d516e8a8859'
            '74a71a0317407ef54a839f429c2fbe1b103c415954a08a34cef34ade694874f1'
            '199db07678e7b099f3ea5c4eb38d9aac199d7829ed832b042b7f4bcedef44e55'
            'd1131f9ac193bb102250efa79e27855dff713c86bf5d1e78eb6c96dbb69364ec')

# Query Fedora's spec to discover the current packaged version.
pkgver() {
    curl -sf "${_fedora_spec_url}" | grep -Po '^Version:\s*\K[0-9]+(\.[0-9]+)*' | head -n1
}

prepare() {
    cd "smatch-${pkgver}"

    for patch in \
        do-not-build-sparse-binaries.patch \
        fix-datadir-path.patch \
        use-distribution-ldflags.patch \
        preserve-install-timestamps.patch \
        add-BSD-3-license.patch \
        fix-gcc14-compilation-errors.patch; do
        case "$patch" in
            use-distribution-ldflags.patch)
                patch -Np0 -i "${srcdir}/${patch}"
                ;;
            *)
                patch -Np1 -i "${srcdir}/${patch}"
                ;;
        esac
    done
}

build() {
    cd "smatch-${pkgver}"

    export CFLAGS+=" -std=gnu99"
    make PREFIX=/usr
}

check() {
    cd "smatch-${pkgver}"

    echo "int main(void) { int a; return a; }" > test.c
    ./smatch test.c > test.out
    grep -q "test.c:1 main() error: uninitialized symbol 'a'." test.out
}

package() {
    cd "smatch-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 GPL-2 "${pkgdir}/usr/share/licenses/${pkgname}/GPL-2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
    cp -r Documentation "${pkgdir}/usr/share/doc/${pkgname}/"
}

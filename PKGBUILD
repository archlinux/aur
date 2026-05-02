# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: bcc <ben at copeland dot me dot uk>

pkgname=smatch
pkgver=1.75
_fedora_spec_url="https://src.fedoraproject.org/rpms/smatch/raw/rawhide/f/smatch.spec"
pkgrel=1
pkgdesc="Static analysis tool for C programs that performs semantic analysis to detect bugs and vulnerabilities."
arch=(x86_64)
url="https://github.com/error27/smatch"
license=(GPL-2.0-or-later MIT BSD-3-Clause)
depends=(sqlite openssl perl perl-dbd-sqlite perl-try-tiny)
source=("smatch-${pkgver}.tar.gz::https://github.com/error27/smatch/archive/refs/tags/${pkgver}.tar.gz"
        "use-distribution-ldflags.patch"
        "preserve-install-timestamps.patch"
        "add-BSD-3-license.patch")
sha256sums=('de16ff10452869cbdc056aedbfeadc612a612e97d35a1c75d0cef7bcd7ed9673'
            '387d033fdd7889e7d7c330a9bd4c3304ccfca14be9bf7467b447680997e75d42'
            '74a71a0317407ef54a839f429c2fbe1b103c415954a08a34cef34ade694874f1'
            '199db07678e7b099f3ea5c4eb38d9aac199d7829ed832b042b7f4bcedef44e55')

latestver() {
    gh api --paginate repos/error27/smatch/tags --jq '.[].name' |
        sed -nE '/^[0-9]+(\.[0-9]+)*$/p' | sort -V | tail -1
}

prepare() {
    cd "smatch-${pkgver}"

    for patch in \
        use-distribution-ldflags.patch \
        preserve-install-timestamps.patch \
        add-BSD-3-license.patch; do
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
    make PREFIX=/usr smatch smatch_data/db/sm_hash
}

check() {
    cd "smatch-${pkgver}"

    echo "int main(void) { int a; return a; }" > test.c
    ./smatch --spammy test.c > test.out
    grep -q "test.c:1 main() error: uninitialized symbol 'a'." test.out
}

package() {
    cd "smatch-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX=/usr INST_PROGRAMS=smatch INST_MAN1= install

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 GPL-2 "${pkgdir}/usr/share/licenses/${pkgname}/GPL-2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

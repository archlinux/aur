# Maintainer : Eric Lesiuta <elesiuta@gmail.com>

pkgname=picosnitch
pkgver=2.1.2
pkgrel=1
pkgdesc='Monitor network traffic per executable using BPF'
arch=('x86_64' 'aarch64')
url='https://elesiuta.github.io/picosnitch/'
license=('GPL-3.0-or-later')
depends=('python>=3.12' 'libbpf')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'clang' 'llvm')
optdepends=('libnotify: desktop notifications via notify-send'
            'python-psycopg: PostgreSQL remote logging'
            'python-pymysql: MariaDB / MySQL remote logging')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('253bee64e3e04a3743e632582e6b2acf2f004f3ba1b6802efae1af395b02864b')

build() {
    cd "${pkgname}-${pkgver}"
    # The build hook picks the wheel platform tag and BPF target arch from
    # this env var; vendored vmlinux_{x86,arm64}.h ship in the sdist, so no
    # bpftool / running-kernel BTF is needed at build time.
    case "$CARCH" in
        x86_64)  export PICOSNITCH_BPF_TARGET_ARCH=x86_64 ;;
        aarch64) export PICOSNITCH_BPF_TARGET_ARCH=aarch64 ;;
        *) echo "unsupported arch: $CARCH" >&2; return 1 ;;
    esac
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 debian/picosnitch.service "${pkgdir}/usr/lib/systemd/system/picosnitch.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

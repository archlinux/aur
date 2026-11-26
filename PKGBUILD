# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pandare2-bin
pkgver=1.0.42
pkgrel=1
pkgdesc='Python interface for panda-ng, bundled with the QEMU 11.1 engine (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/panda-re/panda-ng'
license=('MIT AND GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND Zlib AND BSD-3-Clause AND BSD-2-Clause AND LicenseRef-Public-Domain AND GPL-3.0-or-later WITH GCC-exception-3.1 AND 0BSD AND curl AND LGPL-3.0-or-later AND Apache-2.0')
depends=('python' 'python-cffi' 'python-yaml' 'glibc>=2.38')
provides=("pandare2=$pkgver")
conflicts=('pandare2')
makedepends=('python-installer')
optdepends=('pandare2: Python API provided by this package'
            'python-flask: PyPlugin web interface'
            'python-pandare: ioctl faker extras')
options=('!strip' '!debug')
noextract=("*.whl")
source_x86_64=("pandare2-${pkgver}-py3-none-manylinux_2_38_x86_64.whl::https://github.com/panda-re/panda-ng/releases/download/v${pkgver}/pandare2-${pkgver}-py3-none-manylinux_2_38_x86_64.whl")
source_aarch64=("pandare2-${pkgver}-py3-none-manylinux_2_38_aarch64.whl::https://github.com/panda-re/panda-ng/releases/download/v${pkgver}/pandare2-${pkgver}-py3-none-manylinux_2_38_aarch64.whl")
sha256sums_x86_64=('5a77305e79a633b395a9b758ac1f006dd533d44d63bf9e047af0e36550e13787')
sha256sums_aarch64=('72141708ebf389920d25f0a22a5f9f9f25920e1d2e3c6b03b353c63eae0a671a')

latestver() {
    curl -fsSL https://api.github.com/repos/panda-re/panda-ng/releases/latest |
        jq -r '.tag_name // empty' | sed 's/^v//'
}

check() {
    python -m zipfile -l "$srcdir/pandare2-${pkgver}-py3-none-manylinux_2_38_${CARCH}.whl" >/dev/null
}

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/pandare2-${pkgver}-py3-none-manylinux_2_38_${CARCH}.whl"
    local purelib license_dir
    purelib=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    rm -f "$pkgdir${purelib}/pandare2/data/share/qemu/hppa-firmware"*.img
    license_dir="$pkgdir${purelib}/pandare2-${pkgver}.dist-info/licenses"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cp -a "$license_dir/." "$pkgdir/usr/share/licenses/$pkgname/"

    # The upstream wheel owns generic qemu-system-* names; keep its engine usable
    # without colliding with qemu or panda-re.
    rm -f "$pkgdir"/usr/bin/qemu-system-*
    local arch
    for arch in x86_64 i386 arm aarch64 mips mipsel mips64 mips64el ppc ppc64 loongarch64 riscv32 riscv64; do
        printf '#!/usr/bin/env python3\nimport os\nfrom pandare2.qemu import launcher\nos.execv(launcher(), ["qemu-system-%s"] + sys.argv[1:])\n' "$arch" \
            > "$pkgdir/usr/bin/pandare2-qemu-system-$arch"
        sed -i '1a import sys' "$pkgdir/usr/bin/pandare2-qemu-system-$arch"
        chmod 755 "$pkgdir/usr/bin/pandare2-qemu-system-$arch"
    done
}

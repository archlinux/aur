# Creator: Stefan Reinauer <reinauer@google.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
pkgname=amifuse
pkgver=0.5.0
pkgrel=0
pkgdesc="Native AMIGA filesystems on Linux with FUSE"
arch=('x86_64')
url="https://github.com/reinauer/amifuse"
depends=('fuse' 'python' 'python-virtualenv')
makedepends=('git')
provides=("amifuse=${pkgver}")
source=('git+https://github.com/reinauer/amifuse.git#commit=30b5429843ac23c61076c61f15597ed8bdd3042f')
sha256sums=('13bf0b8e5aa8976fc3772402f6b35adfe70c42677329139b750221c5a7c76431')

build() {
    cd ${pkgname}
    git config submodule.amitools.url https://github.com/cnvogelg/amitools.git
    git submodule update --init --recursive
    python -m venv .venv
    source .venv/bin/activate
    pip install -e './amitools[vamos]'
    pip install -e .
}

package() {
    cd ${pkgname}
    source .venv/bin/activate

    # Install the generated console scripts
    install -Dm755 .venv/bin/amifuse     "${pkgdir}/usr/bin/amifuse"
    install -Dm755 .venv/bin/rdb-inspect "${pkgdir}/usr/bin/rdb-inspect"
    install -Dm755 .venv/bin/driver-info "${pkgdir}/usr/bin/driver-info"

    # Optional: Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/amifuse/README.md"
    cp -r Docs "${pkgdir}/usr/share/doc/amifuse/"
}

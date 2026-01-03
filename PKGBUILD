# Creator: Stefan Reinauer <reinauer@google.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
pkgname=amifuse
pkgver=0.2.0
pkgrel=0
pkgdesc="Native AMIGA filesystems on Linux with FUSE"
arch=('x86_64')
url="https://github.com/reinauer/amifuse"
depends=('fuse' 'python' 'python-virtualenv')
makedepends=('git')
provides=("amifuse=${pkgver}")
source=('git+https://github.com/reinauer/amifuse.git#commit=9bc9aa2c57c45c15cf5bef8ccdd114a9ad7a3187')
sha256sums=('7410b4459bdca1c0dc391d5e6d2d85af03df50536d5492ef9ee2bc369a57b745')

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

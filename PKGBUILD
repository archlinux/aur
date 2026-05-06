# Maintainer: Delta-Sec <ayhamasfoor1@gmail.com>
pkgname=stegx
pkgver=2.0.1
pkgrel=1
pkgdesc="Authenticated LSB steganography with Argon2id, AES-GCM/ChaCha20-Poly1305, Shamir quorum and panic mode"
arch=('any')
url="https://github.com/Delta-Sec/StegX"
license=('MIT')
depends=(
    'python>=3.12'
    'python-pillow'
    'python-cryptography'
    'python-tqdm'
    'python-argon2-cffi'
)
optdepends=(
    'python-zstandard: zstd compression'
    'python-brotli: brotli compression'
    'python-zxcvbn: password strength meter'
    'python-numpy: faster cover-image preprocessing'
    'yubikey-manager: YubiKey challenge-response 2FA'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Delta-Sec/StegX/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a643ab691dafce4c058a5f8b92eef56409ad87d1246ed58d8a7f5bd6bf02fdca')

build() {
    cd "${srcdir}/StegX-${pkgver}"
    SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/StegX-${pkgver}"
    PYTHONPATH="${PWD}/src" python -m pytest tests/unit -q --no-header
}

package() {
    cd "${srcdir}/StegX-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    if [ -f debian/stegx.1 ]; then
        install -Dm644 debian/stegx.1 "${pkgdir}/usr/share/man/man1/stegx.1"
    fi
    if [ -f completions/stegx.bash ]; then
        install -Dm644 completions/stegx.bash "${pkgdir}/usr/share/bash-completion/completions/stegx"
    fi
}

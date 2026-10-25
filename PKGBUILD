# Maintainer: BANANASJIM <77719403+BANANASJIM@users.noreply.github.com>

pkgname=bitwig-agent
pkgver=0.1.1
pkgrel=1
pkgdesc='Thin MCP/CLI bridge and controller extension for Bitwig Studio'
arch=('any')
url='https://github.com/BANANASJIM/bitwig-agent'
license=('MIT' 'Apache-2.0')
depends=('python>=3.11' 'python-mcp>=1.29.1' 'python-mcp<2'
         'python-pydantic>=2.11' 'python-pydantic<3')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-numpy' 'python-scipy' 'python-soundfile')
optdepends=('bitwig-studio: native host; only 6.1.3 has native evidence, private APIs are exact-JAR-gated')
source=("${url}/releases/download/v${pkgver}/bitwig_agent-${pkgver}.tar.gz"
        "BitwigAgent-${pkgver}.bwextension::${url}/releases/download/v${pkgver}/BitwigAgent.bwextension")
noextract=("BitwigAgent-${pkgver}.bwextension")
sha256sums=('67b8eb529bc3240703405e9bbe5126ebd73156da6ab028623a46a5122aa7f0dd'
            '22cf939a9c9044440c799fa633d8f88515a9b8046b5ed9a261e48f5e42eb1707')

build() {
    cd "bitwig_agent-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "bitwig_agent-${pkgver}"
    # Stage metadata as well as modules without installing into the build host.
    rm -rf "${srcdir:?}/check-root"
    python -m installer --destdir="${srcdir}/check-root" dist/*.whl
    local purelib
    purelib=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="${srcdir}/check-root${purelib}" python -m pytest -q
}

package() {
    cd "bitwig_agent-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Java bytecode is supplied upstream: no proprietary host JAR/JDK is bundled.
    # The user explicitly copies this asset; pacman never writes to user homes.
    install -Dm644 "${srcdir}/BitwigAgent-${pkgver}.bwextension" \
        "${pkgdir}/usr/share/${pkgname}/BitwigAgent.bwextension"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICE.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICE.md"
    install -Dm644 third-party/GSON-LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/GSON-LICENSE.txt"

    install -d "${pkgdir}/usr/share/doc/${pkgname}" \
        "${pkgdir}/usr/share/${pkgname}/skills"
    install -m644 ./*.md LICENSE "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r docs examples third-party "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r skills/bitwig-agent "${pkgdir}/usr/share/${pkgname}/skills/"
    ln -s "../../${pkgname}/skills" "${pkgdir}/usr/share/doc/${pkgname}/skills"
}

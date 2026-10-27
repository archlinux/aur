# Maintainer: BANANASJIM <77719403+BANANASJIM@users.noreply.github.com>

pkgname=bitwig-agent
pkgver=0.2.0
pkgrel=1
pkgdesc='Thin MCP/CLI bridge and controller extension for Bitwig Studio'
arch=('any')
url='https://github.com/BANANASJIM/bitwig-agent'
license=('MIT' 'Apache-2.0')
depends=('python>=3.11' 'python-mcp>=2.3.0' 'python-mcp<3'
         'python-pydantic>=2.12' 'python-pydantic<3')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-numpy' 'python-scipy' 'python-soundfile')
optdepends=('bitwig-studio: native host; private APIs require exact-JAR-gated 6.1.4, Linux evidence is bounded')
source=("${url}/releases/download/v${pkgver}/bitwig_agent-${pkgver}.tar.gz"
        "BitwigAgent-${pkgver}.bwextension::${url}/releases/download/v${pkgver}/BitwigAgent.bwextension")
noextract=("BitwigAgent-${pkgver}.bwextension")
sha256sums=('019d5eb66bbbebbadad37408c727d990c149e1a2fc650ff3fc95a3d5235ad274'
            '9d21fe4ef86271a99720d5ee7aa9192c600c7fa0476bc5461c95f551914890cf')

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

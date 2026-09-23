# Maintainer: Rubin Simons <me@rubin55.org>

pkgname='sonarqube-cli'
pkgver=1.8.0.5274
pkgrel=1
pkgdesc="Command line interface for SonarQube Server and SonarQube Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/SonarSource/sonarqube-cli"
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'icu')
makedepends=('bun')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('56cd1c4939fd7a5927c3a01500a8e2159dfc28b9855ef1f1471713bf32aab9a8')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Upstream resolves packages through a private registry mirror,
    # so make it an empty URL so bun uses the default registry.
    sed -i 's|"https://repox\.jfrog\.io/[^"]*"|""|' bun.lock
    sed -i '/^registry = /d' bunfig.toml

    # Disable self-update command.
    sed -i 's/enableSelfUpdate: true/enableSelfUpdate: false/' \
        src/core/host/distribution.ts tests/unit/core/host/distribution.test.ts

    bun install --frozen-lockfile --ignore-scripts

    # Append build number to version, same way as CI does.
    bun build-scripts/set-build-number.ts "${pkgver##*.}"
}

build() {
    cd "${pkgname}-${pkgver}"
    bun build-scripts/build-binary.ts
}

check() {
    cd "${pkgname}-${pkgver}"
    bun run test:unit
    dist/sonarqube-cli --version
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 dist/sonarqube-cli "${pkgdir}/usr/bin/sonar"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Rubin Simons <me@rubin55.org>

pkgname='sonarqube-cli'
pkgver=1.9.0.15656
pkgrel=1
pkgdesc="Command line interface for SonarQube Server and SonarQube Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/SonarSource/sonarqube-cli"
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'icu')
makedepends=('bun')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('076656b2eb0e79b9d0fc20d376f643e2f52b1728a28604e68118d030dfe98ceb')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Upstream resolves packages through a private registry mirror,
    # so make it an empty URL so bun uses the default registry.
    sed -i 's|"https://repox\.jfrog\.io/[^"]*"|""|' bun.lock
    sed -i '/^registry = /d' bunfig.toml

    # Disable self-update command.
    sed -i 's/enableSelfUpdate: true/enableSelfUpdate: false/' \
        src/core/host/distribution.ts tests/unit/core/host/distribution.test.ts

    # Hook tests expect no sonar in PATH, so hide an installed one.
    mkdir -p "${srcdir}/hookbin"
    ln -sf /usr/bin/{sh,git,grep,sed,tr} "${srcdir}/hookbin/"
    sed -i "s|'/usr/bin:/bin'|'${srcdir}/hookbin'|" \
        tests/unit/commands/integrate/git/git-husky.test.ts

    # Test expects no build number in the current version, add it.
    sed -i 's/\(currentVersion: `.*\${patch}\)`/\1.'"${pkgver##*.}"'`/' \
        tests/unit/commands/update/update-version.test.ts

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

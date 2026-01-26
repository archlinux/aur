# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=happy-cli
pkgver=0.13.0
pkgrel=1
# slopus/happy monorepo does not have a tag for v0.13.0
# This commit corresponds to the v0.13.0 tag in slopus/happy-cli
_commit=55a6683d6440517170a103026a2044fbb912510d
# Minimal PATH detection fix from upstream (slopus/happy-cli#83)
_path_detection_commit=798a6cc14f0ea29cd11d49805de078f452e03fe6
pkgdesc="Mobile and Web client for Claude Code and Codex - remote control your AI coding agent"
arch=('any')
url="https://github.com/slopus/happy"
license=('MIT')
depends=('nodejs' 'ripgrep' 'difftastic')
makedepends=(
    'yarn'
    'npm'  # npm is needed for npx in build scripts
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/slopus/happy/archive/$_commit.tar.gz"
        "LICENSE.happy"
        "path-detection.patch::https://github.com/slopus/happy/commit/$_path_detection_commit.patch")
b2sums=('38e9c974d812691e1ffb7d6cf1062acfddfedc00f51134b80af8c336cc6ef0c3d51812a5a5cb893c9eb53e1d7a631931297b93d312c6c86f3459d3458d6a4753'
        'fcbaa679c86428f5d5e15dca35b97a7bf7b600aaac69b110e39067cb2606fe0fe1fd8b85ddf08e2c9568ed895f60de97f95f68476b3811da7b3dcccf4c559ce1'
        '00e3a9e5a23e0cef7718ba92e851bdee282703c521295584d6bac96c3d6acb279a3a6aac1174ecab73a65814826399180707f04ed660dc46354bda093afb5923')

prepare() {
    cd "$srcdir/happy-$_commit"

    # Backport PATH detection fix from upstream (slopus/happy-cli#83)
    # This is needed for compatibility with claude-code from AUR.
    patch -p1 < "$srcdir/path-detection.patch"

    cd cli

    # Patch difftastic module to use system binary
    sed -i "s|resolve(join(projectPath(), 'tools', 'unpacked', binaryName))|'/usr/bin/difft'|" \
        src/modules/difftastic/index.ts
}

build() {
    cd "$srcdir/happy-$_commit/cli"
    # Install all deps (devDeps needed for build and check; pruned in package())
    yarn install --frozen-lockfile
    yarn build
}

check() {
    cd "$srcdir/happy-$_commit/cli"
    # Run unit tests only (integration tests require running happy server)
	# TODO: See if we can run the integration tests once there is a new release
	# from the monorepo
    yarn vitest run --exclude='**/*.integration.test.ts'
}

package() {
    cd "$srcdir/happy-$_commit/cli"

    # Prune devDeps before packaging
    yarn install --frozen-lockfile --production

    install -dm755 "$pkgdir/usr/"{lib/$pkgname,bin}

    # scripts (except unpack-tools) are used at runtime
    cp -r dist bin scripts package.json node_modules "$pkgdir/usr/lib/$pkgname/"

    # Remove unpack-tools script which is only used during build
    rm "$pkgdir/usr/lib/$pkgname/scripts/unpack-tools.cjs"

    # Create empty tools/unpacked for ripgrep launcher (it checks this path)
	# Actual tools dir should not be packaged since we use system packages for the tools
    install -dm755 "$pkgdir/usr/lib/$pkgname/tools/unpacked"

    ln -s /usr/lib/$pkgname/bin/happy.mjs "$pkgdir/usr/bin/happy"
    ln -s /usr/lib/$pkgname/bin/happy-mcp.mjs "$pkgdir/usr/bin/happy-mcp"

    install -Dm644 "$srcdir/LICENSE.happy" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

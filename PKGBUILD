# Maintainer: Josef Zoller <josef@walterzollerpiano.com>
pkgname=swift-format-git
pkgver=509.0.0.r265.a8f5553
pkgrel=1
pkgdesc="Formatting technology for Swift source code"
arch=('x86_64' 'aarch64')
url="https://github.com/apple/swift-format"
license=('Apache-2.0')
depends=('swift-language')
makedepends=('git')
provides=('swift-format')
conflicts=('swift-format')
source=("$pkgname::git+https://github.com/apple/swift-format")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local tags commit_count version
    tags="$(git tag --sort=-v:refname | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$')"
    read -r commit_count version <<<"$(while IFS= read -r tag; do
        ancestor=$(git merge-base HEAD "$tag")
        commits_since=$(git rev-list "$ancestor..HEAD" --count)
        echo "$commits_since" "$tag"
    done <<< "$tags" | sort -nsu -k1,1 | head -1)"
    echo "$version.r$commit_count.$(git log --pretty=format:'%h' -n 1 HEAD)"
}

prepare() {
    cd "$pkgname"
    swift package resolve
}

build() {
    cd "$pkgname"
    swift build \
        -c release --build-tests \
        --force-resolved-versions --skip-update \
        -Xswiftc -enable-upcoming-feature -Xswiftc ConciseMagicFile \
        -Xswiftc -gnone -Xcc -g0 -Xcc -DNDEBUG -Xcxx -g0 -Xcxx -DNDEBUG
}

check() {
    cd "$pkgname"
    swift test \
        -c release --skip-build \
        --parallel
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"

    ./.build/release/swift-format --generate-completion-script bash > \
        "$pkgdir/usr/share/bash-completion/completions/swift-format"
    chmod 644 "$pkgdir/usr/share/bash-completion/completions/swift-format"

    ./.build/release/swift-format --generate-completion-script zsh > \
        "$pkgdir/usr/share/zsh/site-functions/_swift-format"
    chmod 644 "$pkgdir/usr/share/zsh/site-functions/_swift-format"

    install -Dm755 ".build/release/swift-format" "$pkgdir/usr/bin/swift-format"

    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "Documentation/"*.md "$pkgdir/usr/share/doc/$pkgname/"
}

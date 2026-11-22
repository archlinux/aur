# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor : marin <turquoise.hexagon@protonmail.com>

_name=cherry-font
pkgname="${_name}-git"
epoch=1
pkgver=1.4.r13.g34a94dc
pkgrel=1
pkgdesc='cherry, yet another bitmap font'
arch=('any')
license=('MIT')
url=https://github.com/turquoise-hexagon/cherry
provides=("${_name}")
conflicts=("${_name}")
makedepends=('git' 'xorg-fonttosfnt')

source=("$pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    # --- 1. Map: patch-id -> tag (latest version wins on collisions) ---
    declare -A tag_by_patchid
    local pid tag
    while read -r tag; do
        pid=$(git show "$tag" --format= | git patch-id --stable | awk '{print $1}')
        [[ -n "$pid" && -z "${tag_by_patchid[$pid]:-}" ]] && tag_by_patchid[$pid]="$tag"
    done < <(git tag --sort=-v:refname)

    # --- 2. Walk back from HEAD; stop at first commit whose patch-id matches a tag ---
    local matched_tag="" distance=0 commit
    while read -r commit; do
        pid=$(git show "$commit" --format= | git patch-id --stable | awk '{print $1}')
        if [[ -n "${tag_by_patchid[$pid]:-}" ]]; then
            matched_tag="${tag_by_patchid[$pid]}"
            break
        fi
        distance=$((distance + 1))
    done < <(git rev-list HEAD)

    local short_sha
    short_sha=$(git rev-parse --short HEAD)

    if [[ -n "$matched_tag" ]]; then
        echo "${matched_tag}.r${distance}.g${short_sha}"
    else
        printf "r%s.g%s" "$(git rev-list --count HEAD)" "$short_sha"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    ./make.sh
}

package() {
    cd "$srcdir/$pkgname"

    install -d -m755 "$pkgdir/usr/share/fonts/misc"
    install -D -m644 *.otb "$pkgdir/usr/share/fonts/misc"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


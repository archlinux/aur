# Maintainer: Don <theblackdonatello@gmail.com>

pkgname=dcli-arch-git
_pkgver_base=0.2.0
pkgver=0.2.0.r140.5257e7d2
pkgrel=1
pkgdesc="A declarative package management CLI tool for Arch Linux, inspired by NixOS"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/theblackdon/dcli"
license=('0BSD')
depends=('gcc-libs' 'glibc')
optdepends=(
    'fzf: for interactive TUI features'
    'paru: AUR helper support'
    'yay: AUR helper support (alternative to paru)'
    'timeshift: snapshot/backup functionality'
    'snapper: snapshot/backup functionality (alternative to timeshift)'
)
provides=('dcli')
conflicts=('dcli' 'dcli-bin')

_gitlab_project="theblackdon%2Fdcli"  # URL-encoded project path for GitLab API
source=(
    "LICENSE::https://gitlab.com/theblackdon/dcli/-/raw/main/LICENSE"
)
source_x86_64=(
    "dcli-linux-x86_64::https://gitlab.com/theblackdon/dcli/-/jobs/artifacts/main/raw/dcli-linux-x86_64?job=build-linux-x86_64"
)
source_aarch64=(
    "dcli-linux-aarch64::https://gitlab.com/theblackdon/dcli/-/jobs/artifacts/main/raw/dcli-linux-aarch64?job=build-linux-aarch64"
)
noextract=('dcli-linux-x86_64' 'dcli-linux-aarch64')
sha256sums=('0be6431936212ee8097709d38f0aef725c57c8f6f12563e8950aa8630cea74c9')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    local api="https://gitlab.com/api/v4/projects/${_gitlab_project}/repository/commits"
    local per_page=100
    local page=1
    local commit_count=0
    local short_sha=

    while :; do
        local json batch_count
        json=$(curl -fs "${api}?ref_name=main&per_page=${per_page}&page=${page}") || break
        [[ -z $json || $json == "[]" ]] && break

        batch_count=$(printf '%s' "$json" | grep -o '"id"' | wc -l)
        ((commit_count += batch_count))

        if [[ -z $short_sha ]]; then
            short_sha=$(printf '%s' "$json" | sed -n 's/.*"short_id":"\([0-9a-f]\{7,9\}\)".*/\1/p' | head -n1)
        fi

        [[ $batch_count -lt $per_page ]] && break
        ((page++))
    done

    printf "%s.r%s.%s" "${_pkgver_base}" "${commit_count:-0}" "${short_sha:-unknown}"
}

package() {
    local bin_path

    case "$CARCH" in
        x86_64) bin_path="$srcdir/dcli-linux-x86_64" ;;
        aarch64) bin_path="$srcdir/dcli-linux-aarch64" ;;
        *)
            echo "Unsupported architecture: $CARCH" >&2
            return 1
            ;;
    esac

    install -Dm755 "$bin_path" "$pkgdir/usr/bin/dcli"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# shellcheck shell=bash
# makepkg consumes these metadata variables and supplies srcdir/pkgdir.
# shellcheck disable=SC2034,SC2154
# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
# The Rust console is independent of DKMS and the legacy tools.

pkgname=mechrevo-console
pkgver=0.1.0.r1535.gcee10ec
pkgrel=2
pkgdesc='Native MECHREVO system and OEM device control console'
arch=('x86_64')
url='https://github.com/LIghtJUNction/mechrevo-drivers'
license=('GPL-2.0-or-later' 'OFL-1.1')
depends=('glibc' 'libgcc' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libglvnd' 'polkit'
         'python' 'systemd')
# Cargo enforces the GUI's Rust 1.95 minimum; rustup also provides `rust`.
makedepends=('git' 'rust' 'pkgconf' 'desktop-file-utils' 'libxml2')
optdepends=('noto-fonts-cjk: Chinese system font fallback')
options=('!strip' '!debug' '!lto')

# Always build the reviewed commit, including when using an existing local repo.
_source_commit=cee10ecbf7e86582e2e0f7ba887c13385c96c50d
_source_url=${MECHREVO_CONSOLE_SOURCE:-"${url}.git"}
source=("mechrevo-drivers::git+${_source_url}#commit=${_source_commit}"
        'best.lmm.mechrevo-console.desktop'
        'mechrevo-console.install')
sha256sums=('SKIP'
            'bca48b9200f8aa66b34f357c3b8cce4f679bba998b6e777afec047bf601576a5'
            '8778bbd1244d414adafe79a7d2187765a7e9a5da1f4efdd3d6e49c3688f52e20')
install=mechrevo-console.install

prepare() {
    cd "${srcdir}/mechrevo-drivers" || return 1
    if [[ $(git rev-parse HEAD) != "$_source_commit" ]] ||
        ! git diff-index --quiet HEAD --; then
        printf '%s\n' 'Source must be an unchanged checkout of the pinned console commit.' >&2
        return 1
    fi
    local file
    for file in console/Cargo.toml console/Cargo.lock \
        console/crates/cli/Cargo.toml console/crates/cli/src/main.rs \
        console/crates/cli/src/oem_helper.rs console/crates/core/src/privilege.rs \
        console/crates/gui/src/main.rs \
        console/resources/org.mechrevo.console.oem.policy \
        scripts/mechrevo_control.py scripts/mechrevo-gaming-hotkey.service \
        console/crates/gui/assets/fonts/Cormorant-OFL.txt \
        console/crates/gui/assets/fonts/Manrope-OFL.txt \
        docs/MECHREVO-CONSOLE.md docs/PERFORMANCE-PROFILES.md LICENSE; do
        if [[ ! -f $file || -L $file ]] ||
            ! git ls-files --error-unmatch -- "$file" >/dev/null 2>&1; then
            printf 'Required tracked regular source file missing: %s\n' "$file" >&2
            return 1
        fi
    done
    # Populate a first-time builder's cache before the strictly offline build.
    # --locked fails rather than changing the reviewed dependency graph.
    cargo fetch --manifest-path console/Cargo.toml --locked \
        --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/mechrevo-drivers" || return 1
    cargo build --manifest-path console/Cargo.toml \
        --target-dir "${CARGO_TARGET_DIR:-${srcdir}/cargo-target}" \
        --release --workspace --all-features --locked --offline
}

check() {
    desktop-file-validate "${srcdir}/best.lmm.mechrevo-console.desktop" || return 1
    local policy="${srcdir}/mechrevo-drivers/console/resources/org.mechrevo.console.oem.policy"
    xmllint --nonet --noout "$policy" || return 1
    if [[ $(xmllint --nonet --xpath \
        'boolean(count(/policyconfig/action)=1 and /policyconfig/action[@id="org.mechrevo.console.oem"]/annotate[@key="org.freedesktop.policykit.exec.path"]="/usr/lib/mechrevo-console/oem-helper" and /policyconfig/action/defaults/allow_any="no" and /policyconfig/action/defaults/allow_inactive="auth_admin" and /policyconfig/action/defaults/allow_active="auth_admin_keep")' \
        "$policy") != true ]]; then
        printf '%s\n' 'OEM policy action, helper path or authorization defaults do not match the package contract.' >&2
        return 1
    fi
}

package() {
    cd "${srcdir}/mechrevo-drivers" || return 1
    local binary candidate
    for binary in mechrevo-console mechrevo-console-gui; do
        candidate="${CARGO_TARGET_DIR:-${srcdir}/cargo-target}/release/${binary}"
        if [[ ! -f $candidate || -L $candidate || ! -x $candidate ]]; then
            printf 'Required regular executable missing: %s\n' "$candidate" >&2
            return 1
        fi
        install -Dm755 "$candidate" "${pkgdir}/usr/bin/${binary}" || return 1
    done
    candidate="${CARGO_TARGET_DIR:-${srcdir}/cargo-target}/release/mechrevo-console-oem-helper"
    if [[ ! -f $candidate || -L $candidate || ! -x $candidate ]]; then
        printf 'Required regular executable missing: %s\n' "$candidate" >&2
        return 1
    fi
    local helper="${pkgdir}/usr/lib/mechrevo-console/oem-helper"
    local policy=console/resources/org.mechrevo.console.oem.policy
    local installed_policy="${pkgdir}/usr/share/polkit-1/actions/org.mechrevo.console.oem.policy"
    if [[ ! -f $policy || -L $policy ]]; then
        printf '%s\n' 'Required regular OEM policy is missing.' >&2
        return 1
    fi
    install -Dm755 "$candidate" "$helper" || return 1
    install -Dm644 "$policy" "$installed_policy" || return 1
    if ! cmp -s "$candidate" "$helper" || ! cmp -s "$policy" "$installed_policy" ||
        [[ $(stat -c '%a' "$helper") != 755 || $(stat -c '%a' "$installed_policy") != 644 ]]; then
        printf '%s\n' 'Installed OEM helper or policy bytes/modes do not match the package contract.' >&2
        return 1
    fi
    install -Dm644 "${srcdir}/best.lmm.mechrevo-console.desktop" \
        "${pkgdir}/usr/share/applications/best.lmm.mechrevo-console.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 console/crates/gui/assets/fonts/Cormorant-OFL.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/Cormorant-OFL.txt"
    install -Dm644 console/crates/gui/assets/fonts/Manrope-OFL.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/Manrope-OFL.txt"
    install -Dm755 scripts/mechrevo_control.py "${pkgdir}/usr/bin/mechrevo-control"
    install -Dm644 scripts/mechrevo-gaming-hotkey.service \
        "${pkgdir}/usr/lib/systemd/user/mechrevo-gaming-hotkey.service"
    install -Dm644 docs/MECHREVO-CONSOLE.md \
        "${pkgdir}/usr/share/doc/${pkgname}/MECHREVO-CONSOLE.md"
    install -Dm644 docs/PERFORMANCE-PROFILES.md \
        "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE-PROFILES.md"
}

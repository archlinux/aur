# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=otf-atkinson-hyperlegible-next-nerd-git
pkgver=r17.7925f50 # Placeholder; pkgver() rewrites this automatically before build
pkgrel=1
pkgdesc="Fully patched Nerd Font version of Atkinson Hyperlegible Next and Mono (OTF, built dynamically from source)"
arch=('any')
url="https://github.com/googlefonts/atkinson-hyperlegible-next"
license=('OFL')
makedepends=('git' 'font-patcher' 'fontforge')
provides=('otf-atkinson-hyperlegible-next=1.0' 'otf-atkinsonhyperlegiblemono-nerd=3.4.0')
conflicts=('otf-atkinson-hyperlegible-next' 'otf-atkinsonhyperlegiblemono-nerd')
# Using git+https tells makepkg to clone the live repositories
source=(
    "atkinson-next::git+https://github.com/googlefonts/atkinson-hyperlegible-next.git"
    "atkinson-mono::git+https://github.com/googlefonts/atkinson-hyperlegible-next-mono.git"
)
# SKIP is required for live git repos since the checksum changes every commit
sha256sums=('SKIP' 'SKIP')

# Automatically generates a version number based on commit count + short hash
pkgver() {
    cd "$srcdir/atkinson-next"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/output"

    # Helper run by each xargs worker in its own bash subshell.
    # Returns 0 always so a single font failure doesn't abort the whole build;
    # font-patcher exits non-zero on harmless warnings which would otherwise
    # cause xargs to fail and makepkg (which runs under set -e) to abort.
    _patch_font() {
        local f="$1"
        local worker_home="$2"
        mkdir -p "$worker_home"
        # --complete    : patch in all available Nerd Font glyph sets
        # --careful     : skip glyph slots that already contain a glyph
        #                 (first suspect if any icons appear missing)
        HOME="$worker_home" /usr/bin/font-patcher \
            --complete --careful \
            --outputdir "$OUTPUTDIR/" \
            --metrics TYPO \
            "$f" || true
    }
    export -f _patch_font
    # $srcdir is not visible inside xargs subshells, so export the resolved path
    export OUTPUTDIR="$srcdir/output"

    # Collect all font paths + a unique worker home for each, then hand off
    # to xargs which runs up to nproc jobs in parallel and exits cleanly
    local i=0
    for repo in atkinson-next atkinson-mono; do
        echo "Patching $repo..."
        while IFS= read -r -d '' f; do
            printf '%s\0%s\0' "$f" "$srcdir/tmp_home_$((i++))"
        done < <(find "$srcdir/$repo/fonts/otf" -maxdepth 1 -type f -name '*.otf' -print0)
    done | xargs -0 -P "$(nproc)" -n 2 bash -c '_patch_font "$@"' _

    # Verify we actually produced output before declaring success
    local count
    count=$(find "$OUTPUTDIR" -name '*.otf' | wc -l)
    echo "Patching complete: $count fonts generated."
    [[ $count -gt 0 ]] || {
        echo "ERROR: No fonts were generated!"
        return 1
    }
}

package() {
    # Install the patched fonts to the system OTF directory
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -m644 "$srcdir/output/"*.otf "$pkgdir/usr/share/fonts/OTF/"

    # Install the license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/atkinson-next/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}

# Copyright © 2025 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of aurgen and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=aurgen
pkgver=1.12.0
pkgrel=1
pkgdesc='Generate, test and publish AUR packages for GitHub projects'
arch=('any')
url='https://github.com/eserlxl/aurgen'
license=('GPL-3.0-or-later')
validpgpkeys=('2B0541BF62E91D538C55739DF677BC1E3BD7246E')
depends=('curl' 'jq' 'util-linux' 'bash' 'coreutils' 'diffutils' 'findutils' 'gawk' 'git' 'gnupg' 'grep' 'gzip' 'make' 'pacman' 'pacman-contrib' 'sed' 'tar')
optdepends=('github-cli: create GitHub releases and upload assets in aur mode' 'shellcheck: lint mode' 'namcap: PKGBUILD checks in test mode' 'bubblewrap: sandboxed make install for runtime dependency detection')
source=("https://github.com/eserlxl/aurgen/releases/download/v1.12.0/aurgen-1.12.0.tar.gz" "https://github.com/eserlxl/aurgen/releases/download/v1.12.0/aurgen-1.12.0.tar.gz.sig")
b2sums=('bd5712aed3cc5ba4aa3ae8fafec37ce2ccd6abb657eea33505ea560174f1c8354bc76f7f9b066f0a4232b336cec0c0d9778c18cd6f00becee39558dc37504476'
        'SKIP')

build() {
    # No build steps required
    :
}

# Helper function to copy and rebase paths with optional exclusions
copy_tree() {
    local src="$1" destbase="$2" mode="$3"
    shift 3
    [[ -d "$src" ]] || return 0

    local abs_src
    abs_src="$(realpath "$src" 2>/dev/null)" || return 0

    # Patterns stay find arguments so install-YAML metacharacters are not executed.
    local -a find_cmd=(find "$abs_src" \( -type f -o -type l \))
    local exclude
    for exclude in "$@"; do
        # Trim whitespace
        exclude="${exclude#"${exclude%%[! ]*}"}"
        exclude="${exclude%"${exclude##*[! ]}"}"
        if [[ -n "$exclude" ]]; then
            find_cmd+=(-not -path "$abs_src/$exclude/*")
        fi
    done
    find_cmd+=(-print0)

    mapfile -d '' -t files < <("${find_cmd[@]}") || return 0

    for file in "${files[@]}"; do
        local relpath
        relpath="$(realpath -s --relative-to="$abs_src" "$file")"
        if [[ -L "$file" ]]; then
            mkdir -p "$(dirname "$pkgdir/$destbase/$relpath")"
            ln -s "$(readlink "$file")" "$pkgdir/$destbase/$relpath"
        else
            install -Dm"$mode" "$file" "$pkgdir/$destbase/$relpath"
        fi
    done
}

package() {
    # Note: Tarball is created without subdirectory prefix, so no cd needed
    # Install license file
    for name in LICENSE LICENSE.txt LICENSE.md LICENCE COPYING COPYING.md; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done

    # Copy sections based on configuration
    copy_tree "bin" "usr/bin" "755"
    copy_tree "lib" "usr/lib/aurgen" "644"
    copy_tree "etc" "etc/$pkgname" "644"
    copy_tree "share" "usr/share/$pkgname" "644"
    copy_tree "include" "usr/include/$pkgname" "644"
    copy_tree "local" "usr/local/$pkgname" "644"
    copy_tree "var" "var/$pkgname" "644"
    copy_tree "opt" "opt/$pkgname" "644"
    echo "$pkgver" > "$pkgdir/usr/lib/aurgen/VERSION"
}

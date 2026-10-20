# Copyright © 2025 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of aurgen and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=aurgen
pkgver=1.9.2
pkgrel=1
pkgdesc='Generate, test and publish AUR packages for GitHub projects'
arch=('any')
url='https://github.com/eserlxl/aurgen'
license=('GPL-3.0-or-later')
validpgpkeys=('2B0541BF62E91D538C55739DF677BC1E3BD7246E')
depends=('curl' 'jq' 'util-linux' 'bash' 'coreutils' 'diffutils' 'findutils' 'gawk' 'git' 'gnupg' 'grep' 'gzip' 'make' 'pacman' 'pacman-contrib' 'sed' 'tar')
makedepends=()
optdepends=('github-cli: create GitHub releases and upload assets in aur mode' 'shellcheck: lint mode' 'namcap: PKGBUILD checks in test mode' 'bubblewrap: sandboxed make install for runtime dependency detection')
source=("https://github.com/eserlxl/aurgen/releases/download/v1.9.2/aurgen-1.9.2.tar.gz" "https://github.com/eserlxl/aurgen/releases/download/v1.9.2/aurgen-1.9.2.tar.gz.sig")
b2sums=('d82c8097a7458f5d88df00da5fde64f89c67fee0bac1bd2d90b114c2ca076313fba140997bfb45096a609e3e074b34e7dde2d644a60f319e4d3f2e03ff153b6c'
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
    local -a find_cmd=(find "$abs_src" -maxdepth 5 -type f)
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
        relpath="$(realpath --relative-to="$abs_src" "$file")"
        install -Dm"$mode" "$file" "$pkgdir/$destbase/$relpath"
    done
}

package() {
    # Note: Tarball is created without subdirectory prefix, so no cd needed
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done

    # Copy sections based on configuration
    copy_tree "bin" "usr/bin" "755"
    copy_tree "lib" "usr/lib/$pkgname" "644"
    copy_tree "etc" "etc/$pkgname" "644"
    copy_tree "share" "usr/share/$pkgname" "644"
    copy_tree "include" "usr/include/$pkgname" "644"
    copy_tree "local" "usr/local/$pkgname" "644"
    copy_tree "var" "var/$pkgname" "644"
    copy_tree "opt" "opt/$pkgname" "644" '[]'
    echo "$pkgver" > "$pkgdir/usr/lib/$pkgname/VERSION"
}

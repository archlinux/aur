# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of ramcleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=ramcleaner
pkgver=0.2.0
pkgrel=1
pkgdesc='Find processes holding unused memory, attribute them to their owner, and stop them only after approval'
arch=('any')
url='https://github.com/eserlxl/ramCleaner'
license=('GPL-3.0-or-later')
validpgpkeys=('2B0541BF62E91D538C55739DF677BC1E3BD7246E')
depends=('python>=3.11')
makedepends=('git')
optdepends=('libnotify: Stop/Later/Hide/Details desktop notifications for ramcleaner watch' 'zenity: Hide duration menu and Details checklist for ramcleaner watch')
install='ramcleaner.install'
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
b2sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    # No build steps required
    :
}

check() {
    cd "$srcdir/$pkgname"
    make test
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
    cd "$srcdir/$pkgname"
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done

    # Copy sections based on configuration
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr
    python -m compileall -q -o 0 -o 1 -d /usr/lib/ramcleaner "$pkgdir/usr/lib/ramcleaner"
}

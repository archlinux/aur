# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of linux-cleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=linux-cleaner
pkgver=1.7.0
pkgrel=1
pkgdesc='Safe, configuration-driven cleaner for caches and temporary files'
arch=('any')
url='https://github.com/eserlxl/cleaner'
license=('GPL-3.0-or-later')
depends=('bash>=4.4' 'coreutils' 'findutils' 'gawk' 'sed')
makedepends=()
optdepends=('pacman-contrib: paccache-based package-cache actions' 'libnotify: desktop notifications for --notify' 'git: skip cleanup targets that hold git-tracked files')
backup=('etc/linux-cleaner/cleaner.conf')
install='linux-cleaner.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7428d4071dd83a7ee84d427accd888ed4316a65043dafb309dad3053aee52cfaa5db34033e1e55ccfb6cbc131ba1fcb5940e8c849239be7b5a3a54643505a810')

build() {
    cd "$srcdir/cleaner-$pkgver"
    make
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
    cd "$srcdir/cleaner-$pkgver"
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done

    # Copy sections based on configuration
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr
}

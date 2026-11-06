# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of lightxdm and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=lightxdm
pkgver=1.0.2
pkgrel=1
pkgdesc='Display-manager-free TTY1 login: your desktop starts and its keyring unlocks'
arch=('any')
url='https://github.com/eserlxl/lightXDM'
license=('GPL-3.0-or-later')
validpgpkeys=('2B0541BF62E91D538C55739DF677BC1E3BD7246E')
depends=('bash' 'sudo' 'gnupg' 'grep')
install='lightxdm.install'
source=("https://github.com/eserlxl/lightXDM/releases/download/v1.0.2/lightxdm-1.0.2.tar.gz" "https://github.com/eserlxl/lightXDM/releases/download/v1.0.2/lightxdm-1.0.2.tar.gz.sig")
b2sums=('46387d0ad1bfbea282ef5bf3be98c7acd38f05c057b007baeb54e0bc9442cc9a76c9624719a033509779a4d0d9838f307adc0e9e69094396ab9e472ce8dac69e'
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
    copy_tree "dotfiles" "usr/share/$pkgname/dotfiles" "644"
    copy_tree "pam" "usr/share/$pkgname/pam" "644"
    copy_tree "alpm" "usr/share/libalpm/hooks" "644"
    copy_tree "docs" "usr/share/doc/$pkgname" "644"
    install -Dm644 -t "$pkgdir/usr/share/$pkgname" install.sh uninstall.sh enable-autologin.sh
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

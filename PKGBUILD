# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of ramcleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=ramcleaner
pkgver=0.2.1
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
    make check-package
}

package() {
    cd "$srcdir/$pkgname"
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr
    python -m compileall -q -o 0 -o 1 -d /usr/lib/ramcleaner "$pkgdir/usr/lib/ramcleaner"
}

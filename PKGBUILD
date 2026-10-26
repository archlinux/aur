# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of linux-tmpcleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=linux-tmpcleaner
pkgver=1.3.0
pkgrel=1
pkgdesc='Systemd timer that deletes old /tmp entries while protecting files in use'
arch=('any')
url='https://github.com/eserlxl/tmpCleaner'
license=('GPL-3.0-or-later')
depends=('systemd>=249' 'bash' 'coreutils' 'findutils' 'gawk' 'grep' 'sed')
conflicts=('tmpcleaner')
backup=('etc/tmpcleaner/tmpcleaner.conf')
install='linux-tmpcleaner.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('57e2d50ea2c0da46a46c1e827e32f38c1f2c960548b61d7bda0edc2016771fd1812c88d6b865dcb07b242c04c5c14dd17c85abb76f1fcaadaafb4033a286f721')

build() {
    cd "$srcdir/tmpCleaner-$pkgver"
    # No build steps required
    :
}

check() {
    cd "$srcdir/tmpCleaner-$pkgver"
    make check-package
}

package() {
    cd "$srcdir/tmpCleaner-$pkgver"
    # Install license file
    for name in LICENSE LICENSE.txt LICENSE.md LICENCE COPYING COPYING.md; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr UNITDIR=/usr/lib/systemd/system
    rm -f "$pkgdir/etc/tmpcleaner/tmpcleaner.conf.default"
}

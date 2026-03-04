# Maintainer: MiguVT <cuentas@miguvt.com>

pkgname=fixvr-git
pkgver=r1.23ebaa1
pkgrel=1
pkgdesc="udev rule that fixes the Valve Index blank EDID (640×480) bug on Linux"
arch=('any')
url="https://github.com/MiguVT/fixvr"
license=('MIT')
makedepends=('git')
provides=('fixvr')
conflicts=('fixvr')
install=fixvr.install
source=("$pkgname::git+https://github.com/MiguVT/fixvr.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	# udev rule — installed under /usr/lib so pacman owns it cleanly;
	# /etc/udev/rules.d/ is reserved for local admin overrides.
	install -Dm644 src/99-valve-index-reboot.rules \
		"$pkgdir/usr/lib/udev/rules.d/99-valve-index-reboot.rules"

	# License — upstream declares MIT; embed a minimal notice because the
	# repo does not yet ship a dedicated LICENSE file.
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
MIT License

Copyright (c) 2026 MiguVT <contacto@miguvt.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

	# Install the upstream README as documentation.
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}

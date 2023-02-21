# irccd packaging script for ArchLinux - Copyright (c) 2013-2022 Pierre Choffet

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

pkgname=irccd
pkgver=4.0.3
pkgrel=1
epoch=
pkgdesc='A flexible, fast IRC bot'
arch=('x86_64')
url='http://projects.malikania.fr/irccd/'
license=('custom:ISC')
groups=()
depends=()
makedepends=('bison' 'cmake' 'curl' 'flex' 'mercurial' 'openssl')
checkdepends=()
optdepends=()
provides=()
conflicts=('irccd-hg')
replaces=()
backup=('etc/irccd.conf')
options=()
changelog=
source=("http://releases.malikania.fr/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz" 'irccd-sysusers.conf')
noextract=()
md5sums=('7545ceefc0c3b9217a2b930fc3c6c326'
         '9a2172be1a0b56ee719048cb0b4ee594')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_SYSCONFDIR='/etc' \
		-DIRCCD_WITH_SYSTEMD=On \
		-DIRCCD_WITH_TESTS=Off
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp "$pkgname-$pkgver"/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Copy default config files and sysusers
	mv "$pkgdir/etc/irccd.conf.sample" "$pkgdir/etc/irccd.conf"
	install -D -m 0644 "$srcdir/irccd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/irccd.conf"
}

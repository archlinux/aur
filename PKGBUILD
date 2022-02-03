# irccd packaging script for ArchLinux - Copyright (c) 2013-2021 Pierre Choffet

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

pkgname=irccd-hg
pkgver=1147.cbc5dfb0b029
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
provides=('irccd')
conflicts=('irccd')
replaces=()
backup=('etc/irccd.conf')
options=()
changelog=
source=("$pkgname"::'hg+http://hg.malikania.fr/irccd' 'irccd-sysusers.conf')
noextract=()
md5sums=('SKIP'
         '9a2172be1a0b56ee719048cb0b4ee594')

pkgver() {
	cd $pkgname
	printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cmake -S "$pkgname" -B build \
	      -DCMAKE_INSTALL_PREFIX='/usr' \
	      -DIRCCD_WITH_SYSTEMD=On
	cmake --build build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp "$pkgname"/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Copy default config files and sysusers
	install -D -m 0644 "$pkgdir/usr/etc/irccd.conf.sample" "$pkgdir/etc/irccd.conf"
	install -D -m 0644 "$srcdir/irccd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/irccd.conf"
}

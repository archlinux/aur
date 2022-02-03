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
pkgver=4.0.0
pkgrel=1
epoch=
pkgdesc='A flexible, fast IRC bot'
arch=('x86_64')
url='http://projects.malikania.fr/irccd/'
license=('custom:ISC')
groups=()
depends=()
makedepends=('mercurial' 'openssl')
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
md5sums=('f8818c1a3414621b3d2cfb080d915bf5'
         '9a2172be1a0b56ee719048cb0b4ee594')

build() {
	mkdir "$srcdir/$pkgname-$pkgver/build"
	cd "$srcdir/$pkgname-$pkgver/build"
	
	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DIRCCD_WITH_SYSTEMD=On ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp ../LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Copy default config files and sysusers
	install -D -m 0644 "$pkgdir/usr/etc/irccd.conf.sample" "$pkgdir/etc/irccd.conf"
	install -D -m 0644 "$srcdir/irccd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/irccd.conf"
}

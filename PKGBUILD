# irccd packaging script for ArchLinux - Copyright (c) 2013 Pierre Choffet

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
pkgver=94.339808b0c007
pkgrel=1
epoch=
pkgdesc="IRC client daemon"
arch=('i686' 'x86_64')
url="http://projects.malikania.fr/irccd/"
license=('custom:ISC')
groups=()
depends=()
makedepends=('mercurial' 'cmake' 'openssl')
checkdepends=()
optdepends=()
provides=('irccd')
conflicts=('irccd')
replaces=()
backup=("etc/irccd.conf" "etc/irccdctl.conf")
options=()
changelog=
source=("$pkgname"::"hg+http://hg.malikania.fr/irccd")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd $srcdir/$pkgname
	mkdir _build
	cd _build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -DWITH_CONFDIR='../etc' -DWITH_MANDIR='share/man' -DWITH_DOCDIR='share/doc/irccd' -DWITH_PLUGINDIR='share/irccd/plugins'
	make
}

package() {
	cd $srcdir/$pkgname/_build
	make DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp ../LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
	
	# Copy systemd unit
	mkdir -p $pkgdir/usr/lib/systemd/system/
	sed 's/@PATH@/\/usr\/bin\/irccd/' contrib/irccd.service > $pkgdir/usr/lib/systemd/system/irccd.service
	sed -i 's/Type=forking/Type=simple/' $pkgdir/usr/lib/systemd/system/irccd.service
	
	# Copy default config files
	mv $pkgdir/etc/irccd.conf.sample $pkgdir/etc/irccd.conf
	mv $pkgdir/etc/irccdctl.conf.sample $pkgdir/etc/irccdctl.conf
}

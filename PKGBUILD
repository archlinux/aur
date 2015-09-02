# irccd packaging script for ArchLinux - Copyright (c) 2013-2015 Pierre Choffet

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
pkgver=1.1.6
pkgrel=1
epoch=
pkgdesc="IRC client daemon"
arch=('i686' 'x86_64')
url="http://projects.malikania.fr/irccd/"
license=('custom')
groups=()
depends=('libxdg-basedir' 'libircclient')
makedepends=('cmake' 'libircclient')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("etc/irccd.conf" "etc/irccdctl.conf")
options=()
changelog="ChangeLog"
source=("http://releases.malikania.fr/$pkgname/$pkgname-$pkgver-source.tar.gz")
noextract=()
md5sums=('aae1c36c453a69add58ff5c31de997e6')

build() {
	cd $srcdir/$pkgname-$pkgver-source
	mkdir _build
	cd _build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DETCDIR=../etc -DMANDIR=share/man -DDOCDIR=share/doc/irccd -DMODDIR=share/irccd/plugins
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver-source/_build
	make DESTDIR="$pkgdir" install

	cd ..
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	
	# Copy systemd unit
	mkdir -p $pkgdir/usr/lib/systemd/system/
	cp contrib/irccd.service $pkgdir/usr/lib/systemd/system/
	
	# Copy default config files
	cd $pkgdir/etc/
	mv irccd.conf.sample irccd.conf
	mv irccdctl.conf.sample irccdctl.conf
}

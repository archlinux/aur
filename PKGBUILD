#maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='marrie-git'
_gitname='marrie'
_gitroot="git://github.com/rafaelmartins/marrie.git"
pkgver=0.3.1.r4.g5fb3db1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/rafaelmartins/marrie"
depends=('python2' 'python2-feedparser')
optdepends=('wget: content downloading tool'
			'mplayer: video/audio playback support')
makedepends=('git')
license=('BSD')
pkgdesc="A simple podcast client that runs on the Command Line Interface."
provides=('marrie')
conflicts=('marrie')
source=("git://github.com/rafaelmartins/marrie.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}
	# rm -rf marrie	
	msg "Connecting to GIT server...."

	if [ -d "$_gitname" ] ; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"
}

package() {
 # install python executable and licence
	install -D -m755 "$srcdir/$_gitname/marrie.py" "$pkgdir/usr/bin/marrie.py"
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"

 # make sure that the system invokes python2 when running marrie
	echo "python2 /usr/bin/marrie.py" >> $pkgdir/usr/bin/marrie
	chmod +x $pkgdir/usr/bin/marrie
}


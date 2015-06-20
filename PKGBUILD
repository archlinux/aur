#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='zeronet-git'
_gitname='ZeroNet'
_gitroot='https://github.com/HelloZeroNet/ZeroNet.git'
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/HelloZeroNet/ZeroNet"
depends=('python2>=2.7.10'
		'python2-gevent'
		'python2-msgpack'
		)
# optdepends=(': ')
makedepends=('git')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
provides=(zeronet)
conflicts=(zeronet)
source=("git://github.com/HelloZeroNet/ZeroNet.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d "$_gitname" ] ; then
		cd "$_gitname" && git pull origin master
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"
	
	#  cd "${_gitname}"
#	cd "$srcdir/$_gitname"

# run setup.py
#	cd "$srcdir/$_gitname"
#	python2 setup.py build	
}

package() {
# install python scripts
   cd "$srcdir/$_gitname"
   install -D -d "$srcdir/$_gitname/src" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/src"
   install -D -d "$srcdir/$_gitname/tools" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/tools"
   install -D -d "$srcdir/$_gitname/plugins" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/plugins"
   install -D "$srcdir/$_gitname/start.py" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/start.py"
   install -D "$srcdir/$_gitname/zeronet.py" "$pkgdir/usr/lib/python2.7/site-packages/$_gitname/zeronet.py"
   ln -s "/usr/lib/python2.7/site-packages/$_gitname/zeronet.py" "/usr/bin/zeronet.py"

# install license
	install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


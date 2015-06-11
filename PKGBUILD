#Maintainer: Lothar_m <lothar_m at riseup dot net>

pkgname='python2-tstoolbox-git'
_gitname='tstoolbox'
_gitroot='https://bitbucket.org/timcera/tstoolbox.git'
pkgver=0.8.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/timcera/tstoolbox"
depends=('python2>=2.7.6'
		'python2-pandas-git'
		'python2-baker>=1.3'
		'python2-dateutil>=1.3'
		)
# optdepends=(': ')
makedepends=('git')
license=('Sleepycat')
pkgdesc="The tstoolbox is a python script to manipulate time-series on the command line or by function calls within Pandas."
provides=(tstoolbox)
conflicts=(tstoolbox)
# source=("git://bitbucket.org/timcera/tstoolbox.git")
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
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi
	msg "GIT checkout done or server timeout"
	
	#  cd "${_gitname}"
	cd "$srcdir/$_gitname"

# run setup.py
	cd "$srcdir/$_gitname"
	python2 setup.py build	
}

package() {
# install tstoolbox
   cd "$srcdir/$_gitname"
   python2 setup.py install --root=$pkgdir

# install license
	install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


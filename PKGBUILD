#Maintainer: Lothar_m <lothar_m at riseup dot net>
pkgname='python2-swmmtoolbox-git'
_gitname='swmmtoolbox'
_gitroot='https://bitbucket.org/timcera/swmmtoolbox.git'
pkgver=0.5.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/timcera/swmmtoolbox"
depends=('python2-construct>=2.5'
		'python2-tstoolbox-git>=0.8'
		)
optdepends=('swmm5-git: swmm5 computational engine')
makedepends=('git')
license=('Sleepycat')
pkgdesc="The swmmtoolbox is a python script that extracts data from the SWMM5 binary output file."
provides=(swmmtoolbox)
conflicts=(swmmtoolbox)
# source=("git://bitbucket.org/timcera/swmmtoolbox.git")
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


# Maintainer: Jingbei Li <i@jingbei.lli>
pkgname='kaldi-sph2pipe'
_pkgname='kaldi'
pkgdesc='Speech recognition research toolkit'
pkgver=5.2.r7627.323100178
pkgrel=1
makedepends=('gcc5' 'git' 'wget' 'subversion')
depends=('python2' 'openblas-lapack')
optdepends=('cuda: For GPU support')
arch=('x86_64' 'i686')
url='https://github.com/kaldi-asr/kaldi'
license=('APACHE')
source=("git+${url}")
sha256sums=('SKIP')

pkgver () {
	cd "${_pkgname}"
	(
	set -o pipefail
	echo -n `cat src/.version`.
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare(){
	cd $srcdir/$_pkgname
	find . -name '*.py' -exec sed '1s/python/python2/' -i {} \;

	if (pacman -Q cuda &> /dev/null); then
		msg2 "Compiling with CUDA support"
		_cuda_config_opts="--cudatk-dir=/opt/cuda"
	else
		msg2 "Compiling _without_ CUDA support"
	fi
}

build () {
	cd $srcdir/$_pkgname/tools
	make sph2pipe
}

package () {
	SPH2PIPE=`find $srcdir/$_pkgname/tools/ -type d -name 'sph2pipe*' -printf '%P\n'`
	install -Dm755 $srcdir/$_pkgname/tools/$SPH2PIPE/sph2pipe $pkgdir/opt/$pkgname/tools/$SPH2PIPE/sph2pipe
}

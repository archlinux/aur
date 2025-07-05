#

pkgname=tubeamp-designer-git
pkgver=1.2.1.r1.gadefa84
pkgrel=2
pkgdesc="Standalone software guitar processor, editor of *.tapf profile files for tubeAmp (KPP) and guitar amp profiler."
arch=('x86_64')
url="https://github.com/olegkapitonov/tubeAmp-Designer"
license=('GPL3')
groups=()
depends=(
'cairo' 'fftw' 'zenity' 'zita-convolver' 'zita-resampler'
'qt5-base' 'qt5-tools' 'jack' 'gsl'
)
makedepends=('git' 'lv2' 'boost' 'meson' 'faust' 'xcb-util' 'xcb-util-wm')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(
	"${pkgname%-*}::git+${url}"
	meson06.diff::https://github.com/robinrosenberger/tubeAmp-Designer/commit/4cffb3cffbde4ba3bca0a5a01e568402426f58ec.diff
)
md5sums=('SKIP'
         '4a660b7ef6028826b45185b9dc6ef835')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepapre() {
	cd "$srcdir/${pkgname%-*}"
	git apply ../meson06.diff
}

build() {
	cd "$srcdir/${pkgname%-*}"
	#meson setup builddir -Dladspa=disabled --prefix=/usr
	meson setup builddir --prefix=/usr
	ninja -C builddir
}

package() {
	cd "$srcdir/${pkgname%-*}"
	DESTDIR="$pkgdir/" ninja -C builddir install
}


pkgname=dl-fldigi-git
_gitname="dl-fldigi"
pkgver=DL3.1.r245.g501f869
pkgrel=2
provides=('dl-fldigi')
pkgdesc="Tracking Program for UK HAB Launches by James Coxon"
arch=('i686' 'x86_64')
url="https://github.com/jamescoxon/dl-fldigi"
license=('GPL')
depends=('fltk' 'libsamplerate' 'libpng')
optdepends=('pulseaudio: pulseaudio support'
#'cty: callsign database support'
'xmlrpc-c-abyss: XML-RPC control'
'hamlib: rig control through hamlib'
'portaudio: PortAudio support'
'libsndfile: sound file support')
source=('git+https://github.com/jamescoxon/dl-fldigi.git' 'tests-remove.patch')
md5sums=('SKIP' '52f9d57f01db48e35c2e8a1d28d70fd4')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	git checkout DL3.1
	git submodule init
	git submodule update
}

build() {
	cd "$_gitname"
	patch -Np1 -i "${srcdir}/tests-remove.patch"
	autoreconf -vfi
	./configure --disable-flarq --enable-optimizations=native --prefix=/usr
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir" install
}


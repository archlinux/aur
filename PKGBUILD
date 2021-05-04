pkgname=xava-git
_pkgname=xava
pkgver=0.6.3.1.r147.g71db641
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'libx11' 'sdl2' 'portaudio' 'sndio' 'mesa')
makedepends=('cmake' 'git')
source=('git+https://github.com/nikp123/xava')
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd $_pkgname
  install -Dm755 build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  cd build
  for i in filter*.so out*.so in*.so; do
    install -Dm755 $i "$pkgdir/usr/lib/xava/$i"
  done
  cd ..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 build/"$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
  install -Dm644 assets/linux/"$_pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$_pkgname".svg
  install -Dm644 example_files/config "$pkgdir"/usr/share/xava/config.example
}


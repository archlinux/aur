_pkgname=tartube
pkgname=tartube-git
pkgver=2.4.260.r11.gc5745b8
pkgrel=1
pkgdesc='A GUI front-end for youtube-dl, partly based on youtube-dl-gui and written in Python 3 / Gtk 3 (git version)'
arch=('any')
url='https://github.com/axcore/tartube'
license=('GPL3')
depends=('libibus'
         'libgexiv2'
         'python-requests'
         'python-gobject'
         'libblockdev'
         'python-playsound'
         'python-feedparser')
optdepends=('ffmpeg: Video playback support'
            'python-moviepy'
            'python-mutagen: To embed thumbnails into the videos, preferred by yt-dlp'
            'atomicparsley: To embed thumbnails into the videos')
makedepends=('python-setuptools')
source=("$_pkgname::git+https://github.com/axcore/tartube.git")
sha256sums=('SKIP')
conflicts=('tartube')

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  _sitepkgs_dir="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  mv "${pkgdir}/tartube/icons" "${pkgdir}${_sitepkgs_dir}/tartube/"
  rm -rvf "${pkgdir}/tartube/"
  install -d "${pkgdir}/usr/share/applications" \
  "${pkgdir}/usr/share/pixmaps"
  install -Dm644 pack/tartube.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}


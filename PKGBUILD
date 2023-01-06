pkgname=tartube-git
pkgver=2.4.165.r8.gc71a96f
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
source=("$pkgname::git+https://github.com/axcore/tartube.git")
sha256sums=('SKIP')
conflicts=('tartube')

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long --tags | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

# build() {
#   cd $pkgname
#   python3 -m build --wheel --no-isolation
# }

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # python setup.py install --root="$pkgdir/" --optimize=1
  # python3 -m pip install ${srcdir}/dist/*.whl
  _sitepkgs_dir="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  mv "${pkgdir}/tartube/icons" "${pkgdir}${_sitepkgs_dir}/tartube/"
  rm -rvf "${pkgdir}/tartube/"
  install -d "${pkgdir}/usr/share/applications" \
  "${pkgdir}/usr/share/pixmaps"
  install -Dm644 pack/tartube.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}


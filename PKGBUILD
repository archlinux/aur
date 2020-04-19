# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna-python3-git
pkgver=0.5.2.r152.gb0db813
pkgrel=2
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio'
arch=('x86_64')
url=https://github.com/masmu/pulseaudio-dlna
license=('GPL3')
depends=('python-chardet' 'python-dbus' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-setuptools')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
provides=('pulseaudio-dlna')
conflicts=('pulseaudio-dlna')
source=("git+$url.git#branch=python3"
        'wait_for_chromecast.patch::https://github.com/masmu/pulseaudio-dlna/commit/d46f419abd5105e48342ee45219cbf557d342af4.patch')
sha512sums=('SKIP'
            '8bc5a15184f049f5b385796eb0ee1b2b6b2c535c24a5317f227975041a49a50d60b4c5d95276a9c5c4a33b33169917938a025a6f80294e05bd63f6a4784e17d5')

pkgver() {
  cd pulseaudio-dlna
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pulseaudio-dlna
  sed -i '/dbus-python/d' setup.py
  # https://github.com/masmu/pulseaudio-dlna/pull/398
  patch -p1 -i ../wait_for_chromecast.patch
}

build() {
  cd pulseaudio-dlna
  python setup.py build
}

package() {
  cd pulseaudio-dlna
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

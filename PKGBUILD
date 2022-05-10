# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.5.2.r152.gb0db813
pkgrel=6
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio'
arch=('any')
url=https://github.com/masmu/pulseaudio-dlna
license=('GPL3')
depends=('dbus-python' 'python-chardet' 'python-docopt' 'python-gobject'
         'python-lxml' 'python-netifaces' 'python-notify2' 'python-psutil'
         'python-pychromecast6' 'python-pyroute2' 'python-requests'
         'python-setproctitle' 'python-setuptools')
makedepends=('git')
optdepends=('faac: AAC transcoding support'
            'ffmpeg: multiple formats support'
            'flac: FLAC transcoding support'
            'lame: MP3 transcoding support'
            'opus-tools: OPUS transcoding support'
            'sox: WAV transcoding support'
            'vorbis-tools: OGG transcoding support')
source=("git+$url.git#commit=b0db8137224f5a293329a60187365168304c3768"
        'wait_for_chromecast.patch::https://github.com/masmu/pulseaudio-dlna/commit/d46f419abd5105e48342ee45219cbf557d342af4.patch')
b2sums=('SKIP'
        '66b5247cae12cc52df910f1594a6d181cb7bdc252a58bed4802101dbd2b02e30791faff542ffc7cfa23a3d82b2446a5be9c1a046f1b53a8287b7ea436aee8067')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i '/dbus-python/d' setup.py
  # https://github.com/masmu/pulseaudio-dlna/pull/398
  patch -p1 -i ../wait_for_chromecast.patch
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:

# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ZaZam <zazaamm ät gmail döt com>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=pulseaudio-dlna
pkgver=0.5.2.r152.gb0db813
pkgrel=6
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio'
arch=('x86_64')
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
        '4e846ebd9ab9ee005a8809ab33523fdcfcba5bfd9e1ed7ca28bfd17fa3af4440ba44dfdeeee93c8103bf041858ace939184d39e919b050c56d6fbc9cde6cfdb7')

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

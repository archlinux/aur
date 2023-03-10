# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=hdctools-git
pkgver=r2039.e3a47a92
pkgrel=1
pkgdesc='Chrome OS Hardware Debug & Control Tools'
url='http://sites.google.com/a/google.com/chromeos-partner/hardware-control-and-debug'
arch=(i686 x86_64)
depends=(python python-pyusb python-pyserial python-pexpect libftdi python-numpy ec-devutil-git)
makedepends=(tidy python-setuptools python-pytest)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/third_party/hdctools
        remove-duplicated-check.patch)
sha1sums=('SKIP'
          'c6535002d57c3b1a0db6d669e3f4b0efaa3d22ac')

#TODO:
# - figure out compile problem with CPPFLAG
# - add udev/systemd rule that automacially starts a daemon if the device is connected

pkgver() {
  cd hdctools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd hdctools
  patch -p1 < ../remove-duplicated-check.patch
}

build() {
  cd hdctools

  # build does not like flags provided by Arch. figure out why.
  unset CPPFLAGS

  make all
}

check() {
  cd hdctools
  # python setup.py test
}

package() {
  cd hdctools
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  site=`python -c 'import site; print(site.getsitepackages()[0])'`

  rm "$pkgdir"/$site/*.{d,o}

  # ctypes cannot load shared libs from /usr/lib/python2.7/site-packages/
  # move the libs to standard location
  mv "$pkgdir"/$site/lib*.so "$pkgdir"/usr/lib
}

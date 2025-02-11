# Maintainer:
# Contributor: Michał Kopeć <michal@nozomi.space>

_pkgname="xone"
pkgname="xone-dkms-git"
pkgver=0.3.r94.g6b9d59a
pkgrel=2
pkgdesc='Modern Linux driver for Xbox One and Xbox Series X|S controllers'
url="https://github.com/dlundqvist/xone"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'dkms'
)
makedepends=(
  'git'
)
optdepends=(
  'xone-dongle-firmware: for wireless controllers'
)

provides=('xone-dkms')
conflicts=('xone-dkms')

_pkgsrc="dlundqvist.xone"
source=(
  "$_pkgsrc"::"git+https://github.com/dlundqvist/xone.git"
  "xow_dongle-$pkgver.cab"::"http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab"
)
sha256sums=(
  'SKIP'
  '65736a84ff4036645b8f8ec602bed91ab6353019c9cb3233decab9feec0f6f04'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  # set module version
  find "$_pkgsrc" -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  # enable debug
  #echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  # copy module to /usr/src
  install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp --reflink=auto -a "$_pkgsrc"/* "$pkgdir/usr/src/$_pkgname-$pkgver/"

  # blacklist xpad module
  install -D -m 644 "$_pkgsrc/install/modprobe.conf" "$pkgdir/usr/lib/modprobe.d/xone-blacklist.conf"
}

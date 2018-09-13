# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=compton-git
_gitname=compton
epoch=1
pkgver=1.r1.g265dc67_2018.09.10
pkgrel=1
pkgdesc="X Compositor (a fork of xcompmgr-dana) (git-version)"
arch=(i686 x86_64)
url="https://github.com/yshui/compton"
license=('MIT')
depends=('libgl' 'libdbus' 'libxcomposite' 'libxdamage' 'libxrandr' 'pcre' 'libconfig' 'libxinerama' 'hicolor-icon-theme')
makedepends=('git' 'asciidoc' 'mesa')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
provides=('compton')
conflicts=('compton')
source=(git+"https://github.com/yshui/compton.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    _ver=$(git describe --long | sed 's/\([^-]*-g\)/r\1/')
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s\n" "$_ver" "$_date" | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr
  make docs
}

package() {
  cd "$srcdir/$_gitname"

  make PREFIX="$pkgdir/usr" install

  # install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"

  # example conf
  install -D -m644 "compton.sample.conf" "$pkgdir/etc/xdg/compton.conf.example"
}

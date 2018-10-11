# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=compton-git
_gitname=compton
epoch=2
pkgver=Next.r558.gde6e2f5_2018.10.10
pkgrel=1
pkgdesc="X Compositor (a fork of xcompmgr-dana) (git-version)"
arch=(i686 x86_64)
url="https://github.com/yshui/compton"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme')
makedepends=('git' 'asciidoc' 'mesa')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
provides=('compton')
conflicts=('compton')
source=(git+"https://github.com/yshui/compton.git#branch=next")
md5sums=("SKIP")

pkgver() {
    cd ${_gitname}
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, so we can't rely on --long being incremental :(
    _commits=$(git rev-list --count HEAD)
    _hash=$(git rev-parse --short HEAD)
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s.r%s.g%s_%s\n" "${_tag}" "${_commits}" "${_hash}" "${_date}" | sed 's/-/./g'
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
  install -D -m644 "LICENSES/MIT" "$pkgdir/usr/share/licenses/$_gitname/LICENSE-MIT"

  # example conf
  install -D -m644 "compton.sample.conf" "$pkgdir/etc/xdg/compton.conf.example"
}

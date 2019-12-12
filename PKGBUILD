# Maintainer: Magnus Groß magnus dot gross 21 at gmail dot com

_pkgname=compton-tryone-blackcapcoder
pkgname="$_pkgname"-git
_gitname=compton
pkgver='v0.1_beta2.r129.gcdf1476'
pkgrel=3
pkgdesc='Merge of tryone and BlackCapCoder compton forks'
arch=(x86_64)
url='https://github.com/magnus-gross/compton'
license=(MIT)
provides=('compton')
conflicts=('compton')
makedepends=(asciidoc git mesa meson ninja setconf)
depends=(hicolor-icon-theme libconfig libdbus libev libgl libxdg-basedir pcre
         pixman xcb-util-image xcb-util-renderutil libxcomposite)
backup=(etc/xdg/compton.conf)
optdepends=('dbus:          For controlling compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
source=(compton.conf
        "git+https://github.com/magnus-gross/compton.git")
sha256sums=('c25e5b741a3a76928d1866f0097c482844e272b41823c24486a91cb39a97341d'
            'SKIP')

pkgver() {
  cd compton
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd compton
  setconf compton.desktop Exec compton
  setconf compton.desktop Comment 'Compositor for X11'
  setconf compton.desktop TryExec /usr/bin/compton
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

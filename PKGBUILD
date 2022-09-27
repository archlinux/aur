# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: TingPing <tingping@fedoraproject.org>
# Maintainer: Steven Allen <steven@stebalien.com>

_pkgname=pithos
pkgname=$_pkgname-git
pkgver=1.5.1.r23.g0a228ab
pkgrel=1
pkgdesc='Native Pandora Radio client'
arch=('any')
url="https://pithos.github.io/"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'libsecret' 'python-cairo'
         'gst-plugins-good' 'gst-libav' 'gst-plugins-base')
optdepends=('libkeybinder3: for media keys plugin'
            'python-pacparser: PAC proxy support'
            'python-pylast: Last.fm scrobbling support'
            'python-systemd: Logging to the system journal')
makedepends=('git' 'meson' 'appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname-bzr" "$_pkgname")
sha256sums=('SKIP'
            '6d29178697384fb046d9d25c6c2482f353a4484ec4f0a5b9080d1a26aa24f839')
source=('git+https://github.com/pithos/pithos.git'
        'systemd.service')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  echo "SystemdService=pithos.service" >> "data/io.github.Pithos.service.in"
}

build() {
  cd "$srcdir"
  if [[ -d ./build/ ]]; then
         rm -rf ./build/
  fi
  mkdir build
  meson "$_pkgname" build --prefix=/usr
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir" ninja install
  install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/user/pithos.service"
}

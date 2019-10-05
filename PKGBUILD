# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: <skrylar@UFO>

_pkgname=ingen
pkgname="${_pkgname}-git"
pkgver=0.5.1.r2789.f48f9d69
pkgrel=1
pkgdesc="A modular plugin host for JACK and LV2."
arch=('i686' 'x86_64')
url="http://drobilla.net/software/${_pkgname}/"
license=('GPL')
depends=('alsa-lib' 'ganv>=1.5.0' 'jack' 'lilv>=0.21.5' 'lv2>=1.15.4'
         'portaudio' 'python-rdflib' 'raul>=0.8.10' 'suil>=0.8.7' 'serd>=0.30'
         'sord>=0.12.0')
makedepends=('git')
optdepends=(
    'lv2-plugins: various useful LV2 plug-in packages'
)
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+http://git.drobilla.net/cgit.cgi/ingen.git/"
        "ingen-ingenish-python3.diff")
md5sums=('SKIP'
         '210743fd775951fb9e8641b13541e097')


pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=$(grep ^INGEN_VERSION wscript | cut -f 2 -d "'")
  local rev=$(git rev-list --count HEAD)
  local githash=$(git rev-parse --short HEAD)
  echo "${ver}.r${rev}.${githash}"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Fix 'does not look like a valid URI' warning
  # and decode command responses.
  patch -p1 -N -r - -i "${srcdir}/ingen-ingenish-python3.diff"
}

build() {
  cd "$srcdir/${_pkgname}"

  python waf configure --prefix=/usr
  python waf build
}

package() {
  cd "$srcdir/${_pkgname}"

  python waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

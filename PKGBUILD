# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: <skrylar@UFO>

_pkgname=ingen
pkgname="${_pkgname}-git"
pkgver=0.5.1.r2797.6c5e9239
pkgrel=2
pkgdesc="A modular plugin host for JACK and LV2 (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/${_pkgname}/"
license=('GPL')
depends=('alsa-lib' 'ganv>=1.5.4' 'jack' 'lilv>=0.21.5' 'lv2>=1.16.0'
         'portaudio' 'python-rdflib' 'raul>=1.0.0' 'suil>=0.8.7' 'serd>=0.30'
         'sord>=0.12.0')
makedepends=('git')
optdepends=(
    'lv2-plugins: various useful LV2 plug-in packages'
)
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/drobilla/ingen.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')


prepare() {
  cd "$srcdir/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=$(grep ^INGEN_VERSION wscript | cut -f 2 -d "'")
  local rev=$(git rev-list --count HEAD)
  local githash=$(git rev-parse --short HEAD)
  echo "${ver}.r${rev}.${githash}"
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

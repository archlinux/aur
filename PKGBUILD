# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=lv2
pkgname="${_pkgname}-git"
pkgver=1.16.2.r1186.18a9aef
pkgrel=1
pkgdesc="A standard for plugins and matching host applications, mainly targeted at audio processing and generation."
arch=('i686' 'x86_64')
url="http://lv2plug.in/"
license=('custom:ISC')
makedepends=('git' 'python' 'libsndfile' 'gtk2')
optdepends=('libsndfile: example sampler plugin'
            'gtk2: example scope plugin'
            'python: lv2specgen script')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" 'lv2core' "${_pkgname}-svn")
conflicts=("${_pkgname}" "${_pkgname}-svn")
replaces=('lv2core')
source=("${_pkgname}::git+https://gitlab.com/lv2/lv2.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo $(awk -F "'" '/^VERSION/{print $2}' wscript).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure --prefix=/usr
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

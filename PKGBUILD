# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=lv2
pkgname="${_pkgname}-git"
pkgver=1.17.0.r1192.06d3f56
pkgrel=1
pkgdesc="Plugin standard for audio systems (git version)"
arch=('i686' 'x86_64')
url="http://lv2plug.in/"
license=('custom:ISC')
makedepends=('asciidoc' 'doxygen' 'git' 'gtk2' 'libsndfile' 'pygmentize'
             'python-pygments' 'python-rdflib')
optdepends=('libsndfile: example sampler plugin'
            'gtk2: example scope plugin'
            'python-pygments: for lv2specgen.py'
            'python-rdflib: for lv2specgen.py')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" 'lv2core' "${_pkgname}-svn")
conflicts=("${_pkgname}" "${_pkgname}-svn")
replaces=('lv2core')
source=("${_pkgname}::git+https://gitlab.com/lv2/lv2.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(grep '^VERSION' wscript | cut -d "'" -f 2)
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure \
    --prefix=/usr \
    --docs \
    --docdir=/usr/share/doc/${pkgname}
  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

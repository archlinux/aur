# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Contributor: Vladimir Panteleev <arch-pkg at thecybershadow dot net>

pkgname=rtags
pkgver=2.37
pkgrel=1
pkgdesc='A client/server application that indexes C/C++ code'
arch=('i686' 'x86_64')
_url='https://github.com/Andersbakken'
url="${_url}/rtags"
license=('GPL3')
depends=('bash' 'clang')
conflicts=("${pkgname}-git")
makedepends=('cmake' 'git' 'llvm' 'zlib')
optdepends=('bash-completion: for bash completion' 'zlib')
source=("git+${_url}/rtags.git#tag=v${pkgver}"
        "git+${_url}/rct.git"
        rdm.service
        rdm.socket
)
sha256sums=('SKIP'
            'SKIP'
            'c2235b4360442d309f14a38cbd7a7cbb2091061cb1d12a827ef173c1aa0bf556'
            '56bf4f3e8208ea142c61ed6f80b4907f15e2bab8d690763cff8fb15f893ad16d')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.src/rct.url "${srcdir}"/rct
  git config submodule.src/selene.url "${srcdir}"/Selene
  git config submodule.src/lua.url "${srcdir}"/lua
  git submodule update
}

build() {
  cd "${pkgname}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -D --mode=644 "${srcdir}"/rdm.service \
    "${pkgdir}"/usr/lib/systemd/user/rdm.service
  install -D --mode=644 "${srcdir}"/rdm.socket \
    "${pkgdir}"/usr/lib/systemd/user/rdm.socket

  # Remove after https://github.com/Andersbakken/rtags/pull/1213 is
  # merged and appears in a tagged release
  cd "${srcdir}/${pkgname}"
  install -D --mode=644 LICENSE.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:

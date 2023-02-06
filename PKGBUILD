# Maintainer: xeruf <27jf at pm dot me>

_pkgname='synct'
pkgname="${_pkgname}-git"
pkgver=r25.3ee9c8e
pkgrel=1
pkgdesc='A POSIX shell client for the Syncthing REST API with personal idiosyncracies'
arch=('any')
url="https://github.com/xeruf/${_pkgname}"
license=('Unlicense')
depends=(coreutils grep curl bat)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('git: merging in synct-diff'
            'jrnl: auto-merging journal conflicts'
            'emacs: merging with ediff in synct-diff')
source=("git+${url}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/"
  local bin="${pkgdir}/usr/bin"
  install -D --target-directory "$bin" ${_pkgname}*
  sed -i "s/Usage/${_pkgname} version ${pkgver}\n\0/" "$bin/${_pkgname}"
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

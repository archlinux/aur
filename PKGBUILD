# Maintainer: Viktor Nagy <viktor.nagy1995@gmail.com>
pkgname=lsx-git
pkgver=1
pkgrel=2
pkgdesc="Navigate through terminal like a pro"
arch=('x86_64')
_repo_prefix='github.com/souvikinator'
_repo_name="${pkgname%-git}"
url="https://github.com/souvikinator/lsx"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=()
provides=("lsx")
source=('lsx-git::git://github.com/souvikinator/lsx.git')

sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  mkdir -p "${srcdir}/src/${_repo_prefix}"
  ln -snf "${srcdir}/${_repo_name}" "${srcdir}/src/${_repo_prefix}/${_repo_name}"
}

clean() {
  # Clean up symlink
  rm -f "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  rm -f "${_repo_name}.bin"
}

build () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${GOPATH}/bin"

  chmod +x install.sh

  # runs
  # go build -o "$GOPATH/bin/ls-x"
  ./install.sh
}

package () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  install -Dm755 "${srcdir}/bin/ls-x" "${pkgdir}/usr/bin/ls-x"
  install -Dm644 "${srcdir}/src/${_repo_prefix}/${_repo_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

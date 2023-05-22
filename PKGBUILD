# Maintainer: fuero <fuerob@gmail.com>
# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=lazygit-git
pkgver=0.38.2.r89.ec5075104
pkgrel=1
pkgdesc='A simple terminal UI for git commands'
arch=('x86_64')
_repo_prefix='github.com/jesseduffield'
_repo_name="${pkgname%-git}"
url="https://${_repo_prefix}/${_repo_name}"
source=("${_repo_name}::git+https://${_repo_prefix}/${_repo_name}")
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=('lazygit')
provides=('lazygit')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
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
  go build -x -v -ldflags "-extldflags '${LDFLAGS}' -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)" -o "${_repo_name}.bin"
}

package () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  install -Dm755 "${srcdir}/src/${_repo_prefix}/${_repo_name}/${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm644 "${srcdir}/src/${_repo_prefix}/${_repo_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md docs/*.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}

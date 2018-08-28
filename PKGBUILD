# Maintainer : fuero <fuerob@gmail.com>
# Maintainer : Fredy García <frealgagu at gmail dot com>

pkgname='lazygit-git'
pkgdesc='A simple terminal UI for git commands'
pkgver=r677.2181a91
pkgrel=1
_repo_prefix='github.com/jesseduffield'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('MIT')
arch=('x86_64')
makedepends=('go-pie' 'git')
depends=('glibc')
conflicts=('lazygit')
provides=('lazygit')
_commit='master'
source=("git+https://${_repo_prefix}/${_repo_name}#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd "$_repo_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  mkdir -p "src/${_repo_prefix}"
  ln -snf "$(pwd)/${_repo_name}" "src/${_repo_prefix}/${_repo_name}"
}

clean() {
  # Clean up symlink
  rm -f "src/${_repo_prefix}/${_repo_name}"
  rm -f ${_repo_name}.bin
}

build () {
  cd "src/${_repo_prefix}/${_repo_name}"
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
  go build -x -i -v -ldflags "-X main.commit=${pkgver##*.} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(cat VERSION).${pkgver##*.}" -o ${_repo_name}.bin
}

package () {
  cd "src/${_repo_prefix}/${_repo_name}"
  install -Dm755 ${_repo_name}.bin "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for file in *.md docs/*.md
  do
    install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename $file)"
  done
}

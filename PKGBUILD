# Maintainer : fuero <fuerob@gmail.com>
pkgname='lazygit-git'
pkgdesc='A simple terminal UI for git commands'
pkgver=r320.a8c6f31
pkgrel=1
_repo_prefix='github.com/jesseduffield'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('MIT')
arch=('x86_64')
makedepends=('go-pie' 'git')
depends=('glibc')
_commit='master'
source=("git+https://${_repo_prefix}/${_repo_name}#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd "$_repo_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"
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
  go build -i -v -ldflags "-w -s -X main.Rev=${pkgver##*.} -X main.builddate=`date -u +%Y%m%d.%H%M%S`" -o ${_repo_name}.bin
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

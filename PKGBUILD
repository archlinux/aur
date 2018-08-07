# Maintainer : fuero <fuerob@gmail.com>
pkgname='lazygit-git'
pkgdesc='A simple terminal UI for git commands'
pkgrel=1
pkgver=r180.acae855
_repo_prefix='github.com/jesseduffield'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('MIT')
arch=('x86_64')
makedepends=('go-pie' 'git')
depends=('glibc')
_commit='acae855ace3973468fe697c9c4437bd0b76a705d'
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
  cp -R "${_repo_name}" "src/${_repo_prefix}"
}

build () {
  cd "src/${_repo_prefix}/${_repo_name}"
  go build -o ${_repo_name}
}

package () {
  cd "src/${_repo_prefix}/${_repo_name}"
  install -Dm755 ${_repo_name} "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for file in README.md ; do
	  install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
  done
}

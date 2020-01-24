# Maintainer : fuero <fuerob@gmail.com>

pkgname='govmomi-git'
pkgdesc='A Go library for interacting with VMware vSphere APIs (ESXi and/or vCenter).'
pkgver=r2495.ca640932
pkgrel=1
_repo_prefix='github.com/vmware'
_repo_name="${pkgname/-git}"
url="https://${_repo_prefix}/${_repo_name}"
license=('Apache')
arch=('x86_64')
makedepends=('go-pie' 'git')
depends=('glibc')
conflicts=('govmomi')
provides=('govmomi')
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

_gobuild() {
  export GOPATH="${srcdir}"
  export PATH="$PATH:$GOPATH/bin"

  go build -x -i -v -ldflags "-X main.commit=${pkgver##*.} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(cat VERSION).${pkgver##*.}" -o $1
}

build () {
  cd "src/${_repo_prefix}/${_repo_name}"

  for i in govc vcsim
  do
    cd $i
    _gobuild ${i}.bin
    cd -
  done
}

package () {
  cd "src/${_repo_prefix}/${_repo_name}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for i in govc vcsim
  do
    cd $i
    install -Dm755 ${i}.bin "${pkgdir}/usr/bin/${i}"
    for _file in *.md
    do
      install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${i}/${_file}"
    done
    cd -
  done
  
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
}

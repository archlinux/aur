# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=go-imap-backup-git
_name=${pkgname%-git}
pkgver=v0.1+9+gc1ae5e0
pkgrel=1
pkgdesc="Backup, restore and delete emails from an IMAP server to local storage"
url="https://github.com/mlnoga/go-imap-backup"
arch=('x86_64')
license=('GPLv3')
makedepends=('git' 'go')
# optdepends=('')

# Tag: 0.1
#_commit=5ce5f46b4459486f1efb27f1db88fcc7b99fb58a
#source=("git+https://github.com/mlnoga/go-imap-backup.git#commit=$_commit")
source=("git+https://github.com/mlnoga/go-imap-backup.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}" 
  git describe --tags | sed 's/-/+/g'
}

prepare(){
  cd "${srcdir}/${_name}" 
  mkdir -p build/
}

build() {
  cd "${srcdir}/${_name}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

# ?   	github.com/mlnoga/go-imap-backup	[no test files]
# check() {
#   cd "${srcdir}/${_name}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_name}"
  install -Dm755 build/$_name "$pkgdir"/usr/bin/$_name
}

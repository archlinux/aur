# Maintainer: Glen H < glen3b_arch at glen3b dot me>
pkgname=gb-backup-git
_pkgname=gb
pkgver=r24.3bf23cb
pkgrel=1
pkgdesc='Gamer Backup, a super opinionated cloud backup system'
arch=('x86_64')
url="https://github.com/leijurv/$_pkgname"
license=('AGPL')
makedepends=('go' 'git')
depends=('lepton')
source=($_pkgname::git+https://github.com/leijurv/gb.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare(){
  cd "$srcdir/$_pkgname"

  #_gitver="$(git show -s --format="%ci %h" 2> /dev/null)"
  #_gitver="${_gitver//[^[:alnum:][:space:]]/}"

  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #echo "${_gitver%% *}.r${_gitver##* }"

  #cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$srcdir/$_pkgname"
  #cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "build/$_pkgname"
}

#check() {
#  cd "$srcdir/$_pkgname"
#  #cd "$pkgname-$pkgver"
#  go test ./...
#}

package() {
  cd "$srcdir/$_pkgname"
  #cd "$pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}

# Maintainer: Akilan Elango <aki237@aki237.me>
pkgname=kurly-git
pkgver=r127.7e762cb
pkgrel=1
pkgdesc='Kurly is an alternative to the widely popular curl program written in go.'
arch=('i686' 'x86_64' 'arm')
url='https://gitlab.com/davidjpeacock/kurly'
license=('APACHE')
makedepends=('git')
provides=("${pkgname%}")
conflicts=("kurly")
source=("$pkgname"::'git+https://gitlab.com/davidjpeacock/kurly.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%}"
  echo -n "Applying 001-custom-version.diff addition patch... "
  git apply $srcdir/../001-custom-version.diff
  echo "Done!!"
}

package() {
  cd "$srcdir/${pkgname%}"
  export GOPATH="$srcdir/GOPATH"
  go get -v -d ./...
  CGO_ENABLED=0 go build -ldflags "-w -s -X 'main.version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")'" -o kurly
  install -D -m 0755 kurly $pkgdir/usr/bin/kurly
  sed -i -e "s/@@DATE@@/$(date +"%B %d, %Y")/g" -e "s/@@VERSION@@/$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")/g" meta/kurly.man
  gzip meta/kurly.man
  install -D -m 0644 meta/kurly.man.gz $pkgdir/usr/share/man/man1/kurly.1.gz
  install -D -m 0644 LICENSE $pkgdir/usr/share/licenses/kurly/LICENCE
}

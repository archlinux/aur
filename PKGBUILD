# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=rimgo
pkgname=${_pkgname}-git
pkgver=r373.c366f95
pkgrel=1
pkgdesc='An alternative frontend for Imgur. Originally based on rimgu.'
arch=('any')
url='https://codeberg.org/rimgo/rimgo'
license=('AGPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('go>=1.16' 'tailwindcss')
source=("git+${url}.git"
        'rimgo.conf'
        'rimgo.service')
sha512sums=('SKIP'
            '7f2e6958b5343505fb0146d1f4eeb8ef19c2a1ee19ea7cf3589074cd31224129d95652959e15519ba998adcca5f468bf5dcf4fa68ea29a705fdd886819f65755'
            'b7f47c47ff808b75a329fb3e40b5bee711000dcd011647b59167043d1403de59d22011960d7f5f884fdeec8f7dcd7f5b8f4ff8e00eea151368f6b3002db68727')
backup=('etc/rimgo.conf')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export CGO_ENABLED=1

  # Generate CSS
  tailwindcss -i static/tailwind.css -o static/app.css -m

  # Build without using Just
  # Might need to update if Justfile gets updated
  go mod vendor
  go build -o rimgo -ldflags \
     "-X codeberg.org/rimgo/rimgo/pages.VersionInfo=$(date '+%Y-%m-%d')-$(git rev-list --abbrev-commit -1 HEAD)"
  go clean -modcache
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 -t "${pkgdir}/usr/bin" rimgo
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ../../rimgo.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 ../../rimgo.conf -t "$pkgdir/etc/"
}

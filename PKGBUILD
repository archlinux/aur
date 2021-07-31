# Maintainer: Moritz 'e1mo' Fromm <git@e1mo.de>

_pkgname=dashie-telegraf-plugins
pkgname=$_pkgname-git
pkgver=master.r0.g071e959
pkgrel=1
pkgdesc='Various plugins for telegraf such as battery'
arch=('x86_64')
url='https://dev.sigpipe.me/dashie/telegraf-plugins'
provides=("${_pkgname}")
license=('MIT')
conflicts=("${_pkgname}")
depends=("glibc")
makedepends=('go' 'git')
options=('!emptydirs')
source=("$pkgname::git+https://dev.sigpipe.me/dashie/telegraf-plugins")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --all --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/heads\///g'
}

build() {
	cd "$srcdir/$pkgname/"
  mkdir "build";
  for d in *; do
    if [[ -f $d ]]; then
      continue
    fi
    if [[ $d == "build" ]]; then
      continue
    fi
    filename="${d}/${d}.go"
    go build \
		    -trimpath \
		    -buildmode=pie \
		    -mod=readonly \
		    -modcacherw \
		    -ldflags "-X main.Version=$pkgver -linkmode external -extldflags $LDFLAGS" \
		    -o "build/dashie_telegraf_${d}" \
        "${filename}"
  done
	}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  for f in *; do
	  install -Dm755 "$f" "$pkgdir/usr/bin/$f";
  done
}

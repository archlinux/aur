# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
# Contributor: Max Mazurov <fox.cpp at disroot dot org>

pkgname='maddy-git'
pkgver=r607.1bc7036
pkgrel=2
pkgdesc='Simple, fast, secure all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git' 'scdoc')
source=("$pkgname::git+https://github.com/foxcpp/maddy.git"
	"maddy.sysusers"
	"maddy.tmpfiles")
conflicts=('maddy')
provides=('maddy')
backup=(etc/maddy/maddy.conf)
sha512sums=('SKIP'
            '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
            'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5')

pkgver() {
    cd "$srcdir/$pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "$srcdir/$pkgname"

	mkdir -p "$srcdir/gopath"
	export GOPATH="$srcdir/gopath"
	go get -v -d ./...
}

build() {
	cd "$srcdir/$pkgname"
	export GOPATH="$srcdir/gopath"
	export CGO_CFLAGS=$CFLAGS
	export CGO_LDFLAGS=$LDFLAGS

    go build -o maddy -trimpath -buildmode=pie -ldflags "-extldflags $LDFLAGS -X main.Version=$pkgver" github.com/foxcpp/maddy/cmd/maddy
    go build -o maddyctl -trimpath -buildmode=pie -ldflags "-extldflags $LDFLAGS -X main.Version=$pkgver" github.com/foxcpp/maddy/cmd/maddyctl

    #for f in man/*; do
    #    scdoc < $f > "$(basename -s .scd "$f")"
    #done
}

check() {
    cd "$srcdir/$pkgname"

    go test ./...
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm 0755 maddy "$pkgdir/usr/bin/maddy"
	install -Dm 0755 maddyctl "$pkgdir/usr/bin/maddyctl"

	install -Dm 0644 maddy.conf "$pkgdir/etc/maddy/maddy.conf"

    #for f in man/*.1.scd; do
    #    install -Dm 0644 "$(basename -s .scd "$f")" "$pkgdir/usr/share/man/man1"
    #done
    #for f in man/*.5.scd; do
    #    install -Dm 0644 "$(basename -s .scd "$f")" "$pkgdir/usr/share/man/man5"
    #done
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/maddy"

	install -Dm 0644 -t "$pkgdir/usr/lib/systemd/system" dist/systemd/maddy.service dist/systemd/maddy@.service
  install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
  install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"

	install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/ftdetect/" dist/vim/ftdetect/maddy-conf.vim
	install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/ftplugin/" dist/vim/ftplugin/maddy-conf.vim
	install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/syntax/" dist/vim/syntax/maddy-conf.vim
}

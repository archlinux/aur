# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
# Contributor: Max Mazurov <fox.cpp at disroot dot org>

pkgname=maddy
pkgver=0.1.0
pkgrel=2
pkgdesc='Simple, fast, secure all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'git' 'scdoc')
source=("${pkgname}-$pkgver::https://github.com/foxcpp/maddy/archive/v${pkgver}.tar.gz"
	"maddy.sysusers"
	"maddy.tmpfiles")
conflicts=('maddy')
provides=('maddy')
backup=(etc/maddy/maddy.conf)
sha512sums=('c511aa0f028556b8e6c2d8fcb549a771b01d6b45642a0e34d68b09643186d006af87ee74e2fa8883d1ff3105c88f0d424073d2e1f47dc5968fcb2405e37d0f0a'
            '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
            'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  go get -v -d ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export GOPATH="$srcdir/gopath"
  export CGO_CFLAGS=$CFLAGS
  export CGO_LDFLAGS=$LDFLAGS

  go build -o maddy -trimpath -buildmode=pie -ldflags "-extldflags $LDFLAGS -X main.Version=$pkgver" github.com/foxcpp/maddy/cmd/maddy
  go build -o maddyctl -trimpath -buildmode=pie -ldflags "-extldflags $LDFLAGS -X main.Version=$pkgver" github.com/foxcpp/maddy/cmd/maddyctl

  for f in docs/man/*.scd; do
      scdoc < $f > "$(basename -s .scd "$f")"
  done
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm 0755 maddy "$pkgdir/usr/bin/maddy"
  install -Dm 0755 maddyctl "$pkgdir/usr/bin/maddyctl"

  install -Dm 0644 maddy.conf "$pkgdir/etc/maddy/maddy.conf"

  for f in docs/man/*.1.scd; do
      install -Dm 0644 "$(basename -s .scd "$f")" "$pkgdir/usr/share/man/man1"
  done
  for f in docs/man/*.5.scd; do
      install -Dm 0644 "$(basename -s .scd "$f")" "$pkgdir/usr/share/man/man5"
  done

  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/maddy"

  install -Dm 0644 -t "$pkgdir/usr/lib/systemd/system" dist/systemd/maddy.service dist/systemd/maddy@.service
  install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
  install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"

  install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/ftdetect/" dist/vim/ftdetect/maddy-conf.vim
  install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/ftplugin/" dist/vim/ftplugin/maddy-conf.vim
  install -Dm 0644 -t "$pkgdir/usr/share/vim/vimfiles/syntax/" dist/vim/syntax/maddy-conf.vim
}

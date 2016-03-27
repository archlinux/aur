pkgname=readeef
pkgver="1.1.0"
pkgrel=1
pkgdesc="Self-hosted feed aggregator"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')
install="readeef.install"
source=(
	"https://github.com/urandom/$pkgname/archive/$pkgver.tar.gz"
	"readeef.service"
	"readeef.cfg"
	"readeef-user.conf"
	"readeef-tmpfile.conf"
)
backup=(
	"etc/readeef/readeef.cfg"
)
md5sums=('4aedb7ee73fa685257de0982ac9cf68e'
         'c34b33ec0e1b49823ebc90011644fb85'
         '90ee66da93df0331b127de5c1bde3d65'
         'eb803cfce3dfb686ee7bf035db9c60fc'
         'd3c89d35743e09890928dea50e7facb2')

build() {
	cd $srcdir
	base="src/github.com/urandom"
	target="$base/$pkgname"
        cmd="cmd/$pkgname-server"

	mkdir -p $base
	ln -sf "$srcdir/$pkgname-$pkgver" $target

	export GOPATH="$srcdir"

	cd "$srcdir/$target/$cmd"

	GO15VENDOREXPERIMENT=1 go get -v

	cd "$srcdir"
	go build -o $pkgname github.com/urandom/$pkgname/$cmd
}

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -DT -m644 "$srcdir/${pkgname}.cfg" "$pkgdir/etc/$pkgname/${pkgname}.cfg"
	install -DT -m0755 "$srcdir/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
	echo "$srcdir/${pkgname}-user.conf"
	install -DT -m644 "$srcdir/${pkgname}-user.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
	echo "$srcdir/${pkgname}-tmpfile.conf"
	install -DT -m644 "$srcdir/${pkgname}-tmpfile.conf" "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dkimpy-milter"
pkgver=1.2.3
_rev=-2
pkgrel=2
pkgdesc="DomainKeys Identified Mail (DKIM) milter in Python, with support for ed25519 signatures"
url="https://launchpad.net/dkimpy-milter"
license=("GPL2")
arch=("any")
depends=("python" "python-authres" "python-pynacl" "python-dkim" "python-dnspython" "python-pymilter" "libmilter")
optdepends=("postfix: for sending mail")
source=("https://salsa.debian.org/python-team/packages/dkimpy-milter/-/archive/debian/$pkgver$_rev/dkimpy-milter-debian-$pkgver$_rev.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
b2sums=('a999d1dc1cc3cb83d414e75cfa7a97631027ee585a526ce87713b340499d9a17839a7ba5bad19a9048f668e703ce80c7815c1f8e5c04aa04eac0ef750083dd22'
        '715d82d99ece58b07b94705efe9600800699ff027aab8b7f3c61385b91a722dd01b7b0b2c0e7fa54ae76a8d58d1c567b905c790a01929b268ea2d73c498e6281'
        'e84611a948c679b8b2e10b1241fad9d5a0d5a6b268989cdbfb06e4b90c1f2ba94c21716a4d0d8ce65a1ae2b2c49d9fbc93737b80050ede1c0f14d2ad6ec3dc85')
backup=("etc/dkimpy-milter/dkimpy-milter.conf")
install="$pkgname.install"

build(){
 cd "$pkgname-debian-$pkgver$_rev"
 python -m build --wheel --no-isolation
}

package(){
 install -d "$pkgdir/run/$pkgname"
 install -D -m 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
 
 cd "$pkgname-debian-$pkgver$_rev"
 sed -e "s|local/bin|bin|g" -e "s|/usr/local/etc|/etc|g" -i "system/dkimpy-milter.service"
 awk '/UserID/ {sub(/dkimpy-milter/,"dkimpy-milter:dkimpy-milter")}1' "etc/dkimpy-milter.conf" > "etc/dkimpy-milter.conf.tmp"
 mv "etc/dkimpy-milter.conf.tmp" "etc/dkimpy-milter.conf"
 python -m installer --destdir="$pkgdir" dist/*.whl
 mv "$pkgdir/usr/etc/" "$pkgdir"
 rm -r "$pkgdir/etc/init.d/"
}

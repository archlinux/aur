# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dkimpy-milter"
pkgver=1.2.3
_rev=-2
pkgrel=1
pkgdesc="DomainKeys Identified Mail (DKIM) milter in Python, with support for ed25519 signatures"
url="https://launchpad.net/dkimpy-milter"
license=("GPL2")
arch=("any")
depends=("python" "python-authres" "python-pynacl" "python-dkim" "python-dnspython" "python-pymilter" "libmilter")
optdepends=("postfix: for sending mail")
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dkimpy-milter/$pkgver$_rev/dkimpy-milter_$pkgver$_rev.debian.tar.xz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
b2sums=('8e337a8540ab832cfffd9ce9ae87fa95786d7a71d2c9b7ac2f8ffd4f75f84c98938b95fe4be92393b28258132e19cdfa4e0e652b2824a95a013a5a50822a70a2'
        '715d82d99ece58b07b94705efe9600800699ff027aab8b7f3c61385b91a722dd01b7b0b2c0e7fa54ae76a8d58d1c567b905c790a01929b268ea2d73c498e6281'
        'e84611a948c679b8b2e10b1241fad9d5a0d5a6b268989cdbfb06e4b90c1f2ba94c21716a4d0d8ce65a1ae2b2c49d9fbc93737b80050ede1c0f14d2ad6ec3dc85')
backup=("etc/dkimpy-milter/dkimpy-milter.conf")
install="$pkgname.install"

package(){
 install -d "$pkgdir/run/$pkgname"
 install -D -m 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
 install -D -m 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
 
 cd "$pkgname-$pkgver"
 sed -e "s|local/bin|bin|g" -e "s|/usr/local/etc|/etc|g" -i "system/dkimpy-milter.service"
 awk '/UserID/ {sub(/dkimpy-milter/,"dkimpy-milter:dkimpy-milter")}1' "etc/dkimpy-milter.conf" > "etc/dkimpy-milter.conf.tmp"
 mv "etc/dkimpy-milter.conf.tmp" "etc/dkimpy-milter.conf"
 python3 setup.py install --single-version-externally-managed --root="$pkgdir/" --optimize=1
 mv "$pkgdir/usr/etc/" "$pkgdir"
 rm -r "$pkgdir/etc/init.d/"
}

# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="dkimpy-milter"
pkgver=1.2.2
pkgrel=2
pkgdesc="DomainKeys Identified Mail (DKIM) milter in Python, with support for ed25519 signatures"
url="https://launchpad.net/dkimpy-milter"
license=("GPL2")
arch=("any")
depends=("python" "python-authres" "python-pynacl" "python-dkim" "python-dnspython" "python-pymilter" "libmilter")
optdepends=("postfix: for sending mail")
source=("https://launchpad.net/$pkgname/1.2/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=("d7e0d4006cad1add90b5b71243e488680b63cf63c5350cef619c061e808f2c3b"
            "548edb0351ac5f92d9e3b644d8c4b5bcd9a45cc102c971a202007d6fda590a83"
            "c19902c420ed6a003bd3052f88414266cb1190547b3447d83e6f889b0212a32e")
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

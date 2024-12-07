# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=input-wacom-dkms-patched
_pkgname=input-wacom
pkgver=1.3.0
pkgrel=2
pkgdesc="Latest Kernel modules form Wacom tablets (DKMS). Useful if your wacom tablet is not supported upstream yet."
arch=('any')
url="https://github.com/linuxwacom/input-wacom/wiki/Installing-input-wacom-from-source"
license=('GPL2')
depends=('dkms')
optdepends=('xf86-input-wacom: for actually using a Wacom tablet')
conflicts=(input-wacom-dkms-git)
install=$pkgname.install
source=(
    "https://github.com/linuxwacom/input-wacom/releases/download/v$pkgver/$_pkgname-$pkgver.tar.bz2"
	"dkms.conf"
	"blacklist-input-wacom-dkms.conf"
	"move-modules"
	"fix_unaligned.patch"
)
noextract=()
md5sums=('8b8453c359d11d65b967a575c9256f9f'
         '641959c08e87fc438768194126be9813'
         'da99119208e69b9a611b1809e1f241f8'
         '8a851dede08da29c2810fb58e8b69910'
         '54e02bb5b2c34c7373ed465bda5e741e')

prepare() {
	cd ${_pkgname}-${pkgver} || exit
	patch --forward --strip=1 --input=../fix_unaligned.patch
}
         
package() {      
 
	installdir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installdir"
        install -m644 "$srcdir/dkms.conf" "$installdir"
        install -m644 "$srcdir/move-modules" "$installdir"
        
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-input-wacom-dkms.conf" "$pkgdir/etc/modprobe.d"
       
        cd "${srcdir}/${_pkgname}-${pkgver}/"
       
        for d in `find . -type d`
        do
                install -dm755  "$installdir/$d"
        done
       
        for f in `find . -type f`
        do
                install -m644 "${srcdir}/${_pkgname}-${pkgver}/$f" "$installdir/$f"
        done
        chmod +x "$installdir/configure"
        chmod +x "$installdir/move-modules"
}

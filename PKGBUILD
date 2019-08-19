# Maintainer: Jason Gerecke <killertofu@gmail.com>
# Based on input-wacom-dkms

pkgname=input-wacom-dkms-git
_pkgname=input-wacom
pkgver=0.43.0.13.g4d718cc
pkgrel=1
pkgdesc="Latest kernel modules for Wacom tablets (DKMS). Useful if your wacom tablet is not supported upstream yet."
arch=('i686' 'x86_64')
url="https://github.com/linuxwacom/input-wacom/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
optdepends=('xf86-input-wacom: driver for X11-based desktops')
install=$pkgname.install
source=("git+https://github.com/linuxwacom/input-wacom.git#branch=master"
	"dkms.conf"
	"blacklist-input-wacom-dkms.conf"
	"move-modules")
noextract=()
md5sums=('SKIP'
         '249a0cfca2d5c8f7a5627563e042ceba'
         'da99119208e69b9a611b1809e1f241f8'
         '8a851dede08da29c2810fb58e8b69910')
provides=('input-wacom-dkms')
pkgver() {
	cd "$srcdir/${_pkgname}"
	./git-version-gen
}
package() {
	installdir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installdir"
        install -m644 "$srcdir/dkms.conf" "$installdir"
        install -m644 "$srcdir/move-modules" "$installdir"
        
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-input-wacom-dkms.conf" "$pkgdir/etc/modprobe.d"
       
        cd "${srcdir}/${_pkgname}/"
       
        for d in `find . -type d`
        do
                install -dm755 "$installdir/$d"
        done
       
        for f in `find . -type f`
        do
                install -m644 "${srcdir}/${_pkgname}/$f" "$installdir/$f"
        done
        chmod +x "$installdir/autogen.sh"
        chmod +x "$installdir/git-version-gen"
        chmod +x "$installdir/move-modules"
        chmod +x "$installdir/release.sh"
}

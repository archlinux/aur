# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=sysvinit
pkgver=2.90
pkgrel=1
pkgdesc='Linux System V Init'
url='http://savannah.nongnu.org/projects/sysvinit'
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
depends=('glibc' 'procps-ng>=3.3.9')
conflicts=('systemd-sysvcompat')

source=("http://download.savannah.nongnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.xz")
sha256sums=('114cffc8ef514a38b9916de2050bb6d73b43dff7afd05aee6b09d2f6cea7664e')


build()
{
    cd "$srcdir/$pkgname-${pkgver}"

    # Patch for Arch's Linux filesystem hierarchy
    if [ "$(grep 'execv("/sbin/mount", args);' < src/killall5.c | wc -l)" = 1 ]; then
        sed -i 's:execv("/bin/mount", args);::' src/killall5.c
    fi
    sed -i 's|/bin:/sbin:/usr/bin:/usr/sbin|/usr/bin|' src/init.h src/shutdown.c
    sed -i 's|/sbin:/usr/sbin:/bin:/usr/bin|/usr/bin|' src/init.h src/shutdown.c
    sed -i 's|/bin:/usr/bin:/sbin:/usr/sbin|/usr/bin|' src/init.h src/shutdown.c
    sed -i 's:/sbin/:/bin/:g'    contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h}
    sed -i 's:/bin/:/usr/bin/:g' contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h}
    sed -i 's:/usr/usr/:/usr/:g' contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h}

    make DISTRO=archlinux
}

package()
{
    cd "$srcdir/$pkgname-${pkgver}"
    mkdir -p "$pkgdir/__temp__"
    make DISTRO=archlinux ROOT="$pkgdir/__temp__" install
    cd "$pkgdir/__temp__"
    rm -r bin usr/bin usr/share/man/man*/{mesg,last,pidof}.* usr/share/man/man1
    find . | while read file; do
        if [ -d "$file" ]; then
            mkdir -p ".$file"
        else
            cp "$file" ".$file"
        fi
    done
    cd ..
    rm -r "__temp__"
    mv "$pkgdir/sbin" "$pkgdir/usr/bin"
}


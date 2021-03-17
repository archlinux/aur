# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributer: supermario9590

_pkgname=sysvinit
pkgname=${_pkgname}-git
pkgver=2.99.r0.gbb6d5df
pkgrel=1
pkgdesc='Linux System V Init'
url='http://savannah.nongnu.org/projects/sysvinit'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'procps-ng>=3.3.9')
provides=('sysvinit' 'sysvinit-git')
conflicts=('systemd-sysvcompat')
source=("git+https://git.savannah.nongnu.org/git/sysvinit.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd "$srcdir/$_pkgname"

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
    cd "$srcdir/$_pkgname"
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
    rm -r "$pkgdir/sbin/logsave" "$pkgdir/usr/share/man/man8/logsave.8" 
    mv "$pkgdir/sbin" "$pkgdir/usr/bin"
}

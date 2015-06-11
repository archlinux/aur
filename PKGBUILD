# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=sysvinit
pkgver=2.88
pkgrel=15
pkgdesc='Linux System V Init'
url='http://savannah.nongnu.org/projects/sysvinit'
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
depends=('glibc' 'procps-ng>=3.3.9')
conflicts=('systemd-sysvcompat')

source=("http://download.savannah.gnu.org/releases/sysvinit/sysvinit-${pkgver}dsf.tar.bz2"
        "0001-simplify-writelog.patch" "0002-remove-ansi-escape-codes-from-log-file.patch"
	"0001-do-not-build-sulogin-on-archlinux-it-is-provided-by-.patch")
sha256sums=('60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519'
            '8126d09a35bdb9137bb19dc31b58cf1e829137fba34f7dcde7598018e1736826'
            '90d38e4351ef9d77088661b411eb2b20eda435676e1e407f3d959ca2064d5c1e'
	    '43fed9d36b92f15bcdbde6ba2a2784a57115562795942c09dd33ff37a51cb138')


build()
{
    cd "$srcdir/$pkgname-${pkgver}dsf"
    patch -p1 -d "src" -i "$srcdir/0001-simplify-writelog.patch"
    patch -p1 -d "src" -i "$srcdir/0002-remove-ansi-escape-codes-from-log-file.patch"
    patch -p1          -i "$srcdir/0001-do-not-build-sulogin-on-archlinux-it-is-provided-by-.patch"
    
    # Patch for Arch's Linux filesystem hierarchy
    if [ "$(grep 'execv("/sbin/mount", args);' < src/killall5.c | wc -l)" = 1 ]; then
        sed -i 's:execv("/bin/mount", args);::' src/killall5.c
    fi
    sed -i 's|/bin:/sbin:/usr/bin:/usr/sbin|/usr/bin|' src/initscript.sample src/init.h src/shutdown.c
    sed -i 's|/sbin:/usr/sbin:/bin:/usr/bin|/usr/bin|' src/initscript.sample src/init.h src/shutdown.c
    sed -i 's|/bin:/usr/bin:/sbin:/usr/sbin|/usr/bin|' src/initscript.sample src/init.h src/shutdown.c
    sed -i 's:/sbin/:/bin/:g'    contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h} src/initscript.sample
    sed -i 's:/bin/:/usr/bin/:g' contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h} src/initscript.sample
    sed -i 's:/usr/usr/:/usr/:g' contrib/notify-pam-dead.patch man/*.{1,5,8} src/*.{c,h} src/initscript.sample
    
    make DISTRO=archlinux
}

package()
{
    cd "$srcdir/$pkgname-${pkgver}dsf"
    mkdir -p "$pkgdir/__temp__"
    make DISTRO=archlinux ROOT="$pkgdir/__temp__" install
    cd "$pkgdir/__temp__"
    rm -r bin usr/bin usr/share/man/man?/{mesg,utmpdump,wall,last,pidof}.? usr/share/man/man1
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


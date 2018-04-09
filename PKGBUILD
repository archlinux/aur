# Maintainer: Amish <contact at via dot aur>

pkgname=usermin
pkgver=1.741
pkgrel=1
pkgdesc="A web-based user account administration interface"
arch=(i686 x86_64)
license=('custom:webmin')
url="http://www.webmin.com/"
depends=('perl' 'perl-net-ssleay' 'perl-authen-pam' 'perl-encode-detect' 'openssl')
optdepends=('webmin: A web-based interface for system administration')
backup=('etc/usermin/miniserv.conf' 'etc/usermin/miniserv.users' \
'etc/usermin/config' 'etc/usermin/webmin.acl' 'etc/usermin/user.acl' \
'etc/usermin/at/config' \
'etc/usermin/changepass/config' \
'etc/usermin/chfn/config' \
'etc/usermin/commands/config' \
'etc/usermin/cron/config' \
'etc/usermin/cshrc/config' \
'etc/usermin/fetchmail/config' \
'etc/usermin/file/config' \
'etc/usermin/filemin/config' \
'etc/usermin/filter/config' \
'etc/usermin/forward/config' \
'etc/usermin/gnupg/config' \
'etc/usermin/htaccess/config' \
'etc/usermin/htaccess-htpasswd/config' \
'etc/usermin/language/config' \
'etc/usermin/mailbox/config' \
'etc/usermin/mailcap/config' \
'etc/usermin/man/config' \
'etc/usermin/mysql/config' \
'etc/usermin/plan/config' \
'etc/usermin/postgresql/config' \
'etc/usermin/proc/config' \
'etc/usermin/procmail/config' \
'etc/usermin/quota/config' \
'etc/usermin/schedule/config' \
'etc/usermin/shell/config' \
'etc/usermin/spam/config' \
'etc/usermin/ssh/config' \
'etc/usermin/telnet/config' \
'etc/usermin/theme/config' \
'etc/usermin/tunnel/config' \
'etc/usermin/updown/config' \
'etc/usermin/usermount/config' \
'etc/logrotate.d/usermin' \
'etc/pam.d/usermin' )
source=(http://downloads.sourceforge.net/sourceforge/webadmin/$pkgname-$pkgver.tar.gz
        setup-pre.sh
        setup-post.sh
        usermin-config.tar.bz2
        usermin.pam
        usermin.logrotate
        usermin.service)
options=(!strip !zipman)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver

    # remove modules that we do not support and stuff that is not needed
    rm -r usermin-init usermin-daemon install-module.pl

    # remove config files for other distros, make Arch linux related additions
    find . ! -name 'config-generic-linux' ! -name 'config-ALL-linux' ! -name 'config-lib.pl' -name 'config-*' -exec rm '{}' \+
    echo 'Archlinux	Any version	generic-linux	*	-d "/etc/pacman.d"' > os_list.txt
    cp -rp "$srcdir"/usermin-config/* "$srcdir"/$pkgname-$pkgver/
    install -m 700 "$srcdir"/setup-{pre,post}.sh "$srcdir"/$pkgname-$pkgver/
}

package() {
    # create basic directories
    mkdir -p "$pkgdir"/{etc,opt,var/log}

    export archpkgdir="$pkgdir"
    cd "$srcdir"/$pkgname-$pkgver
    "$srcdir"/$pkgname-$pkgver/setup.sh "$pkgdir"/opt/usermin

    # fix the config files to use their real locations
    find "$pkgdir"/etc/usermin -type f -exec sed -i -e "s:$pkgdir::g" {} \+

    # install sources
    install -D -m 644 "$srcdir"/usermin.service "$pkgdir"/usr/lib/systemd/system/usermin.service
    install -D -m 644 "$srcdir"/usermin.pam "$pkgdir"/etc/pam.d/usermin
    install -D -m 644 "$srcdir"/usermin.logrotate "$pkgdir"/etc/logrotate.d/usermin
    install -D -m 644 "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/usermin/LICENCE
    mv "$pkgdir"/opt/usermin/user.acl "$pkgdir"/etc/usermin/

    # delete temp dir
    rm -r "$pkgdir"/tmp
}


sha256sums=('3d2c74501966fa3a3795b0e9bcc47962815738fd1553782ee42221ee88026b2f'
            '366e0315307c89bb0ec10d76c22352de93b92ca556f7f7bb6e34eb1b17d26a9c'
            '17102b3583190f64fae039ca5270ae823cae90ed60fdb2dd49aba95496bff559'
            'c0ff7f1dfdbe7c4265ebae5a7033d46e2a3f729f092f2c975b05ae7ef4034d6d'
            'a979e236681c6a06906937cf0f012e976347af5d6d7e7ae04a11acb01cc2689d'
            '73b47189419d107e3be2cce131123c73e4d1c954c14f53c223f332da0348681c'
            '6f40dfcd8f1530639b7a8db2cd5401be74d1416ce1116b8f36b0542a85c8d3cf')

# Maintainer: Amish <contact at via dot aur>

pkgname=usermin
pkgver=1.854
pkgrel=1
pkgdesc="A web-based user account administration interface"
arch=(any)
license=('custom:webmin')
url="http://www.webmin.com/usermin.html"
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
        usermin.tmpfiles)
options=(!strip !zipman)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver

    # remove modules that we do not support and stuff that is not needed
    rm -r usermin-init install-module.pl

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
    install -D -m 644 "$pkgdir"/opt/usermin/usermin-systemd "$pkgdir"/usr/lib/systemd/system/usermin.service
    install -D -m 644 "$srcdir"/usermin.pam "$pkgdir"/etc/pam.d/usermin
    install -D -m 644 "$srcdir"/usermin.logrotate "$pkgdir"/etc/logrotate.d/usermin
    install -D -m 644 "$srcdir"/usermin.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/usermin.conf
    install -D -m 644 "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/usermin/LICENCE
    mv "$pkgdir"/opt/usermin/user.acl "$pkgdir"/etc/usermin/

    # delete directories not to be packaged
    rm -r "$pkgdir"/{tmp,var}
}


sha256sums=('1cccd91526061fc4f0845f02288f78f7948edb8260ba00528404d9acf69bd76e'
            '366e0315307c89bb0ec10d76c22352de93b92ca556f7f7bb6e34eb1b17d26a9c'
            '69c033325893aa594f975163eb723abe0907c316ac3b8999e153d07cf7f63488'
            'c0ff7f1dfdbe7c4265ebae5a7033d46e2a3f729f092f2c975b05ae7ef4034d6d'
            'a979e236681c6a06906937cf0f012e976347af5d6d7e7ae04a11acb01cc2689d'
            '12def022feec3b063dbc0a247d3db1423785beea90d3f065e785c86799d31431'
            'be8ca34e385063a162f9ba91e535776e58b26520127f724837bc5840df07a4f7')

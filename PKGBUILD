# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Maintainer: skydrome <skydrome@protonmail.com>

pkgname=privoxy-cvs
pkgver=3.0.28.r84.gc880e655
pkgrel=1
pkgdesc="A web proxy with advanced filtering capabilities. CVS version"
url='https://www.privoxy.org'
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('privoxy')
provides=('privoxy')
backup=('etc/privoxy/'{config,trust,user.{filter,action}}
        'etc/logrotate.d/privoxy')

depends=('pcre' 'zlib')
makedepends=('git')

source=("git+https://www.privoxy.org/git/privoxy.git"
        'privoxy.logrotate'
        'privoxy.sysusers'
        'privoxy.tmpfiles'
        'privoxy.service')

md5sums=('SKIP'
         '658a64f757375f9a60f8a57abb2cca04'
         '83f740b8e874f485a8f89b92a67b8768'
         '43754f6b09cf8fb84c3a460b9df09c9f'
         '2f7ea763b6348e14b4d3f07fb87eea52')

pkgver () {
    cd privoxy
    git describe --long |sed 's/^v_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

prepare() {
    cd privoxy
    mv -f configure.{in,ac}
    autoreconf -v
}

build() {
    cd privoxy
    export CFLAGS=${CFLAGS/-flto=thin }

     ./configure \
         --prefix=/usr \
         --sysconfdir=/etc/privoxy \
         --enable-compression
    make

    sed -i config \
        -e 's+^confdir \.+confdir /etc/privoxy+
            s+^logdir \.+logdir /var/log/privoxy+
            s+^#\?user-manual .*+user-manual /usr/share/doc/privoxy/user-manual/+'
}

package() {
    cd privoxy

    install -Dm755 {,"$pkgdir"/usr/bin/}privoxy
    install -Dm644 {,"$pkgdir"/usr/share/man/man1/}privoxy.1

    # config
    install -d "$pkgdir"/etc/privoxy
    install -m644 config trust *.{action,filter} "$pkgdir"/etc/privoxy
    find templates -type f -exec install -Dm644 '{}' "$pkgdir"/etc/privoxy/'{}' \;

    # docs
    d="$pkgdir"/usr/share/doc/privoxy
    cd doc/webserver
    install -Dm644 {privoxy-,"$d"/}index.html
    install -m644 p_doc.css ../../{AUTHORS,README,ChangeLog} "$d"
    install -Dm644 {,"$d"/user-manual/}p_doc.css
    find user-manual developer-manual faq man-page \( -name '*.html' -o -name '*.jpg' \) \
        -exec install -Dm644 '{}' "$d"/'{}' \;

    # systemd
    install -Dm644 "$srcdir/privoxy.logrotate" "$pkgdir/etc/logrotate.d/privoxy"
    install -Dm644 "$srcdir/privoxy.service"   "$pkgdir/usr/lib/systemd/system/privoxy.service"
    install -Dm644 "$srcdir/privoxy.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/privoxy.conf"
    install -Dm644 "$srcdir/privoxy.sysusers"  "$pkgdir/usr/lib/sysusers.d/privoxy.conf"
}

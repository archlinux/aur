# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Maintainer: skydrome <skydrome@i2pmail.org>

pkgname=privoxy-cvs
pkgver=20130420
pkgrel=1
pkgdesc="A web proxy with advanced filtering capabilities. CVS version"
arch=('i686' 'x86_64')
url='http://www.privoxy.org'
license=('GPL2')
optdepends=('logrotate')
makedepends=('cvs')
conflicts=('privoxy')
provides=('privoxy')
backup=('etc/privoxy/'{config,trust,user.filter,default.filter}
        'etc/privoxy/user.action')
install='privoxy.install'
source=('privoxy.logrotate.d'
        'privoxy.service')
md5sums=('61a9436114bcad89d75f2f7468d0d429'
         '358e614190247fc1671bbcadddf500db')

_cvsroot=":pserver:anonymous:@ijbswa.cvs.sourceforge.net:/cvsroot/ijbswa"
_cvsmod="current"

build() {
    cd "$srcdir"

    msg "Connecting to CVS server..."
    if [[ -d "$_cvsmod/CVS" ]]; then
        cd "$_cvsmod"
        cvs -z3 update -d
    else
        cvs -z3 -d "$_cvsroot" co -f "$_cvsmod"
        cd "$_cvsmod"
    fi
    msg "CVS checkout done or server timeout"

    [[ -d "$srcdir/$_cvsmod-build" ]] && rm -rf "$srcdir/${_cvsmod}-build"
    cp -r "$srcdir/$_cvsmod" "$srcdir/${_cvsmod}-build"

    cd "$srcdir/${_cvsmod}-build"
    msg "Starting make..."

    autoheader
    autoconf
    ./configure --enable-compression
    make
}

package() {
    cd "$srcdir/${_cvsmod}-build"

    make install \
        prefix="$pkgdir/usr" \
        SBIN_DEST="$pkgdir/usr/bin" \
        MAN_DEST="$pkgdir/usr/share/man/man1" \
        CONF_BASE="$pkgdir/etc/privoxy" \
        VAR_DEST="$pkgdir/var" \
        GROUP=privoxy USER=privoxy

    # Don't overwrite existing log files!
    rm "${pkgdir}/var/log/privoxy/"*

    # Fix config paths.
    sed -i "${pkgdir}/etc/privoxy/config" \
        -e 's|^confdir.*$|confdir /etc/privoxy|' \
        -e 's|^logdir.*$|logdir /var/log/privoxy|' \
        -e '/^user-manual/s|.*|#user-manual /usr/share/doc/privoxy/user-manual/|' \
        -e 's|logfile logfile|privoxy.log|'

    # Fix permissions.
    find "${pkgdir}/etc/privoxy/" -type d |xargs chmod 700
    find "${pkgdir}/etc/privoxy/" -type f |xargs chmod 600
    chmod 700 "${pkgdir}/var/log/privoxy/"

    # avoid conflict with filesystem>=2012.06
    rmdir "$pkgdir/var/run"

    # systemd unit file
    install -Dm644 "${srcdir}/privoxy.service"     "${pkgdir}/usr/lib/systemd/system/privoxy.service"
    install -Dm644 "${srcdir}/privoxy.logrotate.d" "${pkgdir}/etc/logrotate.d/privoxy"
}

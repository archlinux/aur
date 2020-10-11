# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Contributor   : Jan de Groot <jgc@archlinux.org>
# Contributor   : Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor   : Tom Gundersen <teg@jklm.no>
# Contributor   : Link Dupont <link@subpop.net>

pkgdesc="Freedesktop.org message bus system"

pkgver=1.12.20
pkgrel=1

url="https://gitlab.freedesktop.org/dbus/dbus"

source=(
    "git+https://gitlab.freedesktop.org/dbus/dbus.git"
    'dbus.tmpfiles'
    'no-fatal-warnings.diff')
    
makedepends=(
#    'xmlto' 
#    'docbook-xsl' 
    'python' 
#    'yelp-tools' 
#    'doxygen' 
    'git'
    'autoconf-archive')

pkgver() {
    cd dbus
    git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
    cd dbus

	# Allow us to enable checks without them being fatal
	patch -Np1 -i ../no-fatal-warnings.diff

    NOCONFIGURE=1 ./autogen.sh
}

_path=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib/dbus-1.0
    runstatedir=/run
)

_flags=(
    --with-system-pid-file=/run/dbus/pid
    --with-system-socket=/run/dbus/system_bus_socket
    --with-dbus-session-bus-listen-address=unix:runtime=yes
    --with-dbus-session-bus-connect-address=autolaunch:
    --with-dbus-user=dbus
    --with-console-auth-dir=/run/console/
    --without-systemdsystemunitdir
    --without-x
    --enable-inotify
    --disable-static
    --disable-verbose-mode
    --disable-asserts
    --disable-systemd
    --disable-user-session
    --disable-x11-autolaunch
    --disable-checks
    --disable-xml-docs
    --disable-doxygen-docs
    --disable-ducktype-docs
    --disable-libaudit
)

build() {
    cd dbus

    ./configure "${_path[@]}" "${_flags[@]}"
    make
}

#check() {
#    make -C dbus check
#}

package_dbus-nosystemd-minimal-git(){
    optdepends+=('libaudit.so: audit support')
    provides=('libdbus' 'libdbus-1.so' 'dbus')
    conflicts=('libdbus' 'dbus')
    replaces=('libdbus')
    
    DESTDIR="$pkgdir" make -C dbus install

    rm -r "$pkgdir"/{etc,var}

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
  
    ## systemd-sysusers
    #install -D -m0644 "$srcdir/dbus.sysusers" "$pkgdir/usr/lib/sysusers.d/dbus.conf"
    ## systemd-tmpfiles
    install -D -m0644 "$srcdir/dbus.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dbus.conf"

    ## Split docs
    mv "$pkgdir/usr/share/doc" "$srcdir"	
}

package_dbus-docs-nosystemd-minimal-git(){
    pkgdesc+=" (documentation)"
    depends=()
    
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
    
    mv doc "$pkgdir/usr/share"
}

pkgname=(
    'dbus-nosystemd-minimal-git' 
    'dbus-docs-nosystemd-minimal-git')

arch=('x86_64')

depends=(
    'expat' 
#    'audit'
)

conflicts=(
    'dbus-eudev')

install='dbus.install'

sha512sums=('SKIP'
            'SKIP'
            'SKIP')

license=(
    'GPL'
    'custom')

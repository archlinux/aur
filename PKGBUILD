# Maintainer: Troy Will <troydwill at gmail dot com>
# Contributor: Charles Spence IV         <cspence@unomaha.edu>
# Contributor: /dev/rs0                  </dev/rs0@secretco.de.com>
# Contributor: Jacek Burghardt           <jacek@hebe.us>
# Contributor: Vojtech Aschenbrenner     <v@asch.cz>
# Contributor: Jason Gardner             <buhrietoe@gmail.com>
# Contributor: Ross melin                <rdmelin@gmail.com>
# Contributor (Parabola): Márcio Silva   <coadde@lavabit.com>
# Contributor (Parabola): André Silva    <emulatorman@lavabit.com>
# Orginally based on a Debian Squeeze package
_pkgname=zoneminder
pkgname=zoneminder-git
pkgver=1.28.1
pkgrel=2
pkgdesc='Capture, analyse, record and monitor video security cameras'
arch=( i686 x86_64 mips64el arm armv7h )
backup=( etc/zm.conf )
url="https://github.com/ZoneMinder/ZoneMinder/releases"
license=( GPL )
depends=(
    mariadb perl-dbd-mysql perl-dbi
    apache php php-apache php-gd php-mcrypt perl-php-serialization
    perl-libwww perl-net-sftp-foreign
    ffmpeg vlc perl-sys-mmap
    gnutls polkit
    perl-expect perl-archive-zip perl-date-manip
    perl-mime-lite perl-mime-tools
)
makedepends=(
    cmake make gcc netpbm
)
optdepends=(
    netpbm
    cambozola
    perl-time-modules
    perl-x10
    perl-astro-suntime
)
install=$_pkgname.install
     
source=(
    git://github.com/$_pkgname/$_pkgname.git
    httpd-zoneminder.conf
    zoneminder.service
)
# Because the source is not static, skip Git checksum:
sha256sums=('SKIP'
            'c2ca71ec57e53da040de61ff212ac063574e5ddfb4c333b70be060d5ec26c62c'
            '7eb2f26246e240e23502da44854d5ed14485aa11bc448ad73e9b57fee13f00a3')
     
pkgver() {
    cd "$_pkgname"
    printf "%s.r%s.%s.%s" "$pkgver" "$(git rev-list --count HEAD)" "$pkgrel" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname

    # ZM_PERL_SUBPREFIX=/lib/perl5 flag added to force Perl modules
    # to /usr/lib/perl5/ on non i686 architectures
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_PERL_SUBPREFIX=/lib/perl5 \
          -DZM_WEBDIR=/srv/http/zoneminder \
          -DZM_CGIDIR=/srv/http/cgi-bin \
          -DZM_WEB_USER=http \
          -DZM_CONTENTDIR=/var/cache/zoneminder \
          -DZM_LOGDIR=/var/log/zoneminder \
          -DZM_RUNDIR=/srv/zoneminder \
          -DZM_TMPDIR=/srv/zoneminder/tmp \
          -DZM_SOCKDIR=/srv/zoneminder/socks .
    
    make V=0
}
     
package() {

    cd $srcdir/$_pkgname

    DESTDIR=$pkgdir make install

    # Change Polkit directory permissions to Arch Linux policy
    chmod -v 700 $pkgdir/usr/share/polkit-1/rules.d/
    chown -v polkitd $pkgdir/usr/share/polkit-1/rules.d/

    # BEGIN CREATE_ZONEMINDER_DIRECTORIES
    mkdir -pv           $pkgdir/var/{cache/zoneminder,log/zoneminder}
    chown -Rv http.http $pkgdir/var/{cache/zoneminder,log/zoneminder}
    
    mkdir -pv          $pkgdir/srv/zoneminder/socks
    chown -v http.http $pkgdir/srv/zoneminder/socks
    
    mkdir -pv          $pkgdir/srv/zoneminder/tmp
    chown -v http.http $pkgdir/srv/zoneminder/tmp
    
    chown -v  http.http $pkgdir/etc/zm.conf 
    chmod 0700          $pkgdir/etc/zm.conf
    # END CREATE_ZONEMINDER_DIRECTORIES

    # Make content directories in /var/cache/zoneminder and to link them in /srv/http/zoneminder
    for i in events images temp; do
        mkdir              $pkgdir/var/cache/$_pkgname/$i
        chown -v http.http $pkgdir/var/cache/$_pkgname/$i
        ln -s                     /var/cache/$_pkgname/$i $pkgdir/srv/http/$_pkgname/$i
        chown -v --no-dereference http.http               $pkgdir/srv/http/$_pkgname/$i
    done

    # Create a link to the Zoneminder cgi binaries
    ln -sv /srv/http/cgi-bin $pkgdir/srv/http/$_pkgname

    chown -h http.http $pkgdir/srv/http/{cgi-bin,$_pkgname,$_pkgname/cgi-bin}

    # Link Cambozola
    # ln -s /usr/share/cambozola/cambozola.jar $pkgdir/srv/http/$_pkgname

    # Install configuration files
    mkdir -p                                       $pkgdir/etc/httpd/conf/extra
    install -D -m 644 $srcdir/httpd-$_pkgname.conf $pkgdir/etc/httpd/conf/extra
    
    mkdir -p                                    $pkgdir/usr/lib/systemd/system
    install -D -m 644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system
    
    install -D -m 644 COPYING     $pkgdir/usr/share/license/$_pkgname
    install -D -m 644 db/zm*.sql  $pkgdir/usr/share/$_pkgname/db     

}

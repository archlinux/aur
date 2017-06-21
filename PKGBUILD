# Maintainer: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Troy Will <troydwill at gmail dot com>
# Contributor: /dev/rs0                  </dev/rs0@secretco.de.com>
# Contributor: Jacek Burghardt           <jacek@hebe.us>
# Contributor: Vojtech Aschenbrenner     <v@asch.cz>
# Contributor: Jason Gardner             <buhrietoe@gmail.com>
# Contributor: Ross melin                <rdmelin@gmail.com>
# Contributor (Parabola): Márcio Silva   <coadde@lavabit.com>
# Contributor (Parabola): André Silva    <emulatorman@lavabit.com>
# Contributor: Charles Spence IV         <cspence@unomaha.edu>
# Contributor: Joe Julian                <me@joejulian.name>     
# Orginally based on a Debian Squeeze package
_pkgname=zoneminder
pkgname=zoneminder
pkgver=1.30.4
pkgrel=1
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
    cmake netpbm git 
)
optdepends=(
    'php-apcu-bci: Bring back the API for android control'
    netpbm
    cambozola
    perl-time-modules
    perl-x10
    perl-astro-suntime
)
install=$_pkgname.install

source=(
    https://github.com/ZoneMinder/ZoneMinder/archive/$pkgver.tar.gz
    httpd-zoneminder.conf
    zoneminder.service
    fabs.patch
    zoneminder-tmpfile.conf
)
sha256sums=('5461350caa9d8ec58deb1ef08e2e1641084e694f2a9f9e17b3b678b1a43203c7'
            'ff7382b38ac07dadead0ad4d583e3dbcf8da4aaa06b76d048ee334f69f95db67'
            '043d77a995553c533d62f48db4b719d29cf6c7074f215d866130e97be57ed646'
            'fd20faed09eaf825933c2a87b1d04febf99d183b2b36b0041df1e2b2990c49c2'
            'cc8af737c3c07750fc71317c81999376e4bbb39da883780164a8747b3d7c95a7'
            )

prepare () {
    cd $srcdir/ZoneMinder-$pkgver/web/api/app/Plugin/
    if [ ! -d "crud" ]; then
    git clone -b 3.0 https://github.com/FriendsOfCake/crud.git
    mkdir -p Crud
    mv  crud Crud
    fi
    patch $srcdir/ZoneMinder-$pkgver/src/zm_image.cpp < $srcdir/fabs.patch
}

build() {
   cd $srcdir/ZoneMinder-$pkgver
   
   cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_PERL_SUBPREFIX=/lib/perl5 \
          -DZM_WEBDIR=/srv/http/zoneminder \
          -DZM_CGIDIR=/srv/http/cgi-bin \
          -DZM_WEB_USER=http \
          -DZM_CONTENTDIR=/var/cache/zoneminder \
          -DZM_LOGDIR=/var/log/zoneminder \
          -DZM_RUNDIR=/run/zoneminder \
          -DZM_TMPDIR=/var/lib/zoneminder/temp \
          -DZM_SOCKDIR=/var/lib/zoneminder/sock .
     
    make V=0
} 
     
package() {

    cd $srcdir/ZoneMinder-$pkgver

    DESTDIR=$pkgdir make install

    # Change Polkit directory permissions to Arch Linux policy
    chmod -v 700 $pkgdir/usr/share/polkit-1/rules.d/
    chown -v polkitd $pkgdir/usr/share/polkit-1/rules.d/

    # BEGIN CREATE_ZONEMINDER_DIRECTORIES
    mkdir -pv           $pkgdir/var/{cache/zoneminder,log/zoneminder}
    chown -Rv http.http $pkgdir/var/{cache/zoneminder,log/zoneminder}
    
    # corresponds to -DZM_SOCKDIR=/var/lib/zoneminder/sock
    mkdir -pv          $pkgdir/var/lib/zoneminder/sock
    chown -v http.http $pkgdir/var/lib/zoneminder/sock
    
    # corresponds to -DZM_TMPDIR=/var/lib/zoneminder/temp
    mkdir -pv          $pkgdir/var/lib/zoneminder/temp
    chown -v http.http $pkgdir/var/lib/zoneminder/temp
    
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
    mkdir -p                                        $pkgdir/etc/httpd/conf/extra
    install -D -m 644 $srcdir/httpd-$_pkgname.conf  $pkgdir/etc/httpd/conf/extra
    
    mkdir -p                                        $pkgdir/usr/lib/systemd/system
    install -D -m 644 $srcdir/$_pkgname.service     $pkgdir/usr/lib/systemd/system
    
    install -D -m 644 COPYING                       $pkgdir/usr/share/license/$_pkgname
    install -D -m 644 db/zm*.sql                    $pkgdir/usr/share/$_pkgname/db
    
    mkdir -p                                        $pkgdir/usr/share/doc/$_pkgname
    # install -D -m 644 $srcdir/README              $pkgdir/usr/share/doc/$_pkgname

    install -Dm644 ../zoneminder-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/zoneminder.conf

}

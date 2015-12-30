# $Id: PKGBUILD 148079 2015-12-01 15:59:34Z svenstaro $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kevin Zuber <uKev@knet.eu>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
# Contributor: David Runge <dave@sleepmap.de>

pkgbase=uwsgi
pkgname=(libx32-uwsgi
         libx32-uwsgi-plugin-cgi
         libx32-uwsgi-plugin-python
         libx32-uwsgi-plugin-webdav)
pkgver=2.0.11.2
pkgrel=3.1
arch=(x86_64)
url="http://projects.unbit.it/$pkgbase"
license=(GPL2)
backup=('etc/uwsgi/emperor-x32.ini')
makedepends=(gcc-multilib-x32 libx32-python python-greenlet libx32-libxml2 libx32-libyaml
             libx32-pcre libx32-openssl libx32-bzip2 libx32-pam
             libx32-jansson libx32-systemd)
source=(http://projects.unbit.it/downloads/$pkgbase-$pkgver.tar.gz
        archlinux.ini
        uwsgi_at.service
        uwsgi_at.socket
        uwsgi_fix_rpath.patch
        uwsgi_ruby20_compatibility.patch
        uwsgi_trick_chroot.patch
        emperor.ini
        emperor.uwsgi.service
        emperor.uwsgi.socket)

md5sums=('1f02dcbee7f6f61de4b1fd68350cf16f'
         'e069992a7e9aa86534d89a333b1ec2d7'
         '8f3231b89b2cdc3802c2b14fa70a6ba1'
         'e4e20c976e476f5560dc24f0b16991f1'
         '1a4516d5cdcf5b95b036f4eae2d0c152'
         '4d09535ce379c8acd76160f35d5d6b55'
         '0c09a52fdb88f08c36a8b380f451ce6d'
         '5fa14ddea9a3dae17b5be28468d47b80'
         'f51c2e8f8c87a9c19b00b3bb79d6da50'
         'f726795b7beb92bf9e62cab8fcbf8c8f')

prepare() {
    cd $srcdir/$pkgbase-$pkgver
    cp $srcdir/archlinux.ini buildconf/archlinux.ini
    #sed -i 's/LIBS .*-lphp5.*/LIBS = []/' plugins/php/uwsgiplugin.py
    for patch in uwsgi_fix_rpath.patch uwsgi_ruby20_compatibility.patch uwsgi_trick_chroot.patch; do
        patch -Np1 -i $srcdir/$patch
    done
    rm -rf plugins/ruby
    mv plugins/ruby{19,}
    sed -i 's:\(ruby\)19:\1:' plugins/ruby/uwsgiplugin.py
}

build() {
    pushd $srcdir/$pkgbase-$pkgver

    python-x32 uwsgiconfig.py --build archlinux
    python-x32 uwsgiconfig.py --plugin plugins/python archlinux python
    python-x32 uwsgiconfig.py --plugin plugins/greenlet archlinux greenlet
    python-x32 uwsgiconfig.py --plugin plugins/asyncio archlinux asyncio

    #pushd $srcdir/$pkgbase-$pkgver/apache2
    #/usr/bin/apxs -c mod_proxy_uwsgi.c
}

package_libx32-uwsgi() {
    pkgdesc="A fast, self-healing and developer/sysadmin-friendly application container server coded in pure C (x32 ABI)"
    depends=(uwsgi libx32-libxml2 libx32-jansson libx32-libyaml libx32-systemd libx32-libcap libx32-pam libx32-util-linux libx32-openssl libx32-pcre)
    install=uwsgi.install
    cd $srcdir/$pkgbase-$pkgver
    install -Dm755 uwsgi $pkgdir/usr/bin/uwsgi-x32
    install -Dm644 $srcdir/uwsgi_at.service $pkgdir/usr/lib/systemd/system/uwsgi-x32@.service
    install -Dm644 $srcdir/uwsgi_at.socket $pkgdir/usr/lib/systemd/system/uwsgi-x32@.socket
    install -Dm644 $srcdir/emperor.uwsgi.service $pkgdir/usr/lib/systemd/system/emperor.uwsgi-x32.service
    install -Dm644 $srcdir/emperor.uwsgi.socket $pkgdir/usr/lib/systemd/system/emperor.uwsgi-x32.socket
    install -Dm644 $srcdir/emperor.ini $pkgdir/etc/uwsgi/emperor-x32.ini
}

package_libx32-uwsgi-plugin-cgi() {
    depends=(libx32-uwsgi)
    pkgdesc="CGI plugin (x32 ABI)"
    install -Dm755 $pkgbase-$pkgver/cgi_plugin.so $pkgdir/usr/libx32/uwsgi/cgi_plugin.so
}

package_libx32-uwsgi-plugin-python() {
    depends=(libx32-uwsgi libx32-python libx32-python-greenlet)
    pkgdesc="Plugin for Python support (x32 ABI)"
    install -Dm755 $pkgbase-$pkgver/python_plugin.so $pkgdir/usr/libx32/uwsgi/python_plugin.so
    install -Dm755 $pkgbase-$pkgver/greenlet_plugin.so $pkgdir/usr/libx32/uwsgi/greenlet_plugin.so
    install -Dm755 $pkgbase-$pkgver/asyncio_plugin.so $pkgdir/usr/libx32/uwsgi/asyncio_plugin.so
    install -Dm644 $pkgbase-$pkgver/uwsgidecorators.py $pkgdir/usr/libx32/python3.5/site-packages/uwsgidecorators.py
    python -m compileall $pkgdir/usr/libx32/python3.5/site-packages/
    python -O -m compileall $pkgdir/usr/libx32/python3.5/site-packages/
}

package_libx32-uwsgi-plugin-webdav() {
    depends=(libx32-uwsgi)
    pkgdesc="Plugin for webdav support (x32 ABI)"
    install -Dm755 $pkgbase-$pkgver/webdav_plugin.so $pkgdir/usr/libx32/uwsgi/webdav_plugin.so
}


# Maintainer: Markus Moser<marmoser@wu.ac.at>
pkgname=naviserver
pkgver=4.99.24
pkgrel=1
pkgdesc="A versatile multiprotocol (httpd et al) server written in C/Tcl"
arch=('x86_64')
url="https://bitbucket.org/naviserver/naviserver/"
license=('MPL')
depends=('tcllib>=1.17' 'tcl>=8.5.18' 'tdom>=0.8.3' 'nsf>=1.6.8' 'systemd')
source=("http://download.sourceforge.net/sourceforge/naviserver/${pkgname}-${pkgver}.tar.gz" 
"naviserver.service")
md5sums=("f1ba0b3b4cbb76337e89615ba7ed67b5"
"1ce98dd274bb30020a1bcfbf82a67259")

build() {
    cd "naviserver-${pkgver}"
    msg "Starting make..."
    msg "make in $(pwd)"
    ./configure --prefix /usr 
    make 
}

package() {
    install="${pkgname}.install"
    cd ${pkgname}-${pkgver}
    #do not call make install since 1)we want a FHS compliant hierarchy 2)make install spams fakeroot warning messages
    #bin
    install -D nsd/nsd ${pkgdir}/usr/lib/naviserver/bin/nsd
    install -D nsd/init.tcl ${pkgdir}/usr/lib/naviserver/bin/init.tcl
    install -D nsproxy/nsproxy ${pkgdir}/usr/lib/naviserver/bin/nsproxy
    install -D nsthread/nsthreadtest  ${pkgdir}/usr/lib/naviserver/bin/nsthreadtest
    #naviserver bin lib
    install -D nscgi/nscgi.so ${pkgdir}/usr/lib/naviserver/bin/nscgi.so
    install -D nscp/nscp.so ${pkgdir}/usr/lib/naviserver/bin/nscp.so
    install -D nsdb/nsdb.so ${pkgdir}/usr/lib/naviserver/bin/nsdb.so
    install -D nsdbtest/nsdbtest.so ${pkgdir}/usr/lib/naviserver/bin/nsdbtest.so
    install -D nslog/nslog.so ${pkgdir}/usr/lib/naviserver/bin/nslog.so
    install -D nsperm/nsperm.so ${pkgdir}/usr/lib/naviserver/bin/nsperm.so
    install -D nsproxy/nsproxy.so ${pkgdir}/usr/lib/naviserver/bin/nsproxy.so
    install -D nssock/nssock.so ${pkgdir}/usr/lib/naviserver/bin/nssock.so
    #/usr/lib
    install -D nsd/libnsd.so ${pkgdir}/usr/lib/libnsd.so
    install -D nsproxy/nsproxy.so ${pkgdir}/usr/lib/nsproxy.so
    install -D nsdb/libnsdb.so ${pkgdir}/usr/lib/libnsdb.so
    install -D nsthread/libnsthread.so ${pkgdir}/usr/lib/libnsthread.so
    #etc
    install -D nsd-config.tcl ${pkgdir}/etc/naviserver/nsd-config.tcl
    install -D sample-config.tcl ${pkgdir}/etc/naviserver/sample-config.tcl
    install -D simple-config.tcl ${pkgdir}/etc/naviserver/simple-config.tcl
    install -D openacs-config.tcl ${pkgdir}/etc/naviserver/openacs-config.tcl
    #cgi-bin
    install -d ${pkgdir}/usr/lib/naviserver/cgi-bin
    #inc
    install -d ${pkgdir}/usr/lib/naviserver/include
    install -D include/*.h ${pkgdir}/usr/lib/naviserver/include/
    install -D nsdb/nsdb.h ${pkgdir}/usr/lib/naviserver/include/
    install -D nsproxy/nsproxy.h ${pkgdir}/usr/lib/naviserver/include/
    install -D include/Makefile.module ${pkgdir}/usr/lib/naviserver/include/
    install -D include/Makefile.global ${pkgdir}/usr/lib/naviserver/include/
    #modules
    install -d ${pkgdir}/usr/lib/naviserver/servers/default/modules
    install -d ${pkgdir}/usr/lib/naviserver/pages/doc
    install -d ${pkgdir}/usr/lib/naviserver/pages/examples
    install -D contrib/examples/* ${pkgdir}/usr/lib/naviserver/pages/examples
    install -D bitbucket-install.tcl ${pkgdir}/usr/lib/naviserver/pages/bitbucket-install.tcl
    install -D index.adp ${pkgdir}/usr/lib/naviserver/pages/index.adp
    #tcl
    install -d ${pkgdir}/usr/lib/naviserver/tcl
    install -D tcl/* ${pkgdir}/usr/lib/naviserver/tcl
    install -d  ${pkgdir}/usr/bin
    #install systemd service
    install -D "${srcdir}/naviserver.service" "${pkgdir}/usr/lib/systemd/system/naviserver.service"
    #wrapper for /usr/bin
    echo "#!/bin/sh
cd /usr/lib/naviserver
exec ./bin/nsd \"\$@\"" > ${pkgdir}/usr/bin/nsd
    chmod +x ${pkgdir}/usr/bin/nsd
}

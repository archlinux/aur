# Maintainer: Galen Sampson <galen.sampson at gmail dot com>
pkgname=trafficserver
pkgver=3.2.4
pkgrel=1
pkgdesc="Apache Traffic Server"
url="http://trafficserver.apache.org/"
license=('Apache')
arch=('i686' 'x86_64')
depends=('openssl' 'tcl' 'hwloc')
makedepends=('flex')

source=(
    'http://apache.tradebit.com/pub/trafficserver/trafficserver-3.2.4.tar.bz2'
    'trafficserver.tmpfiles'
    'config.layout.patch'
    'trafficserver.git-c9a2e06.patch'
    'trafficserver.git-75d3566.patch'
    'proxy_Main.patch'
    'trafficserver.service.in.patch')
md5sums=(
    '5ce8f59d608896ae56e9053ff86bb40c'
    'fc8ab2b6d01e22fb376832fb13137db1'
    '9ca01c6833ebbde4644a255c8bf802ce'
    'f395175164b2d8de90535e42ae1de72b'
    'f774f8454bec9422ac1af5445625a6b5'
    'ec6be0b8e2ab575bcd077993809061b0'
    '74ba08091f580f8984eee8db0f7e4d27')

install=trafficserver.install
changelog=trafficserver.changelog

backup=(
    'etc/trafficserver/congestion.config'
    'etc/trafficserver/logs_xml.config'
    'etc/trafficserver/hosting.config'
    'etc/trafficserver/parent.config'
    'etc/trafficserver/records.config'
    'etc/trafficserver/socks.config'
    'etc/trafficserver/trafficserver-release'
    'etc/trafficserver/splitdns.config'
    'etc/trafficserver/vaddrs.config'
    'etc/trafficserver/ae_ua.config'
    'etc/trafficserver/cluster.config'
    'etc/trafficserver/storage.config'
    'etc/trafficserver/mgr.cnf'
    'etc/trafficserver/volume.config'
    'etc/trafficserver/plugin.db'
    'etc/trafficserver/icp.config'
    'etc/trafficserver/update.config'
    'etc/trafficserver/remap.config'
    'etc/trafficserver/ssl_multicert.config'
    'etc/trafficserver/cache.config'
    'etc/trafficserver/body_factory/default/access#ssl_forbidden'
    'etc/trafficserver/body_factory/default/transcoding#unsupported'
    'etc/trafficserver/body_factory/default/request#syntax_error'
    'etc/trafficserver/body_factory/default/connect#failed_connect'
    'etc/trafficserver/body_factory/default/default'
    'etc/trafficserver/body_factory/default/response#bad_version'
    'etc/trafficserver/body_factory/default/interception#no_host'
    'etc/trafficserver/body_factory/default/cache#not_in_cache'
    'etc/trafficserver/body_factory/default/response#bad_response'
    'etc/trafficserver/body_factory/default/request#scheme_unsupported'
    'etc/trafficserver/body_factory/default/connect#dns_failed'
    'etc/trafficserver/body_factory/default/README'
    'etc/trafficserver/body_factory/default/redirect#moved_temporarily'
    'etc/trafficserver/body_factory/default/timeout#activity'
    'etc/trafficserver/body_factory/default/timeout#inactivity'
    'etc/trafficserver/body_factory/default/access#denied'
    'etc/trafficserver/body_factory/default/cache#read_error'
    'etc/trafficserver/body_factory/default/request#no_content_length'
    'etc/trafficserver/body_factory/default/request#cycle_detected'
    'etc/trafficserver/body_factory/default/access#proxy_auth_required'
    'etc/trafficserver/body_factory/default/.body_factory_info'
    'etc/trafficserver/body_factory/default/urlrouting#no_mapping'
    'etc/trafficserver/body_factory/default/request#no_host'
    'etc/trafficserver/body_factory/default/connect#hangup'
    'etc/trafficserver/body_factory/default/congestion#retryAfter'
    'etc/trafficserver/body_factory/default/access#redirect_url'
    'etc/trafficserver/plugin.config'
    'etc/trafficserver/stats.config.xml'
    'etc/trafficserver/log_hosts.config'
    'etc/trafficserver/ip_allow.config')

build() {
    cd "${pkgname}-${pkgver}"
    patch -Np0 -u -i ../config.layout.patch
    patch -Np1 -u -i ../trafficserver.git-c9a2e06.patch 
    patch -Np1 -u -i ../trafficserver.git-75d3566.patch 
    patch -Np0 -u -i ../proxy_Main.patch
    patch -Np0 -u -i ../trafficserver.service.in.patch
    ./configure --with-user=tserver --enable-layout=Arch
    make
}

check() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"
    make check
}

package()
{
    cd "${srcdir}"/"${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"

    # Remove libtool files
    rm -f "${pkgdir}"/usr/lib/libtsmgmt.la
    rm -f "${pkgdir}"/usr/lib/libtsutil.la
    rm -f "${pkgdir}"/usr/lib/trafficserver/regex_remap.la
    rm -f "${pkgdir}"/usr/lib/trafficserver/conf_remap.la
    rm -f "${pkgdir}"/usr/lib/trafficserver/stats_over_http.la
    rm -f "${pkgdir}"/usr/lib/trafficserver/header_filter.la

    rm -rf "${pkgdir}"/run

    install -D -m 644 "${srcdir}"/trafficserver.tmpfiles \
        "${pkgdir}"/usr/lib/tmpfiles.d/trafficserver.conf

    install -D -m 644 \
        "${srcdir}"/"${pkgname}-${pkgver}"/rc/trafficserver.service \
        "${pkgdir}"/usr/lib/systemd/system/trafficserver.service
}

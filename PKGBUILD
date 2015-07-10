# Maintainer: Galen Sampson <galen.sampson at gmail dot com>
# Contributor: David Roheim <david dot roheim at gmail dot com>

pkgname='trafficserver'
pkgver=5.3.1
pkgrel=1
pkgdesc="Apache Traffic Server"
url="http://trafficserver.apache.org/"
license=('Apache')
arch=('i686' 'x86_64')
depends=('tcl' 'hwloc' 'curl')
makedepends=('flex')

source=(
    http://archive.apache.org/dist/"${pkgname}"/"${pkgname}"-"${pkgver}".tar.bz2
    trafficserver.tmpfiles
    trafficserver.service.in.patch)

md5sums=('9c0e2450b1dd1bbdd63ebcc344b5a813'
         'fc8ab2b6d01e22fb376832fb13137db1'
         '74ba08091f580f8984eee8db0f7e4d27')

install=${pkgname}.install
changelog=${pkgname}.changelog

backup=(
    'etc/trafficserver/congestion.config'
    'etc/trafficserver/logs_xml.config'
    'etc/trafficserver/hosting.config'
    'etc/trafficserver/parent.config'
    'etc/trafficserver/records.config'
    'etc/trafficserver/socks.config'
    'etc/trafficserver/trafficserver-release'
    'etc/trafficserver/prefetch.config'
    'etc/trafficserver/splitdns.config'
    'etc/trafficserver/vaddrs.config'
    'etc/trafficserver/cluster.config'
    'etc/trafficserver/storage.config'
    'etc/trafficserver/volume.config'
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
    'etc/trafficserver/body_factory/default/request#invalid_content_length'
    'etc/trafficserver/body_factory/default/congestion#retryAfter'
    'etc/trafficserver/body_factory/default/access#redirect_url'
    'etc/trafficserver/plugin.config'
    'etc/trafficserver/stats.config.xml'
    'etc/trafficserver/log_hosts.config'
    'etc/trafficserver/ip_allow.config')

prepare() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"
    patch -Np0 -u -i ../trafficserver.service.in.patch
}

build() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"

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

    chmod 750 "${pkgdir}"/run/trafficserver

    chown root:root "${pkgdir}"/usr/share/trafficserver

    install -D -m 644 "${srcdir}"/trafficserver.tmpfiles \
        "${pkgdir}"/usr/lib/tmpfiles.d/trafficserver.conf

    install -D -m 644 \
        "${srcdir}"/"${pkgname}-${pkgver}"/rc/trafficserver.service \
        "${pkgdir}"/usr/lib/systemd/system/trafficserver.service
}

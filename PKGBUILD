# Maintainer: Galen Sampson <galen.sampson at gmail dot com>
# Contributor: David Roheim <david dot roheim at gmail dot com>

pkgname='trafficserver'
pkgver=8.0.7
pkgrel=1
pkgdesc="Apache Traffic Server"
url="http://trafficserver.apache.org/"
license=('Apache')
arch=('i686' 'x86_64')
depends=('tcl' 'hwloc' 'curl' 'libunwind' 'pcre' 'geoip' 'luajit')
makedepends=('flex' 'python2-sphinx')

source=(
    http://archive.apache.org/dist/"${pkgname}"/"${pkgname}"-"${pkgver}".tar.bz2
    trafficserver.tmpfiles
    trafficserver.sysusers
    trafficserver.service.in.patch
    trafficserver.lib_perl_Makefile.in.patch)

md5sums=('1a2c1ee629785580b4da6b58c04e0411'
         '5234ec78048900590edbf6d6e3be1af9'
         'a89c31b7753e8a9a0f83e7e0a79f5e87'
         '89465888eb48237b68a3b1bd61eded53'
         '719a9364900017cc05256042a51d0dc9')

install=${pkgname}.install
changelog=${pkgname}.changelog

_missing_user_message="Trafficserver must not run as root and systemd will
prevent it from running as the user nobody. This package requires that the
'trafficserver' OS user and group exist when building to ensure correct file
ownership during the build process. This package uses systemd-sysusers as
other arch packages do. Run the following command as root before building this
package.

    # echo 'u trafficserver - \"Apache Traffic Server\"' | \\
          systemd-sysusers --replace=/usr/lib/sysusers.d/trafficserver.conf -

Note that the UID and GID assigned must match on the arch install where the
package when be deployed.  This can be accomplished by noting the values for
the UID and GID of the trafficserver user on the build server and then creating
sysusers overrides for the trafficserver user where the package will be
installed.  For example (on the server where the package will be deployed):

    # echo 'u trafficserver 999:999 \"Apache Traffic Server\" - > /etc/sysusers.d/trafficserver.conf

This ensures that the post install steps do not clobber administrator defined
or existing cache ownership at the expense of requiring the trafficserver user
be defined the same way on the package build server and package deployment
host.  See https://bbs.archlinux.org/viewtopic.php?id=241480"

backup=(
    'etc/trafficserver/hosting.config'
    'etc/trafficserver/parent.config'
    'etc/trafficserver/records.config'
    'etc/trafficserver/socks.config'
    'etc/trafficserver/trafficserver-release'
    'etc/trafficserver/splitdns.config'
    'etc/trafficserver/storage.config'
    'etc/trafficserver/ssl_server_name.yaml'
    'etc/trafficserver/volume.config'
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
    'etc/trafficserver/body_factory/default/redirect#moved_permanently'
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
    'etc/trafficserver/plugin.config'
    'etc/trafficserver/logging.yaml'
    'etc/trafficserver/ip_allow.config'
)

prepare() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"
    patch -Np0 -u -i ../trafficserver.service.in.patch
    patch -Np0 -u -i ../trafficserver.lib_perl_Makefile.in.patch
}

build() {
    # This check is defined here instead of in prepare() in case the package
    # builder is skipping the prepare step.
    if ! ( getent passwd trafficserver || getent group trafficserver ); then
        echo "$_missing_user_message"
        return 1
    fi

    cd "${srcdir}"/"${pkgname}-${pkgver}"

    ./configure PYTHON=python2 SPHINXBUILD=sphinx-build2 \
        --with-user=trafficserver \
        --with-group=trafficserver \
        --enable-layout=Arch
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

    rm -rf "${pkgdir}"/run
    rm -rf "${pkgdir}"/usr/lib/perl5
    rm -rf "${pkgdir}"/usr/share

    install -D -m 644 "${srcdir}"/trafficserver.tmpfiles \
        "${pkgdir}"/usr/lib/tmpfiles.d/trafficserver.conf

    install -D -m 644 "${srcdir}"/trafficserver.sysusers \
        "${pkgdir}"/usr/lib/sysusers.d/trafficserver.conf

    install -D -m 644 \
        "${srcdir}"/"${pkgname}-${pkgver}"/rc/trafficserver.service \
        "${pkgdir}"/usr/lib/systemd/system/trafficserver.service
}

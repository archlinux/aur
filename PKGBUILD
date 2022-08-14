# Maintainer: hiyuki2578 <tomoka319 at gmail dot com>
# Contributor: Galen Sampson <galen.sampson at gmail dot com>
# Contributor: David Roheim <david dot roheim at gmail dot com>

pkgname='trafficserver'
pkgver=9.1.3
pkgrel=1
pkgdesc="Apache Traffic Server"
url="http://trafficserver.apache.org/"
license=('Apache')
arch=('i686' 'x86_64')
depends=('hwloc' 'curl' 'libunwind' 'pcre' 'geoip' 'luajit' 'perl' 'brotli')
makedepends=('flex' 'python-sphinx')

# Temporary check disable
BUILDENV+=('!check')

source=(
    http://dlcdn.apache.org/"${pkgname}"/"${pkgname}"-"${pkgver}".tar.bz2
    trafficserver.tmpfiles
    trafficserver.sysusers
    trafficserver.service.in.patch
    trafficserver.lib_perl_Makefile.in.patch
    trafficserver.src_tscore_unit_tests.patch
    trafficserver.src_tscore_ink_file.patch)

sha256sums=('c8bf77b034b0da6c38d3ec9f3ca85ef1038aa046170e839308b0a59709d9afb6'
            '8c9dbabfe7a8e0ecf9f3edb3673d1ff0cd63bf79551389047a723479b8d21fac'
            'a4e6a00dea61aa3f98413f092711afb90795ef35676f6a8e3970f4163d360202'
            'fc0b437ef9f9c56ceaaa99eea7075abe15200ff540cfc505e42b0a8f762128b1'
            '6fb98a044637d6a6d7365b5e49e4a481f556b26d143898ab430e8e8dd7004277'
            'cc56ee24659be4f81f0d70d3e4b0df0954e51647e77599baee4598d4c0339020'
            '3a747bd6d0c322ba232918cbea56471e16b481d22bd0780f59f951c443d1e8d4')

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

    # echo 'u trafficserver 999:999 \"Apache Traffic Server\" -' > /etc/sysusers.d/trafficserver.conf

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
    'etc/trafficserver/sni.yaml'
    'etc/trafficserver/volume.config'
    'etc/trafficserver/remap.config'
    'etc/trafficserver/ssl_multicert.config'
    'etc/trafficserver/strategies.yaml'
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
    'etc/trafficserver/body_factory/default/request#uri_len_too_long'
    'etc/trafficserver/body_factory/default/.body_factory_info'
    'etc/trafficserver/body_factory/default/urlrouting#no_mapping'
    'etc/trafficserver/body_factory/default/request#no_host'
    'etc/trafficserver/body_factory/default/connect#hangup'
    'etc/trafficserver/body_factory/default/request#invalid_content_length'
    'etc/trafficserver/plugin.config'
    'etc/trafficserver/logging.yaml'
    'etc/trafficserver/ip_allow.yaml'
)

prepare() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"
    patch -Np0 -u -i ../trafficserver.service.in.patch
    patch -Np0 -u -i ../trafficserver.lib_perl_Makefile.in.patch
    patch -Np0 -u -i ../trafficserver.src_tscore_unit_tests.patch
    patch -Np0 -u -i ../trafficserver.src_tscore_ink_file.patch
}

build() {
    # This check is defined here instead of in prepare() in case the package
    # builder is skipping the prepare step.
    if ! ( getent passwd trafficserver || getent group trafficserver ); then
        echo "$_missing_user_message"
        return 1
    fi

    cd "${srcdir}"/"${pkgname}-${pkgver}"

    ./configure SPHINXBUILD=sphinx-build \
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

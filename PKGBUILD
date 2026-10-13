# Maintainer: Tyrolyean <tyrolyean@escpe.net>
pkgname=flexisip
pkgver=2.6.2
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('x86_64')
url="https://www.linphone.org/en/flexisip-sip-server/"
license=('AGPL-3.0-or-later')
groups=()
depends=('gsm' 'jsoncpp' 'libnghttp2' 'libvpx' 'libxml2' 'mariadb-libs'
         'net-snmp' 'openssl' 'opus' 'postgresql-libs' 'python' 'speex' 'speexdsp'
         'sqlite' 'xerces-c' 'zlib')
makedepends=('cmake' 'git' 'doxygen' 'python-pystache' 'python-six' 'yasm')
optdepends=('python-google-auth: firebase_v1_get_access_token.py push notification helper')
backup=('etc/flexisip/flexisip.conf' 'etc/logrotate.d/flexisip-logrotate')
install='flexisip.install'
# Upstream no longer supports building against a system linphone-sdk: the SDK,
# sofia-sip and soci are compiled in-tree from git submodules, so we have to
# build from the git tag instead of the release tarball (which ships the
# submodule directories empty).
# Fetch from Belledonne's github mirror: see below for reasoning
source=("git+https://github.com/BelledonneCommunications/flexisip.git#tag=$pkgver")
noextract=()
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"

    # apparently makechrootpkg mounts can be cross device, which silently broke
    # the `cp -aln`. The below functions as a plain copy as fallback.
    _sync() { cp -aln "$1/." "$2"/ 2>/dev/null || cp -a --update=none "$1/." "$2"/; }
    # gitlab.linphone.org is dropping connections a lot, and quite a few build
    # attempts were needed to get it all the way there.
    # we now keep the submodule git dirs in SRCDEST to make
    # the download resume across runs, and take everything belledonne mirrors
    # on github from there. the external/* forks exist solely on their gitlab
    local cache="${SRCDEST:-$startdir}/flexisip-submodules"
    mkdir -p "$cache" .git/modules
    _sync "$cache/." .git/modules/

    local try ret
    for try in {1..10}; do
        ret=0
        git -c url."https://github.com/BelledonneCommunications/".insteadOf="https://gitlab.linphone.org/BC/public/" \
            -c url."https://gitlab.linphone.org/BC/public/external/".insteadOf="https://gitlab.linphone.org/BC/public/external/" \
            submodule update --init --recursive --force || ret=$?
        _sync .git/modules/. "$cache"/
        (( ret == 0 )) && return 0
        echo "submodule fetch failed (attempt $try/10), retrying in 15s..."
        sleep 15
    done
    return 1
}

build() {
    # The vendored linphone-sdk installs generic libbctoolbox.so,
    # liblinphone.so, libmbedtls.so, ... so keep the whole tree in its own
    # prefix to avoid file conflicts with the system packages. The binaries
    # find the bundled libraries through the install rpath.
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/opt/flexisip \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DFLEXISIP_SYSTEMD_INSTALL_DIR=/usr/lib/systemd/system \
        -DENABLE_REDIS=YES \
        -DINTERNAL_LIBHIREDIS=YES \
        -DENABLE_PRESENCE=YES \
        -DENABLE_CONFERENCE=YES \
        -DENABLE_OPENID_CONNECT=NO
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -d "$pkgdir/usr/bin"
    for B in flexisip flexisip_cli.py flexisip_pusher; do
        ln -s "/opt/flexisip/bin/$B" "$pkgdir/usr/bin/$B"
    done
}

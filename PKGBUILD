# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=2.5.3
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('x86_64')
url="https://flexisip.org"
license=('AGPL-3.0-or-later')
groups=()
depends=('gsm' 'hiredis' 'jsoncpp' 'libnghttp2' 'libvpx' 'libxml2' 'mariadb-libs'
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
source=("git+https://gitlab.linphone.org/BC/public/flexisip.git#tag=$pkgver")
noextract=()
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    # The vendored linphone-sdk installs generic libbctoolbox.so,
    # liblinphone.so, libmbedtls.so, ... so keep the whole tree in its own
    # prefix to avoid file conflicts with the system packages. The binaries
    # find the bundled libraries through the install rpath.
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/opt/flexisip \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DFLEXISIP_SYSTEMD_INSTALL_DIR=/usr/lib/systemd/system \
        -DENABLE_REDIS=YES \
        -DENABLE_PRESENCE=YES \
        -DENABLE_CONFERENCE=YES \
        -DENABLE_OPENID_CONNECT=NO
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -d "$pkgdir/usr/bin"
    for B in flexisip flexisip_cli.py flexisip_pusher flexisip_serializer; do
        ln -s "/opt/flexisip/bin/$B" "$pkgdir/usr/bin/$B"
    done
}

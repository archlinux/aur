# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgname=xsb-prolog
pkgver=5.0
pkgrel=1
pkgdesc='Logic Programming and Deductive Database system for Unix and Windows'
arch=(i686 x86_64)
url='https://xsb.sourceforge.net/downloads/index.html'
license=(GPL-2.0-only)
source=(
    "https://downloads.sourceforge.net/project/xsb/xsb/$pkgver%20%28Green%20Tea%29/XSB-$pkgver.tar.gz"
)
sha256sums=('11dcea94709b618c0a7410eb97f7c1f7cbae2531f43f48a338d22b0f405c9cf0')
noextract=("XSB-$pkgver.tar.gz")

# Sadly it doesn't seem to do anything.
conflicts=("$pkgname")
depends=(unixodbc mariadb-libs java-environment curl libxml2 pcre)

rm_link() {
    rm -fv /opt/xsb-5.0.0
}

trap rm_link EXIT

prepare() {
    tar -xzf "XSB-$pkgver.tar.gz"
    patch -p1 -d XSB <../0001-Fix-shebang.patch
    patch -p1 -d XSB <../0002-Fallback-to-python3-if-specific-version-wasn-t-found.patch

    # Yes it is this bad. Build system insists on touching system paths
    if [ -e /opt/xsb-5.0.0 ]
    then
        cat <<-EOT >&2

		#########################################################################
		# This package can't be upgraded in-place, because it clobbers its real #
		# location during build. Please uninstall it first:                     #
		#                                                                       #
		#    pacman -R xsb-prolog                                               #
		#                                                                       #
		#########################################################################

		P.S. Yes, build script is *that* bad.

EOT
        exit 1
    fi
    ln -v -s "$srcdir/XSB" /opt/xsb-5.0.0
}

build() {
    cd XSB/build

    # It is common to add -jN to MAKEFLAGS, but parallel builds are broken
    unset MAKEFLAGS

    export JAVA_HOME=/usr/lib/jvm/default
    ./configure --prefix=/opt

    ./makexsb
    ./makexsb install DESTDIR='/opt/xsb-5.0.0/root'
}

package() {
    install -D -m755 ../xsb "$pkgdir/usr/bin/xsb"
    cd "$pkgdir"
    mv /opt/xsb-5.0.0/root/opt opt
    find -O3 opt -type f \! \
        \( -regex 'opt/xsb-5\.0\.0/build/config\.\(sub\|guess\)' \
        -o -regex 'opt/xsb-5\.0\.0/bin/xsb' \
        -o -regex "opt/xsb-5\.0\.0/config/$(gcc -dumpmachine)/bin/.*" \
        -o -name '*.so' \
        -o -name '*.dll' \
        -o -name '*.sh' \
        \) \
        -exec chmod a-x '{}' '+'
    chmod 777 opt/xsb-5.0.0/config/x86_64-pc-linux-gnu/lib
}

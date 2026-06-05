# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Jonathan Shreckengost <jonathanshrek@gmail.com>

pkgbase=liblnk-git
pkgname=(liblnk-git liblnk-tools-git python-liblnk-git)
pkgver=20260525.r1.g6579a99
pkgrel=1
pkgdesc="Library and tools to access the Windows Shortcut File (LNK) format"
arch=(x86_64)
license=(LGPL-3.0-or-later)
url="https://github.com/libyal/liblnk"
depends=(glibc)
makedepends=(git python automake autoconf libtool pkgconf python-build python-installer python-wheel python-setuptools)
source=("$pkgname::git+$url?signed"
        "libbfio::git+${url/liblnk/libbfio}"
        "libcdata::git+${url/liblnk/libcdata}"
        "libcerror::git+${url/liblnk/libcerror}"
        "libcfile::git+${url/liblnk/libcfile}"
        "libclocale::git+${url/liblnk/libclocale}"
        "libcnotify::git+${url/liblnk/libcnotify}"
        "libcpath::git+${url/liblnk/libcpath}"
        "libcsplit::git+${url/liblnk/libcsplit}"
        "libcthreads::git+${url/liblnk/libcthreads}"
        "libfdatetime::git+${url/liblnk/libfdatetime}"
        "libfguid::git+${url/liblnk/libfguid}"
        "libfole::git+${url/liblnk/libfole}"
        "libfwps::git+${url/liblnk/libfwps}"
        "libfwsi::git+${url/liblnk/libfwsi}"
        "libuna::git+${url/liblnk/libuna}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=(0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E)

pkgver() {
    cd "$pkgbase"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    ## use the local git repos
    sed -i "s#\${GIT_URL}#${srcdir}/\${LOCAL_LIB}#" synclibs.sh
    ./synclibs.sh
    ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"

    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --runstatedir=/run \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --enable-python

    make
    mkdir -p "$srcdir/package"
    make DESTDIR="$srcdir/package" install
    python -m build --wheel --no-isolation
}

package_liblnk-git() {
    provides=(liblnk liblnk.so)
    conflicts=(liblnk)

    cd "$srcdir/package"
    cp -a --parents \
        usr/lib \
        usr/include \
        usr/share/man/man3 \
        "$pkgdir"
    rm -rf "$pkgdir/usr/lib/python"*
}

package_liblnk-tools-git() {
    pkgdesc="Command line tools for liblnk"
    provides=(liblnk-tools)
    conflicts=(liblnk-tools)
    depends=(liblnk-git)

    cd "$srcdir/package"
    cp -a --parents usr/bin usr/share/man/man1 "$pkgdir"
}

package_python-liblnk-git() {
    pkgdesc="Python3 bindings for liblnk"
    provides=(python-liblnk pylnk)
    conflicts=(python-liblnk)
    depends=(python liblnk-git)

    cd "$pkgbase"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

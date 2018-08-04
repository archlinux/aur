# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: Justus Piater <Justus-dev at Piater dot name>

pkgname=syncevolution-nogui
_name=syncevolution
pkgver=1.5.3
pkgrel=1
pkgdesc="Synchronize PIM data via various protocols"
arch=('x86_64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('libgnome-keyring' 'neon' 'openobex' 'libunique')
makedepends=('intltool' 'boost' 'python' 'kdelibs')
source=("https://download.01.org/syncevolution/syncevolution/sources/syncevolution-$pkgver.tar.gz"
        "$_name-$pkgver-sslcert.patch"
        "$_name-$pkgver-python2.patch")
sha256sums=('e1195fda09bc7782eb8a55674e9e69d69da4780a9aa4a54d37d84da67ee863c0'
            '6904cd9eb9ed4e3eb888bad187315960de9d8a23d69c3c5587e011441cca1494'
            '704cbbf11289c5fd82b8c7228661f8cddaa40714598c56b2154783a35630128e')

prepare() {
    cd "$_name-$pkgver"
    for patch in sslcert python2; do
      patch -p1 -i "$srcdir/$_name-$pkgver-$patch.patch"
    done
    autoreconf -fiv
    cd src/synthesis
    autoreconf -fiv
}

build() {
    cd "$srcdir/${_name}-$pkgver"
    ./configure --prefix=/usr                        \
                --libexecdir=/usr/lib/syncevolution  \
                --sysconfdir=/etc                    \
                --enable-shared                      \
                --enable-maemo                       \
                --enable-bluetooth                   \
                --enable-core                        \
                --enable-cmdline                     \
                --enable-local-sync                  \
                --enable-dbus-service                \
                --enable-notify                      \
                --enable-notify-compatibility        \
                --disable-ebook                      \
                --disable-ecal                       \
                --enable-gnome-keyring               \
                --enable-kwallet                     \
                --enable-pbap                        \
                --enable-sqlite                      \
                --enable-dav
    make
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}

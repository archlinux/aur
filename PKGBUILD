# Maintainer: robertfoster

pkgname=coova-chilli-arch
pkgver=1.5
pkgrel=1
pkgdesc='An open-source software access controller'
arch=('i686' 'x86_64')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
makedepends=('gengetopt')
optdepends=('python2')
options=(!libtool)
replaces=(coova-chilli)
source=("https://github.com/coova/coova-chilli/archive/$pkgver.tar.gz"
    chilli.service
    makefile.am.patch
)
backup=('etc/chilli.conf')
install=chilli.install

prepare() {
    cd "${srcdir}/coova-chilli-${pkgver}"
    patch -Np1 -i ../makefile.am.patch
    
    ./bootstrap
    ./configure --prefix=/usr --sbindir=/usr/bin/ \
    --sysconfdir=/etc --localstatedir=/var \
    --enable-statusfile \
    --disable-static \
    --enable-shared \
    --enable-largelimits \
    --enable-miniportal \
    --enable-chilliredir \
    --enable-chilliproxy \
    --enable-chilliscript \
    --with-poll \
    --with-openssl \
    --enable-chilliradsec
}

build() {
    cd "${srcdir}/coova-chilli-${pkgver}"
    make
}

package() {
    cd "${srcdir}/coova-chilli-${pkgver}"
    make DESTDIR="${pkgdir}" install
    
    msg2 "Installing systemd unit for ${pkgname}"
    install -Dm0644 ../chilli.service $pkgdir/usr/lib/systemd/system/chilli.service
    
    rm -rf ${pkgdir}/etc/init.d
}

md5sums=('93a50aa2dfdc648f9c42780b26502c59'
         '828147e21eac257c3b700ea7f4ca3d98'
         '986482eb732530c30cdc9e7987a53ad4')

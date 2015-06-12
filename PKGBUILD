# Maintainer: David Seus <archstuff at archlinux.net>
# Contributor: Vincent Szolnoky <ippytraxx at installgentoo.com>
# Contributor: Trevor Turner <turn3r.tr3v0r at gmail.com>

pkgname=ntfs-3g-fuse
pkgver=2015.3.14
pkgrel=1
pkgdesc="Stable read and write NTFS driver and ntfsprogs. This package will allow normal users to mount NTFS Volumes."
arch=('i686' 'x86_64')
url="http://www.tuxera.com/community/open-source-ntfs-3g/"
license=('GPL2')
depends=('glibc')
conflicts=('ntfs-3g' 'ntfsprogs')
provides=('ntfsprogs' 'ntfs-3g')
options=('!libtool')
install=ntfs-3g-fuse.install
source=(http://tuxera.com/opensource/ntfs-3g_ntfsprogs-$pkgver.tgz)
sha256sums=('97f996015d8316d4a272bd2629978e5e97072dd3cc148ce39802f8037c6538f2')

prepare() 
{
    cd "${srcdir}/ntfs-3g_ntfsprogs-${pkgver}"
    sed -i 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' {ntfsprogs,src}/Makefile.in
}

build() 
{
    cd "${srcdir}/ntfs-3g_ntfsprogs-${pkgver}"
    ./configure --prefix=/usr \
        --with-fuse=internal --disable-static \
        --enable-posix-acls --disable-ldconfig \
        --mandir=/usr/share/man --sbin=/usr/bin 
    make
}

package() 
{
    cd "${srcdir}/ntfs-3g_ntfsprogs-${pkgver}"
    make DESTDIR="$pkgdir" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
    ln -s /usr/bin/ntfs-3g "$pkgdir/usr/bin/mount.ntfs"
}

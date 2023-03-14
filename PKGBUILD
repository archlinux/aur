# Maintainer: Lucas Saliés Brum <sistematico at gmail dot com>
# Contributor: Loopsmark <loopsmark at merkur dot pm>
# Contributor: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=0.1.206
pkgrel=1
pkgdesc='Modern, native, and friendly GUI tool for relational databases (Alpha)'
arch=('x86_64')
url='https://tableplus.com/'
license=('custom')
depends=('gtksourceview3' 'libgee' 'gnome-keyring')
source=('LICENSE'
    "tableplus_${pkgver}_${pkgrel}_amd64.deb::https://deb.tableplus.com/debian/22/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb"
    'http://archive.ubuntu.com/ubuntu/pool/main/o/openldap/libldap-2.5-0_2.5.13+dfsg-1ubuntu1_amd64.deb'
    'http://archive.ubuntu.com/ubuntu/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.28+dfsg-6ubuntu2_amd64.deb'
    'https://archive.archlinux.org/packages/g/glib2/glib2-2.68.4-1-x86_64.pkg.tar.zst'
    'tableplus.desktop')
noextract=('libldap-2.5-0_2.5.13+dfsg-1ubuntu1_amd64.deb' 'libsasl2-2_2.1.28+dfsg-6ubuntu2_amd64.deb')
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            'f16a5fafa1d4a0e57323070653beb25b190c21e8f2ccd26749ba9d7b521e09bc'
            '574db9cb32afe6e49f2661beab8b0ad79aed7ce3d7566d7e82c24dd4d0adcef8'
            '78f563e42a1a044d107a27b0db94b7f23b8d601b6bcb1f95bcd9c7380d5379a0'
            'e8e759bd9abb58c93067e199088077f3d6fa2c608ebc6f571cb9dd814812bcea'
            '83620b08e325418947f0007ecca7b981a988bfdac3f466db165f9262d1c0e5f4')

prepare() {
    tar -xf "${srcdir}/data.tar.zst"
    ar p libldap-2.5-0_2.5.13+dfsg-1ubuntu1_amd64.deb data.tar.zst | tar x --zst
    ar p libsasl2-2_2.1.28+dfsg-6ubuntu2_amd64.deb data.tar.zst | tar x --zst
}

package() {
    install -d $pkgdir/opt/tableplus $pkgdir/usr/local/bin
    install -Dm755 $srcdir/opt/tableplus/tableplus -t $pkgdir/opt/tableplus/
    install -m755 $srcdir/opt/tableplus/tableplus -t $pkgdir/opt/tableplus/
    install -Dm644 $srcdir/opt/tableplus/tableplus.desktop -t $pkgdir/usr/share/applications/
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $srcdir/usr/lib/x86_64-linux-gnu/{liblber-2.5.so.0,libldap-2.5.so.0,libsasl2.so.2} -t $pkgdir/opt/tableplus/lib/
    install -Dm755 $srcdir/usr/lib/libgio-2.0.so.0.6800.4 -t $pkgdir/opt/tableplus/lib/

    cp -r $srcdir/opt/tableplus/resource $pkgdir/opt/tableplus/

    echo -e '#!/bin/sh\n/usr/bin/env LD_LIBRARY_PATH=/opt/tableplus/lib /opt/tableplus/tableplus "$@"' >$pkgdir/usr/local/bin/tableplus
    chmod 755 $pkgdir/usr/local/bin/tableplus
}

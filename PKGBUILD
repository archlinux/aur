# Maintainer: James An <james@jamesan.ca>

pkgname=google-apps-manager
pkgver=3.21
pkgrel=1
pkgdesc='Command line tool for managing Google Apps accounts'
arch=('any')
url='https://code.google.com/p/google-apps-manager'
license=('apache')
depends=(
    python2-google-api-python-client
    python2-httplib2
    python2-simplejson
    python2-gdata
    perl-mozilla-ca
)
source=(
    https://3ca168a01ea8d36f578893ffd5d45ba8daef8381.googledrive.com/host/0B0YvUuHHn3MnbFl6N0k1UXcwdVk/gam-3.21-python-src.zip
    fhs.patch
    python2.patch
)
md5sums=('63f076b05051d3f85ae4aadfcc87733d'
         '10752b2e864ba5791e9bf9f42c2759ef'
         'aa9621532ec5052a9569b7b5e1e1da4f')

prepare() {
    patch -i fhs.patch
    patch -i python2.patch
}

package() {
    install -m755 -d "$pkgdir/etc/$pkgname/flags"
    install -m755 -d "$pkgdir/usr/share/$pkgname"

    # install upstream files
    install -Dm755 gam.py "$pkgdir/usr/bin/gam"
    for file in admin-settings-v1.json \
                whatsnew.txt \
                ; do
        install -m644 $file "$pkgdir/usr/share/$pkgname/$file"
    done

    # install
    touch "$pkgdir/etc/$pkgname/flags/noupdatecheck.txt"
    ln -s /usr/share/perl5/vendor_perl/Mozilla/CA/cacert.pem "$pkgdir/usr/share/$pkgname/cacert.pem"
}

# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.11.0
pkgrel=1
pkgdesc="PHP project build system based on Apache Ant."
arch=(any)
url="http://www.phing.info/"
license=(LGPL)
depends=(php)
makedepends=(php-pear)
install="${pkgname}.install"
source=(
    "http://pear.phing.info/get/${pkgname}-${pkgver}.tgz"
    phing.install
)
sha256sums=(
    f7fbd82d1c47e7de753df34e675cf705ef24247c44c94b7ea6354767c028d5ba # phing tarball
    d6b73432293ff2dfe9ae4866d77b68c05721b0ffd3bd332bc58678f624c03f4b # phing.install
)

package() {

    # Work around for the inability to use channel-discover as non-root
    # without tweaking or adding a ~/.pearrc. This is a kluge, yikes!
    cat "${srcdir}/package.xml" | sed -e "s/^ <channel>pear.phing.info<\/channel>/ <channel>pear.php.net<\/channel>/" > "${srcdir}/package.xml.new"
    mv "${srcdir}/package.xml.new" "${srcdir}/package.xml"

    cd "${srcdir}"
    tar czvf "${pkgname}-rebuild.tgz" package.xml ${pkgname}-${pkgver}

    pear install -P"${pkgdir}" -O -n "${srcdir}/${pkgname}-rebuild.tgz"

    rm -r "${pkgdir}"/usr/share/pear/{.channels,.depdb*,.filemap,.lock}

    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

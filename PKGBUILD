# Maintainer: 6543 <6543 at obermui dot de>

pkgname=adebar
pkgver=2.4.1
pkgrel=0
pkgdesc="Android DEvice Backup And Report, using Bash and ADB."
arch=("any")
url="https://codeberg.org/izzy/Adebar"
license=('GPL2')
depends=('bash' 'android-tools')
source=("https://codeberg.org/izzy/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('2c899c59241ba10fe867d4ec92a3a9476cd02644')

build() {
    cd "${srcdir}/${pkgname}"

    # change adebar to use tools and lib dir from package
    sed -i -e 's|\(BINDIR=\).*|\1"/usr/share/adebar"|' adebar-cli
    sed -i -e 's|\(LIBDIR=\).*|\1"/usr/lib/adebar"|' adebar-cli
    # make sure $HOME/.config/adebar get created if it does not exist
    sed -i '/^\ \ USER_CONF=/c\ \ mkdir -p "$USER_CONF"' adebar-cli

    # gzip docs
    gzip --best -f doc/*
    gzip --best -f README.md
}

package() {
    # adebar
    mkdir -p ${pkgdir}/usr/bin
    install -m755 ${srcdir}/${pkgname}/adebar-cli ${pkgdir}/usr/bin/$pkgname

    # lib
    mkdir -p ${pkgdir}/usr/lib/adebar
    install -D -m644 ${srcdir}/${pkgname}/lib/* ${pkgdir}/usr/lib/adebar

    # tools
    mkdir -p ${pkgdir}/usr/share/adebar/tools
    install -D -m755 ${srcdir}/${pkgname}/tools/* ${pkgdir}/usr/share/adebar/tools

    # templates
    mkdir -p ${pkgdir}/usr/share/adebar/templates/default
    install -D -m755 ${srcdir}/${pkgname}/templates/default/* ${pkgdir}/usr/share/adebar/templates/default

    # docs
    mkdir -p ${pkgdir}/usr/share/doc/adebar
    install -D -m644 ${srcdir}/${pkgname}/doc/* ${pkgdir}/usr/share/doc/adebar
    install -D -m644 ${srcdir}/${pkgname}/README.md.gz ${pkgdir}/usr/share/doc/adebar/README.md.gz
}

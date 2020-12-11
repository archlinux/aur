pkgname=piwigo
pkgver=2.10.2
pkgrel=1
pkgdesc="Piwigo is a photo gallery software for the web that comes with powerful features to publish and manage your collection of pictures."
arch=(any)
url="https://piwigo.org/"
license=("GPL")
optdepends=('php-apache: to use the Apache web server')
depends=("php" "php-gd" "mariadb")
makedepends=("unzip")
backup=("etc/webapps/piwigo/apache.conf")
install=piwigo.install
options=(emptydirs)

source=('piwigo.zip::https://piwigo.org/download/dlcounter.php?code=latest'
        'apache.conf'
        'piwigo.perm.sh')
md5sums=('488174630af5fd3589301cb1d2ab3c66'
         '5d1da01ee31fa1ad7a2b7e11766ec1f7'
         'a855fa62a5ae3595f3361ae42c3cdf2f')


pkgver() {
#    curl -Is https://github.com/Piwigo/Piwigo/releases/latest | awk -F'/' '/^Location/ {print $NF}' |  sed 's/[^[:print:]]//'
      curl -s  https://piwigo.org/download/all_versions.php | head -1
}



package() {
    ### install piwigo
    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -a piwigo "${pkgdir}/usr/share/webapps/."

    ### default perm
    find "${pkgdir}/usr/share/webapps/piwigo/" -type f -print0 | xargs -0 chmod 0640
    find "${pkgdir}/usr/share/webapps/piwigo/" -type d -print0 | xargs -0 chmod 0750
    install -D -m755 "${srcdir}/piwigo.perm.sh" "${pkgdir}/usr/bin/set-piwigo-perm"

    ### apache conf (optionnal)
    mkdir -p "${pkgdir}/etc/webapps/piwigo"
    install -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/webapps/piwigo/apache.conf"
    ## add 2 patch from pull request
    ## cd ${pkgdir}/usr/share/webapps/piwigo/
    ## curl https://github.com/Piwigo/Piwigo/commit/c6ed0b5838b6dbcbdcc5d9cddf2c66362cea4591.patch --output pull1.patch
    ## curl https://github.com/Piwigo/Piwigo/commit/f1d1b55d82e9f2d77c5b54422bced31f44370ce0.patch --output pull2.patch
    ## curl https://github.com/Piwigo/Piwigo/commit/53e52711236f3657d2b447726459f29fc1a1bb25.patch --output pull3.patch
    ## patch -p1 < pull1.patch
    ## patch -p1 < pull2.patch
    ## patch -p1 < pull3.patch
}

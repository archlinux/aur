# Maintainer: Julien Girardin <jugirardin@gmail.com>

pkgname=zenphoto
pkgver=1.4.8
pkgrel=1
pkgdesc="a php-based Photo Web gallery. Manage Albums"
arch=(any)
url="http://www.zenphoto.org"
license=("GPL")
depends=("php" "php-gd")
backup=("etc/webapps/zenphoto/zenphoto.cfg"
        "etc/webapps/zenphoto/htaccess"
        "etc/webapps/zenphoto/apache.conf")
#options=(!strip)
install=zenphoto.install
source=(http://github.com/zenphoto/zenphoto/archive/zenphoto-${pkgver}.tar.gz
        apache.conf)
md5sums=('8573863da23410a252c81c32f4ef3f7b'
         '05298d3385372db7757193a53b22f816')

package() {
    mkdir -p "${pkgdir}/etc/webapps/zenphoto"
    mkdir -p "${pkgdir}/usr/share/webapps/zenphoto"
    mkdir -p "${pkgdir}/var/lib/zenphoto"
    mkdir -p "${pkgdir}/var/log/zenphoto"
    mkdir -p "${pkgdir}/usr/share/doc/zenphoto"

    cd "${srcdir}/zenphoto-zenphoto-${pkgver}"
    find . -name ".git*" -exec rm {} \;

#    mv "doc_files" "${pkgdir}/usr/share/doc/zenphoto"
#    mv "CHANGELOG.md" "README.md" "${pkgdir}/usr/share/doc/zenphoto"
    mv "README.md" "${pkgdir}/usr/share/doc/zenphoto"
    mv "zp-core/htaccess" "${pkgdir}/etc/webapps/zenphoto/htaccess"
    mv "zp-core/zenphoto_cfg.txt" "${pkgdir}/etc/webapps/zenphoto/zenphoto.cfg"

    chmod 644 "${pkgdir}/etc/webapps/zenphoto/htaccess"
    chmod 644 "${pkgdir}/etc/webapps/zenphoto/zenphoto.cfg"


    install -m644 "zp-core/example_robots.txt" \
        "${pkgdir}/usr/share/webapps/zenphoto/robots.txt"
    install -m644 "zp-core/images/favicon.ico" \
        "${pkgdir}/usr/share/webapps/zenphoto/favicon.ico"
    install -m644 "index.php" "${pkgdir}/usr/share/webapps/zenphoto/index.php"


    cp -r "zp-core" "${pkgdir}/usr/share/webapps/zenphoto/zp-core"
    cp -r "zp-data" "${pkgdir}/var/lib/zenphoto/zp-data"
    cp -r "plugins" "${pkgdir}/var/lib/zenphoto/plugins"
    cp -r "themes" "${pkgdir}/var/lib/zenphoto/themes"
    cp -r "albums" "${pkgdir}/var/lib/zenphoto/albums"

    mkdir -p "${pkgdir}/var/lib/zenphoto/cache_html"
    mkdir -p "${pkgdir}/var/lib/zenphoto/cache"
    mkdir -p "${pkgdir}/var/lib/zenphoto/uploaded"

    chown -R http:http ${pkgdir}/var/lib/zenphoto/*
    chmod 755 ${pkgdir}/var/lib/zenphoto/*


    install -m644 "${startdir}/apache.conf" \
        "${pkgdir}/etc/webapps/zenphoto/apache.conf"


    ln -s "/var/lib/zenphoto/zp-data" \
        "${pkgdir}/usr/share/webapps/zenphoto/zp-data"
    ln -s "/var/lib/zenphoto/albums" \
        "${pkgdir}/usr/share/webapps/zenphoto/albums"
    ln -s "/var/lib/zenphoto/cache" \
        "${pkgdir}/usr/share/webapps/zenphoto/cache"
    ln -s "/var/lib/zenphoto/cache_html" \
        "${pkgdir}/usr/share/webapps/zenphoto/cache_html"
    ln -s "/var/lib/zenphoto/plugins" \
        "${pkgdir}/usr/share/webapps/zenphoto/plugins"
    ln -s "/var/lib/zenphoto/themes" \
        "${pkgdir}/usr/share/webapps/zenphoto/themes"
    ln -s "/var/lib/zenphoto/uploaded" \
        "${pkgdir}/usr/share/webapps/zenphoto/uploaded"

    ln -s "/etc/webapps/zenphoto/zenphoto.cfg" \
        "${pkgdir}/var/lib/zenphoto/zp-data/zenphoto.cfg"
    ln -s "/etc/webapps/zenphoto/htaccess" \
        "${pkgdir}/usr/share/webapps/zenphoto/.htaccess"

    nb_file=$(tail -n1 \
        "${pkgdir}/usr/share/webapps/zenphoto/zp-core/Zenphoto.package")

    # cosmetic : prevent the installer complaining about moved files
    sed -e "/zp-core\/htaccess/d" \
        -e "/zp-core\/zenphoto_cfg.txt/d" \
        -e "s/^[[:digit:]]*$/$(( ${nb_file}-2 ))/g" \
        -i "${pkgdir}/usr/share/webapps/zenphoto/zp-core/Zenphoto.package"
}


# Maintainer: Fanch
# Contributor: Henry-Joseph Audéoud <h.audeoud@gmail.com>

pkgname=piwigo
pkgver=11.5.0
pkgrel=5
pkgdesc='Photo gallery software for the web'
arch=(any)
url="https://piwigo.org/"
license=("GPL")
depends=('php7' 'mariadb')
optdepends=('php7-gd: graphic library (one graphic library is required)'
            'imagemagick: graphic library (one graphic library is required)'
            'php7-apache: Apache Web Server (one web server is required)'
            'nginx: nginx Web Server (one web server is required)'
            'php7-fpm: FastCGI, required with nginx Web Server'
            'exiftool: Write Metadata plugin or any other plugin dealing with EXIF/IPTC metadata'
            'ffmpeg: VideoJS plugin to create video poster'
            'jpegtran: RotateImage plugin to rotate images with no compression'
            'pdftoppm: generate poster from PDF files (instead of ImageMagick)')
makedepends=("unzip")
backup=('etc/webapps/piwigo/apache.conf'
        'etc/nginx/sites-available/piwigo.conf'
        'etc/php7/php-fpm.d/piwigo.conf')
options=(emptydirs)
source=('piwigo.zip::https://piwigo.org/download/dlcounter.php?code=latest'
        'apache.conf'
        'piwigo.perm.sh'
        'nginx.conf'
        'php-fpm7.conf'
        'php-fpm7.service.conf')
sha256sums=('bfecdd743c62cdb4e1936662178d019af264ea763d26c8c832da836fbe09652d'
            '64435b2f5fe29ab6201e00a755bff5dbe77bc4450559a2668a21e750ce13f8be'
            '0e6d4af6552f4eead62825999eee115152cf5f884f2c65b759379ac5b15d36f7'
            'c27d837157cc6b189f62e36b43532efdf9881f5db8059ba5a430be2ad9154937'
            'af481516383faae67bb02d604dbe07778e352aa01fc548e0cd641a902fddbfb7'
            '4fd0561c64ab8a1b166e69b4ce9985f343bcd351d33fc055604edf94f11317f4')

package() {
    install_path="${pkgdir}/usr/share/webapps/piwigo"
    var_path="${pkgdir}/var/lib/piwigo"
    http_user=33

    cd "${srcdir}"

    # Install main files
    install -d "${install_path}"
    cp -a piwigo/* "${install_path}/"

    # Variable data directories.  Should be in /var, but no way to change it in
    # piwigo configuration (Bug Report?).  So use symbolic links to allow that.
    install -d "${var_path}"
    mv "${install_path}/_data" "${var_path}/"
    ln -s "${var_path#${pkgdir}}/_data" "${install_path}/"
    mv "${install_path}/upload" "${var_path}/"
    ln -s "${var_path#${pkgdir}}/upload" "${install_path}/"
    chown -R ${http_user}:${http_user} "${var_path}"

    # Install apache & nginx conf'
    install -D -m644 apache.conf "${pkgdir}/etc/webapps/piwigo/apache.conf"
    install -D -m644 nginx.conf "${pkgdir}/etc/nginx/sites-available/piwigo.conf"
    install -D -m644 php-fpm7.conf "${pkgdir}/etc/php7/php-fpm.d/piwigo.conf"
    install -D -m644 php-fpm7.service.conf "${pkgdir}/usr/lib/systemd/system/php-fpm7.service.d/piwigo.conf"

    # database.inc.php should be writeable in ${install_path}/local/config,
    # with no way to select the path of this file.  Make that directory
    # writable by http.  Also, make it not readable by anyone else for
    # security.
    # TODO: raise a bug request to be able to set this path to go in e.g.
    # /etc/piwigo/.  It will better fit here.
    chown ${http_user}:${http_user} "${install_path}/local/config"
    chmod o-rwx "${install_path}/local/config/"
}

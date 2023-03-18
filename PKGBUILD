# Maintainer: Fanch
# Co-maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>

pkgname=piwigo
pkgver=13.6.0
pkgrel=1
pkgdesc='Photo gallery software for the web'
arch=(any)
url="https://piwigo.org/"
license=("GPL")
depends=('php>=8.1' 'mariadb>=10.1')
optdepends=('php-gd: graphic library (one graphic library is required)'
            'imagemagick: graphic library (one graphic library is required)'
            'php-apache: Apache Web Server (one web server is required)'
            'nginx: nginx Web Server (one web server is required)'
            'php-fpm: FastCGI, required with nginx Web Server'
            'ffmpeg: VideoJS plugin to create video poster'
            'poppler: generate poster from PDF files'
            'perl: some command-line scripts')
makedepends=("unzip")
backup=('etc/webapps/piwigo/apache.conf'
        'etc/php/php-fpm.d/piwigo.conf')
options=(emptydirs)
source=("${pkgname}-${pkgver}.zip::https://piwigo.org/download/dlcounter.php?code=${pkgver}"
        'apache.conf'
        'piwigo.perm.sh'
        'nginx.conf'
        'php-fpm.conf'
        'php-fpm.service.conf')
md5sums=('df228bb7ef19fa0165bad10d3904dcd5'  # Provided by upstream
         SKIP SKIP SKIP SKIP SKIP)
sha256sums=('b0060f52199afcf19e8fdc0d99b4f0be26df60dcd316f30f9094315635c6a2df'
            '64435b2f5fe29ab6201e00a755bff5dbe77bc4450559a2668a21e750ce13f8be'
            '0e6d4af6552f4eead62825999eee115152cf5f884f2c65b759379ac5b15d36f7'
            'f173b613e0b5bb1e3390066ddd362afc7904848f5959b65a03919ae8e7674f91'
            '8c0f750df745cfcb23a6e61993683a55c0b8ea8b0e0805c5b1bf72312d653b63'
            'ca2387a701ec88b1c995f2dfc35832c3d3aea6f54741da85cf246fb64bc8d2bb')

package() {
    install_path="${pkgdir}/usr/share/webapps/piwigo"
    var_path="${pkgdir}/var/lib/piwigo"
    http_user=33

    # Install main files
    install -d "${install_path}"
    cp -a ${pkgname}/* "${install_path}/"

    # Install doc
    install -d "${pkgdir}/usr/share/doc/piwigo/"
    mv -t "${pkgdir}/usr/share/doc/piwigo/" "${install_path}/docs"/*
    rmdir "${install_path}/docs"

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
    install -D -m644 nginx.conf "${pkgdir}/etc/nginx/sites-available/piwigo.conf.example"
    install -D -m644 php-fpm.conf "${pkgdir}/etc/php/php-fpm.d/piwigo.conf"
    install -D -m644 php-fpm.service.conf "${pkgdir}/usr/lib/systemd/system/php-fpm.service.d/piwigo.conf"

    # database.inc.php should be writeable in ${install_path}/local/config,
    # with no way to select the path of this file.  Make that directory
    # writable by http.  Also, make it not readable by anyone else for
    # security.
    # TODO: raise a bug request to be able to set this path to go in e.g.
    # /etc/piwigo/.  It will better fit here.
    chown ${http_user}:${http_user} "${install_path}/local/config"
    chmod o-rwx "${install_path}/local/config/"
}

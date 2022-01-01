#Maintainer: sukanka<su975853527 [AT] gmail.com>

pkgname=onemanager-php-git
_pkgname=onemanager
pkgver=3.4.r40.gd99ee1d
pkgrel=1
pkgdesc="An index & manager of Onedrive based on serverless."
url="https://github.com/qkqpttgf/OneManager-php"
arch=('any')
license=('unknown')
depends=('nginx' 'php-fpm')
provides=(onemanager onemanager-php)
makedepends=('git')
optdepends=("certbot: Enable https for site automatically.")
source=("${_pkgname}::git+https://github.com/qkqpttgf/OneManager-php.git"
)
backup=("var/www/${_pkgname}/web.config"
'etc/nginx/conf.d/onemanager.conf'
"var/www/${_pkgname}/.data/config.php"
)
install=onemanager.install
sha512sums=('SKIP')


pkgver(){
    cd ${srcdir}/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/var/www/${_pkgname}
    mv ${_pkgname}/{*,.data/,.htaccess} ${pkgdir}/var/www/${_pkgname}
    mkdir -p ${pkgdir}/etc/nginx/conf.d/
    
    chmod -R 0777 ${pkgdir}/var/www/${_pkgname}
    echo '''server {
    server_name dl.example.com;
    listen 80;
    root /var/www/onemanager;
    index index.php;
    rewrite ^/(?!.well-known)(.*)$ /index.php?/$1 last;
    location ~ \.php$ {
        fastcgi_pass   unix:/run/php-fpm/php-fpm.sock;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}'''> ${pkgdir}/etc/nginx/conf.d/onemanager.conf

}


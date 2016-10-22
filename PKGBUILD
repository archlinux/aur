# Maintainer: Joel Porquet <joel@porquet.org>

name=php-remote-storage
pkgname=${name}-git
pkgver=r329.df406f0
pkgrel=2
pkgdesc="remoteStorage server written in PHP"
arch=("any")
license=("agpl3")
url="https://github.com/fkooman/php-remote-storage"
makedepends=('composer')

source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

instdir="usr/share/webapps/${name}"
etcdir="etc/webapps/${name}"
vardir="var/lib/${name}"

build() {
    msg "Nothing to compile for ${pkgname}"
}

package() {
    _instdir="${pkgdir}/${instdir}"
    _etcdir="${pkgdir}/${etcdir}"
    _vardir="${pkgdir}/${vardir}"

    cd ${pkgname}
    php /usr/bin/composer install --prefer-dist --dev --ignore-platform-reqs

    install -d "${_instdir}"
    cp -ra bin src vendor views web "${_instdir}"

    install -d "${_etcdir}"
    install -Dm640 -g http contrib/storage.local.conf.fedora "${_etcdir}/"
    install -Dm640 -g http contrib/storage.local.conf.ubuntu "${_etcdir}/"
    install -Dm640 -g http config/server.yaml.example "${_etcdir}/server.yaml"

    install -d "${_instdir}/config"
    ln -s "/${etcdir}/server.yaml" "${_instdir}/config/server.yaml"

    install -dm750 -o http -g http "${_vardir}/data"
    ln -s "/${vardir}/data" "${_instdir}/data"
}

backup=("${etcdir}/server.yaml")

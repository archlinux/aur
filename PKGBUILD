# Contributions by: Timothée Ravier <tim@siosm.fr>, Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=etherpad-lite
pkgver=1.6.0
pkgrel=0
epoch=1
pkgdesc="Lightweight fork of etherpad based on javascript"
arch=(any)
url="http://etherpad.org"
_watch=('http://etherpad.org','Documentation <small>v([\d.]*)</small>')
license=('GPL2')
depends=('curl' 'python2' 'openssl' 'nodejs' 'git' 'npm')
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database')
conflicts=('etherpad-lite-git')
backup=('usr/share/webapps/etherpad-lite/settings.json'
        'etc/webapps/etherpad-lite/settings.json')
install='etherpad-lite.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ether/${pkgname}/archive/${pkgver}.tar.gz"
        "etherpad-lite.service")
sha512sums=('7f850d4a2a0d57ed7f60545779261bdd6be5e47c9a616edd61a99b5f15046d68710458a5eb1f76bb7e08e7a34b752bbcb6fb6e419924d971137805e78fdaf512'
            '7b775171da97a3e7ad44a2b1b319970fd307a88e90a171c49bf70d2382767175e98bb21c7054e38ee6c066bd2dfadf94d28a9ff31d4f21145ec4441caa13c4d7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

#No patches included

#  for s in "${source[@]}"; do
#    case "$s" in (*.patch)
#      cp "../${s}" .
#      patch -p0 < "${s}"
#      rm -f "${s}"
#    esac
#  done
}

build() {
    cd "$pkgname-$pkgver"
    export PYTHON=python2
    ./bin/installDeps.sh
}

package() {
    cd "$pkgname-$pkgver"
    echo 'cleaning up unneeded files...'
    rm bin/installOnWindows.bat start.bat bin/buildDebian.sh bin/buildForWindows.sh
    rm -r var bin/deb-src doc tests
    echo 'move files...'
    install -dm 755 "${pkgdir}"/usr/share/webapps/${pkgname}
    cp -a . "${pkgdir}"/usr/share/webapps/${pkgname}
    mkdir -p "${pkgdir}"/etc/webapps/${pkgname}/
    mv "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json "${pkgdir}"/etc/webapps/${pkgname}/settings.json
    ln -s /etc/webapps/${pkgname}/settings.json "${pkgdir}"/usr/share/webapps/${pkgname}/settings.json
    install -Dm644 "${srcdir}"/${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
    install -D LICENSE  "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    echo "setting rights..."
    #touch "${pkgdir}"/usr/share/webapps/etherpad-lite/APIKEY.txt
    find "${pkgdir}"/usr/share/webapps/etherpad-lite \
        \( -type f -exec chmod ug+rw,o+r {} \; \) , \
        \( -type d -exec chmod ug+rwxs,o+rx {} \; \)
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/run.sh
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/installDeps.sh
}

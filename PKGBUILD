# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=etherpad-lite-git
_pkgname=etherpad-lite
pkgver=1.5.0.r577.ge98821c
pkgrel=1
epoch=1
pkgdesc="Lightweight fork of etherpad based on javascript"
arch=(any)
url="http://etherpad.org"
license=('GPL2')
depends=('curl' 'python2' 'openssl' 'nodejs' 'git' 'npm')
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database')
conflicts=('etherpad-lite')
backup=('usr/share/webapps/etherpad-lite/settings.json'
        'etc/webapps/etherpad-lite/settings.json')
install='etherpad-lite.install'
source=("git+https://github.com/ether/etherpad-lite.git"
        "etherpad-lite.service"
	"fix-v4.x-nodejs.patch")
sha512sums=('SKIP'
            '7b775171da97a3e7ad44a2b1b319970fd307a88e90a171c49bf70d2382767175e98bb21c7054e38ee6c066bd2dfadf94d28a9ff31d4f21145ec4441caa13c4d7'
	    'f52a204b2879369e230190edb59b3704ae7f7ed8ff41ebfe8e8ffd42c3686148716ee9e04c0ffc417498c44a4a8753f621f7cc2fbfce99171d20c5fe1a0cfc27')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd "${srcdir}/${_pkgname}"
#
#  for s in "${source[@]}"; do
#    case "$s" in (*.patch)
#      cp "../${s}" .
#      patch -p0 < "${s}"
#      rm -f "${s}"
#    esac
#  done
#}

build() {
    cd "${_pkgname}"
    export PYTHON=python2
    ./bin/installDeps.sh
}

package() {
    cd "${_pkgname}"
    echo 'cleaning up unneeded files...'
    rm bin/installOnWindows.bat start.bat bin/buildDebian.sh bin/buildForWindows.sh
    rm -r var bin/deb-src doc tests
    echo 'move files...'
    install -dm 755 "${pkgdir}"/usr/share/webapps/${_pkgname}
    cp -a . "${pkgdir}"/usr/share/webapps/${_pkgname}
    mkdir -p "${pkgdir}"/etc/webapps/${_pkgname}/
    mv "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json "${pkgdir}"/etc/webapps/${_pkgname}/settings.json
    ln -s /etc/webapps/${_pkgname}/settings.json "${pkgdir}"/usr/share/webapps/${_pkgname}/settings.json
    install -Dm644 "${srcdir}"/${_pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${_pkgname}.service
    install -D LICENSE  "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
    echo "setting rights..."
    #touch "${pkgdir}"/usr/share/webapps/etherpad-lite/APIKEY.txt
    find "${pkgdir}"/usr/share/webapps/etherpad-lite \
        \( -type f -exec chmod ug+rw,o+r {} \; \) , \
        \( -type d -exec chmod ug+rwxs,o+rx {} \; \)
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/run.sh
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/installDeps.sh
}

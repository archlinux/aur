pkgname=etherpad-lite-systemd
pkgver=1.5.7
pkgrel=1
pkgdesc="etherpad-lite with systemd socket-activation"
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
source=("etherpad-lite-${pkgver}.tar.gz::https://github.com/ether/etherpad-lite/archive/${pkgver}.tar.gz"
        "etherpad-lite.service"
        "etherpad-lite.socket"
        "socket-activation.patch"
        )
sha512sums=('688205194347f0e4e6f78deb0b189ceaa4f2255efcbaa503d0b6459de8505dd475aa9151399dd818b6cac232bc0b71e5a0fbd6d43f56cb5ce1f9eafcccb3925b'
            '7b775171da97a3e7ad44a2b1b319970fd307a88e90a171c49bf70d2382767175e98bb21c7054e38ee6c066bd2dfadf94d28a9ff31d4f21145ec4441caa13c4d7'
            'e80935acc6f7739b2797fc922a503a2f7b5edda010adcd4be5714a21716545b4472229b6901f0af41cf12552ca71c7bba151667f2501ef9b2f7770cdf7f3d723'
            '542067a2f287d30d6662205de95aba0fe85f0c04d055ee672c17255d4f99abd2e533a57ecd1920a7a3bdde9fceda76050eceaafadd8d64579a1d48fcd2271430')

prepare() {
  cd "$srcdir/etherpad-lite-${pkgver}"
  sed -i "s/9001/19001/" settings.json.template
  patch -p0 -i "$srcdir/socket-activation.patch"
}

build() {
  cd "$srcdir/etherpad-lite-${pkgver}"
  export PYTHON=python2
  ./bin/installDeps.sh
}

package() {
    cd "etherpad-lite-${pkgver}"
    echo 'cleaning up unneeded files...'
    rm bin/installOnWindows.bat start.bat bin/buildDebian.sh bin/buildForWindows.sh
    rm -r var bin/deb-src doc tests
    echo 'move files...'
    install -dm 755 "${pkgdir}"/usr/share/webapps/etherpad-lite
    cp -a . "${pkgdir}"/usr/share/webapps/etherpad-lite
    mkdir -p "${pkgdir}"/etc/webapps/etherpad-lite/
    mv "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json "${pkgdir}"/etc/webapps/etherpad-lite/settings.json
    ln -s /etc/webapps/etherpad-lite/settings.json "${pkgdir}"/usr/share/webapps/etherpad-lite/settings.json
    install -Dm644 "${srcdir}"/etherpad-lite.service "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.service
    install -Dm644 "${srcdir}"/etherpad-lite.socket "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.socket
    install -Dm644 "${srcdir}"/etherpad-lite.service "${pkgdir}"/usr/lib/systemd/system/etherpad-lite.service
    install -D LICENSE  "${pkgdir}"/usr/share/licenses/etherpad-lite/LICENSE
    echo "setting rights..."
    #touch "${pkgdir}"/usr/share/webapps/etherpad-lite/APIKEY.txt
    find "${pkgdir}"/usr/share/webapps/etherpad-lite \
        \( -type f -exec chmod ug+rw,o+r {} \; \) , \
        \( -type d -exec chmod ug+rwxs,o+rx {} \; \)
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/run.sh
    chmod u+x "${pkgdir}"/usr/share/webapps/etherpad-lite/bin/installDeps.sh
}

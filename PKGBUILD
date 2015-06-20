# Maintainer: Lucas Kent <rubickent at gmail dot com>

pkgname=filetimecapsule-git
arch=('any')
pkgver=1
pkgrel=1
md5sums=('SKIP')
depends=('python' 'python-tornado' 'nginx')
license=('GPL3')
makedepends=('git')
source=('git+https://github.com/rukai/FileTimeCapsule.git')
url="http://filetimecapsule.com"
pkgdesc="A webservice for disabling distracting files."

pkgver(){
    cd $srcdir/FileTimeCapsule
    #generate nice pkgver from git repo
    git describe | sed 's/\([^-]*-g\)/r\1/g' | sed 's/-/./g' | sed 's/^v//'
}

prepare(){
    cd $srcdir/FileTimeCapsule
    #let the launch script know where the nginx config file is stored
    sed -i 's|$configPath|/etc/webapps/filetimecapsule/|' run.sh
}

package(){
    dest=$pkgdir/usr/share/webapps/filetimecapsule/
    config=$pkgdir/etc/webapps/filetimecapsule/
    bin=$pkgdir/usr/bin/
    cd $srcdir/FileTimeCapsule/

    install -dm554 $dest
    install -dm554 $config
    install -m554 nginx.conf $config/

    cp -rt $dest backend css fonts graphics js templates gpl-3.0.txt server.py generateDB.py run.sh
    install -dm755 $bin
    ln -rs $dest/run.sh $bin/filetimecapsule
}

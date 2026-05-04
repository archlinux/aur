# Maintainer: Babahong <linux[dot]Troval[at]gmail[dot]com>
# Contributor: IgnorantGuru
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=udevil
pkgver=2026.master
pkgrel=1
pkgdesc="Mount without password (Fixed for CasaOS on Modern Arch)"
arch=('i686' 'x86_64')
url="https://github.com/IgnorantGuru/udevil"
license=('GPL3')
makedepends=('intltool' 'gettext')
depends=('udev' 'glib2')
optdepends=(
    'nfs-utils:  mount nfs shares'
    'sshfs:      mount sftp shares'
    'curlftpfs:  mount ftp shares'
    'cifs-utils: mount samba shares'
    'davfs2:     mount WebDAV shares'
)
conflicts=('udevil' 'devmon' 'devmon-git')
provides=('udevil' 'devmon')
backup=('etc/udevil/udevil.conf' 'etc/conf.d/devmon')
options=(!strip !debug)

source=("https://github.com/IgnorantGuru/udevil/archive/refs/heads/master.zip")
sha256sums=('SKIP')

build() {
    cd "$srcdir/udevil-master"
    
    
    sed -i '1i #include <sys/stat.h>' src/device-info.c
    
    
    sed -i -e "s/finalize(/finalize(int sig/" src/udevil.c
    sed -i -e "s/interrupt(/interrupt(int sig/" src/udevil.c
    
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/udevil-master"
    make DESTDIR="$pkgdir/" install
    
    
    chmod +s "$pkgdir/usr/bin/udevil"
}

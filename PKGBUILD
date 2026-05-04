# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>
# Contributor: alpharde
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=udevil-git
pkgver=2024.master
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

# Menggunakan ZIP dari upstream publik untuk bypass login GitHub
source=("https://github.com/IgnorantGuru/udevil/archive/refs/heads/master.zip")
sha256sums=('SKIP')

build() {
    cd "$srcdir/udevil-master"
    
    # FIX: Tambahkan header untuk fungsi 'stat' agar tidak error saat compile
    sed -i '1i #include <sys/stat.h>' src/device-info.c
    
    # FIX: Penyesuaian signal handling untuk compiler modern
    sed -i -e "s/finalize(/finalize(int sig/" src/udevil.c
    sed -i -e "s/interrupt(/interrupt(int sig/" src/udevil.c
    
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/udevil-master"
    make DESTDIR="$pkgdir/" install
    
    # Set SUID bit agar udevil bisa mount tanpa password (penting untuk CasaOS)
    chmod +s "$pkgdir/usr/bin/udevil"
}

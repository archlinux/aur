# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=filezilla
pkgname=$_pkgname-svn
pkgver=11020
pkgrel=1
pkgdesc='Free, open source FTP, FTPS and SFTP client'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('libfilezilla-svn' 'wxwidgets-gtk3' 'xdg-utils')
makedepends=('subversion' 'pugixml' 'boost')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::svn+https://svn.filezilla-project.org/svn/FileZilla3/trunk")
sha256sums=("SKIP")

prepare() {
    # Complement desktop entry file with key MimeTypes, https://trac.filezilla-project.org/ticket/10724
    cd $_pkgname/data/
    grep --quiet MimeType filezilla.desktop || echo 'MimeType=x-scheme-handler/ftp;' >> filezilla.desktop
}

pkgver() {
    cd $_pkgname
    svnversion | sed 's:M$::'
}

build() {
    cd $_pkgname
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
}

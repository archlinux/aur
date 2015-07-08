# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname='libgxps-git'
pkgver='20120430'
pkgrel='1'
pkgdesc='An XPS Documents library'
arch=('i686' 'x86_64')
url='http://git.gnome.org/browse/libgxps/'
license=('GPL')
depends=('cairo' 'libarchive' 'libtiff')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=('libgxps')
conflicts=('libgxps')

_gitroot='git://git.gnome.org/libgxps'
_gitname='libgxps'

build()
{
    cd "${srcdir}"
    msg 'Connecting to GIT server....'

    if [[ -d "${_gitname}" ]]
    then
        cd "${_gitname}" && git pull origin
        msg 'The local files are updated.'
    else
        git clone "${_gitroot}" "${_gitname}"
    fi

    msg 'GIT checkout done or server timeout'
    msg 'Starting build...'

    rm -rf "${srcdir}/${_gitname}-build"
    git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
    cd "${srcdir}/${_gitname}-build"

    #
    # BUILD HERE
    #
    ./autogen.sh
    ./configure --prefix='/usr' --disable-test
    make -s -j $(nproc)
}

package()
{
    cd "${srcdir}/${_gitname}-build"
    make DESTDIR="${pkgdir}/" install
}

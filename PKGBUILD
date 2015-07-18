# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Darexon <cren331 aT gmailDOTcom>

_srcname=sox
pkgname=${_srcname}-git_p
pkgver=14.4.2.r5.g7e74b25
pkgrel=1
pkgdesc="The Swiss Army knife of sound processing tools (Development version with all optional libraries)"
arch=('i686' 'x86_64')
url="http://sox.sourceforge.net/Main/HomePage"
license=('GPL' 'LGPL')
depends=('libpng' 'file' 'ladspa' 'libltdl' 'libsndfile-git_p' 'libao'
         'gsm' 'opencore-amr' 'lame' 'opusfile' 'twolame' 'libmad'
         'libid3tag' 'wavpack-git_p' 'libpulse')
makedepends=('git')
optdepends=('alsa-lib: for alsa plugin')
checkdepends=('time')
provides=('sox' 'sox-git')
conflicts=('sox' 'sox-git')
source=("${_srcname}::git://sox.git.sourceforge.net/gitroot/sox/sox")
sha256sums=('SKIP')

pkgver() {
  cur_prefix='sox.'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${srcdir}/${_srcname}"
    autoreconf -i
    ./configure --with-distro='Arch Linux' --prefix=/usr    
    make
}


check() {
  cd "${srcdir}/${_srcname}"
  make bindir=. installcheck
}

package() {
    cd "$_srcname"
    make DESTDIR="$pkgdir/" install
    echo -e "\e[0;31mNOTE: You will need to recompile to get plugin support from optional
    dependencies if they weren't already installed when you compiled.\e[0m"
}

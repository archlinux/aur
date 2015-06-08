# Maintainer: Dennis Felsing <defelsing+aur@gmail.com>, Evgenii Sovetkin <e.sovetkin@gmail.com>

pkgname=rdictcc-git
pkgver=20120324
pkgrel=1
pkgdesc="A dictionary / word translator written in Ruby. It uses the dictionaries you can fetch from http://www.dict.cc. RDictCc has a tight integration into Emacs."
arch=('any')
url="https://github.com/tsdh/rdictcc"
license=('GPL3')
depends=('ruby' 'gdbm')
install=rdictcc-git.install
provides=('rdictcc')
conflicts=('rdictcc')

_gitroot=git://github.com/tsdh/rdictcc.git
_gitname=rdictcc

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"

  sed -i "s#-<>]/, ' ').strip.split do |w|#<>-]/, ' ').strip.split do#" rdictcc.rb
  sed -i 's#rdictcc.rb#rdictcc#g' rdictcc.rb
  sed -i 's#/usr/local/bin/rdictcc.rb#/usr/bin/rdictcc#' rdictcc.el
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 rdictcc.rb "$pkgdir/usr/bin/rdictcc"
  install -Dm644 rdictcc.el "$pkgdir/usr/share/emacs/site-lisp/rdictcc.el"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rdictcc/COPYING"
}

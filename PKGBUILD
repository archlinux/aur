# Maintainer: Niels Abspoel <aboe76@gmail.com>
pkgname=reclass-git
_gitname=reclass
pkgver=1.4.1.9.g9c34784
pkgrel=1
pkgdesc="hierarchical inventory backend for configuration management systems (salt, ansible, puppet)"
arch=('i686' 'x86_64')
url="https://reclass.pantsfullofunix.net/"
license=("PerlArtistic")
depends=('python2')
backup=('etc/reclass/reclass-config.yml')
makedepends=('git' 'python2-setuptools')
optdepends=()
options=('zipman')
conflicts=('reclass')
provides=('reclass')

source=("reclass::git+https://github.com/madduck/reclass" 'reclass-config.yml')

#tags="v0.8.0"
#source=("git://github.com/madduck/reclass.git#tag=$tag")

# because the sources are not static, skip checksums
md5sums=('SKIP' 'ad011bd9cf89152b9eaaeebc0862732f')

pkgver() {
  cd "$srcdir/$_gitname"
  # get git version number as pkgversion
  echo $(git describe --always | sed 's/reclass.//g' | sed 's/v//g' | sed 's/-/./g')
}

#build() {
#}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  #create default dir
  mkdir -p $pkgdir/etc/reclass/nodes
  mkdir -p $pkgdir/etc/reclass/classes
  install -Dm644 ${srcdir}/reclass-config.yml ${pkgdir}/etc/reclass/reclass-config.yml

  #examples are usefull
  mkdir -p $pkgdir/usr/share/doc/${_gitname}/examples
  for i in ${srcdir}/${_gitname}/examples/*; do
    cp -R $i ${pkgdir}/usr/share/doc/${_gitname}/examples/"$(basename $i)"
    chown -R root:root ${pkgdir}/usr/share/doc/${_gitname}/examples/"$(basename $i)"
  done

  # remove vcs leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

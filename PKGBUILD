# Maintainer: Niels Abspoel <aboe76@gmail.com>
pkgname=varstack-git
_gitname=varstack
pkgver=c9e6e5e
pkgrel=1
pkgdesc="A tool to create stacked configuration structures"
arch=('i686' 'x86_64')
url="https://github.com/conversis/varstack"
license=("MIT")
depends=('python2' 'python2-yaml' 'python2-simplejson' 'python2-argparse')
backup=('etc/varstack/varstack.yaml')
makedepends=('git')
optdepends=('python2-gnupg')
options=('zipman')
conflicts=('varstack')
provides=('varstack')

source=("git://github.com/conversis/varstack.git" 'varstack.yaml')

# because the sources are not static, skip checksums
md5sums=('SKIP'
         'af2b2b0e0e3e172c6b8c84380d0ebd49')

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
  mkdir -p $pkgdir/etc/varstack/stack
  install -Dm644 ${srcdir}/varstack.yaml ${pkgdir}/etc/varstack/varstack.yaml
  
  #examples are usefull
  mkdir -p $pkgdir/usr/share/doc/${_gitname}/examples
  for i in ${srcdir}/${_gitname}/examples/*; do
    cp -R $i ${pkgdir}/usr/share/doc/${_gitname}/examples/"$(basename $i)"
    chown -R root:root ${pkgdir}/usr/share/doc/${_gitname}/examples/"$(basename $i)"
  done

  # remove vcs leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

# Maintainer: dryes <joswiseman@cock.li>
pkgname='pyrescene-hg'
pkgver=646
pkgrel=2
pkgdesc='pyReScene is a port of ReScene .NET to the Python programming language.'
url='https://bitbucket.org/Gfy/pyrescene'
arch=('any')
license=('MIT' 'GPL' 'Custom')
depends=('python2' 'chromaprint' 'python2-numpy' 'unrar' 'lib32-libstdc++5')
makedepends=('mercurial' 'git')
source=('hg+https://bitbucket.org/Gfy/pyrescene/' 'git://github.com/dryes/rarlinux.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-hg}"
  hg identify -n
}

package() {
  cd "${srcdir}/${pkgname%-hg}"

  cp 'rescene/srr.py' 'rescene/srr.py~'
  sed -i -r 's|(dest=\"rar_executable_dir\",)|\1 default=\"/opt/rarlinux\",|' 'rescene/srr.py'
  python2 'setup.py' install --root="${pkgdir}"
  mv 'rescene/srr.py~' 'rescene/srr.py'

  mkdir -p "${pkgdir}/opt/rarlinux"
  python2 'bin/preprardir.py' "${srcdir}/rarlinux" "${pkgdir}/opt/rarlinux"
  chown -R root:root "${pkgdir}/opt/rarlinux"

  install -D -m755 "awescript/awescript.py" "${pkgdir}/usr/bin/awescript"
}

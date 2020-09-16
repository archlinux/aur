# Maintainer: ichundes <derago@gmail.com>
pkgname='pyrescene-git'
pkgver=0.7.r31.g78e9c0c
pkgrel=2
pkgdesc='pyReScene is a port of ReScene .NET to the Python programming language.'
url='https://github.com/EchterAgo/pyrescene'
arch=('any')
license=('MIT' 'GPL' 'custom')
depends=('python' 'unrar' 'lib32-libstdc++5')
optdepends=('chromaprint')
makedepends=('git')
provides=("pyrescene")
conflicts=("pyrescene")
source=('pyrescene-git::git+https://github.com/EchterAgo/pyrescene.git' 'git+https://github.com/dryes/rarlinux.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"

  cp 'rescene/srr.py' 'rescene/srr.py~'
  sed -i -r 's|(dest=\"rar_executable_dir\",)|\1 default=\"/opt/rarlinux\",|' 'rescene/srr.py'
  python 'setup.py' install --root="${pkgdir}"
  mv 'rescene/srr.py~' 'rescene/srr.py'

  mkdir -p "${pkgdir}/opt/rarlinux"
  python 'bin/preprardir.py' "${srcdir}/rarlinux" "${pkgdir}/opt/rarlinux"
  chown -R root:root "${pkgdir}/opt/rarlinux"
  chmod -R a+x "${pkgdir}/opt/rarlinux"
  # RAR 5.50 breaks pyrescene
  rm "${pkgdir}/opt/rarlinux/2017-08-11_rar550"

  install -Dm755 "awescript/awescript.py" "$pkgdir/usr/bin/awescript"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

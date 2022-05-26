# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Jakub Fišer <kubaCURLYSYMBOLufiseruSMALLPOINTSYMBOlcz>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=vit-git
_pkgname="${pkgname%-git}"
pkgver=2.2.0.r18.ge37a75d
pkgrel=1
pkgdesc="Visual Interactive Taskwarrior full-screen terminal interface (GIT version)"
arch=('any')
url='https://github.com/vit-project/vit'
license=('MIT')
conflicts=('vit')
provides=('vit')
depends=('python'
         'python-tasklib'
         'python-urwid'
         'task')
makedepends=('git'
             'python-setuptools')
source=(git+https://github.com/vit-project/vit.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i -e 's|^REFRESH_SCRIPT=.*|REFRESH_SCRIPT="/usr/share/vit/scripts/vit-external-refresh.sh"|g' scripts/hooks/on-exit-refresh-vit.sh
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 scripts/bash/vit.bash_completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 755 scripts/hooks/on-exit-refresh-vit.sh "${pkgdir}/usr/share/${_pkgname}/scripts/hooks/on-exit-refresh-vit.sh"
  install -Dm 755 scripts/vit-external-refresh.sh "${pkgdir}/usr/share/${_pkgname}/scripts/vit-external-refresh.sh"
  install -Dm 644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

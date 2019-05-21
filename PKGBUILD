# Maintainer:  Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
_pkgname=spaceship-prompt
pkgname=$_pkgname-git
pkgver=LATEST
pkgrel=1
epoch=
pkgdesc="A Zsh prompt for Astronauts"
arch=('any')
url="https://denysdovhan.com/spaceship-prompt/"
license=('MIT')
depends=('zsh')
conflicts=('spaceship-zsh-theme-git'
           'spaceship-prompt')
install="${pkgname}.install"
source=("git+https://github.com/denysdovhan/${_pkgname}.git"
        "$pkgname.install")
md5sums=('SKIP'
         'bd24fc2d741cb12ba49b36742d879f64')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${_pkgname}"

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  find docs -type f -exec install -D -m644 {} "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;

  find lib -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${_pkgname}/{}" \;
  find scripts -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${_pkgname}/{}" \;
  find sections -type f -exec install -D -m644 {} "${pkgdir}/usr/lib/${_pkgname}/{}" \;
  install -D -m644 spaceship.zsh "${pkgdir}/usr/lib/${_pkgname}/spaceship.zsh"
  ln -s spaceship.zsh "${pkgdir}/usr/lib/${_pkgname}/spaceship.zsh-theme"

  install -d "${pkgdir}/usr/local/share/zsh/site-functions/"
  ln -s "/usr/lib/${_pkgname}/spaceship.zsh" "${pkgdir}/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
}

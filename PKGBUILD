# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>

_pkgname=spaceship-prompt
pkgname=$_pkgname-git
pkgver=v4.15.0.r1.gbe826cbe
pkgrel=1
epoch=
pkgdesc="A Zsh prompt for Astronauts"
arch=('any')
url="https://spaceship-prompt.sh/"
license=('MIT')
depends=('zsh')
makedepends=('git')
conflicts=('spaceship-zsh-theme-git' 'spaceship-prompt')
provides=('spaceship-zsh-theme' 'spaceship-prompt')
install="${pkgname}.install"
source=("git+https://github.com/${_pkgname}/${_pkgname}.git"
        "$pkgname.install")
sha256sums=('SKIP'
            '9fb9218c6498c040461d8d7aa416b2eb9241317b5606e74d1ec1caed0709aaf4')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
  install -D -m644 async.zsh "${pkgdir}/usr/lib/${_pkgname}/async.zsh"
  ln -s spaceship.zsh "${pkgdir}/usr/lib/${_pkgname}/spaceship.zsh-theme"

  install -d "${pkgdir}/usr/local/share/zsh/site-functions/"
  ln -s "/usr/lib/${_pkgname}/spaceship.zsh" "${pkgdir}/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
}

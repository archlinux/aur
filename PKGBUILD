# Maintainer: Gordon Schulz <gordon.schulz@gmail.com>

pkgname=('acpilight-git')
_pkgname='acpilight'
pkgver=v1.1.r9.gf54865e
pkgrel=1
pkgdesc='A backward-compatibile xbacklight replacement'
arch=('any')
url="https://gitlab.com/wavexx/${_pkgname}"
license=('GPL')

depends=('python')
makedepends=('git')
provides=("${pkgname[0]}")
conflicts=("${_pkgname}" 'xorg-xbacklight')
install="${pkgname}.install"

source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "${_pkgname}"

    install -Dm755 xbacklight ${pkgdir}/usr/bin/xbacklight
    install -Dm644 xbacklight.1 "${pkgdir}/usr/share/man/man1/xbacklight.1"

    install -Dm644 90-backlight.rules \
        ${pkgdir}/etc/udev/rules.d/90-backlight.rules
}


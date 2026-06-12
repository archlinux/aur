# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=viewmailattachments
# _rev manually incremented, based on https://github.com/akkana/scripts/commits/master/viewmailattachments.py
_rev=14
_git_SHA=e9608e8d96417c8e163d3a688edbf47899c211fd
pkgver=r${_rev}.$(grep -o '^.\{7\}' <<<${_git_SHA})
pkgrel=1
pkgdesc='Show HTML messages in an external browser, including embedded images'
url='https://github.com/akkana/scripts'
arch=('any')
license=('GPL-2.0-or-later')
depends=('python')

source=(${pkgname}.py-${pkgver}::"https://raw.githubusercontent.com/akkana/scripts/${_git_SHA}/${pkgname}.py"
        ${pkgname}_no_private_tab_firefox.r11.patch)
sha256sums=('6982ffb45da1ae69a6bdea73078b94af9702f4fc7950d33bcf193fceb6287132'
            'a9b9be2d477e94d6592d2a5245adc1353a44713dd394474e2965478d817f8155')

prepare() {
  # remove .py suffix from the comments. Script will be installed without this suffix.
  sed "s/viewhtmlmail.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}
  # use this version once upstream accepts pull request https://github.com/akkana/scripts/pull/25/files
  # sed "s/${pkgname}.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}

  # disable private tabs in Firefox
  patch ${pkgname}-${pkgver} <"$srcdir/${pkgname}_no_private_tab_firefox.r11.patch"
}

package() {
  install -Dm755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/${pkgname}"
}

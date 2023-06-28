# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=viewmailattachments
# _rev manually incremented, based on https://github.com/akkana/scripts/commits/master/viewmailattachments.py
_rev=12
_git_SHA=652a6e3c08f42f37d51ddbc2a2cde087b0ae1662
pkgver=r${_rev}.$(grep -o '^.\{7\}' <<<${_git_SHA})
pkgrel=1
pkgdesc='Show HTML messages in an external browser, including embedded images'
url='https://github.com/akkana/scripts'
arch=('any')
license=('GPL2')
depends=('python')

source=(${pkgname}.py-${pkgver}::"https://raw.githubusercontent.com/akkana/scripts/${_git_SHA}/${pkgname}.py"
        ${pkgname}_no_private_tab_firefox.r11.patch)
sha256sums=('cfef3fe8f7f8bba6a8591ce894fc4c7ef991f738f014c8205f46b9992e35b22c'
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

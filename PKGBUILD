# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=viewmailattachments
# _rev manually incremented, based on https://github.com/akkana/scripts/commits/master/viewmailattachments.py
_rev=13
_git_SHA=daa54bdbde809ed3ed0a423b50901b8df181a8a3
pkgver=r${_rev}.$(grep -o '^.\{7\}' <<<${_git_SHA})
pkgrel=1
pkgdesc='Show HTML messages in an external browser, including embedded images'
url='https://github.com/akkana/scripts'
arch=('any')
license=('GPL-2.0-or-later')
depends=('python')

source=(${pkgname}.py-${pkgver}::"https://raw.githubusercontent.com/akkana/scripts/${_git_SHA}/${pkgname}.py"
        ${pkgname}_no_private_tab_firefox.r11.patch)
sha256sums=('2be42094316e866d1b6a3aff2f5c1e8a48cff9f9b36b873b993027698f9c94ee'
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

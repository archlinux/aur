# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=viewmailattachments
_rev=11
_git_SHA=2de88ef1e82cb342e3902d5330ce4feff970eaf9
pkgver=r${_rev}.$(grep -o '^.\{7\}' <<<${_git_SHA})
pkgrel=1
pkgdesc='Show HTML messages in an external browser, including embedded images'
url='https://github.com/akkana/scripts'
arch=('any')
license=('GPL2')
depends=('python')

source=(${pkgname}.py-${pkgver}::"https://raw.githubusercontent.com/akkana/scripts/${_git_SHA}/${pkgname}.py"
        ${pkgname}_no_private_tab_firefox.r${_rev}.patch)
sha256sums=('ca67b340aad69cef42281a2e41240ed3df4013b5ef1bf2e818610767d55b2b22'
            'a9b9be2d477e94d6592d2a5245adc1353a44713dd394474e2965478d817f8155')

prepare() {
  # remove .py suffix from the comments. Script will be installed without this suffix.
  sed "s/viewhtmlmail.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}
  # use this version once upstream accepts pull request https://github.com/akkana/scripts/pull/25/files
  # sed "s/${pkgname}.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}

  # disable private tabs in Firefox
  patch ${pkgname}-${pkgver} <"$srcdir/${pkgname}_no_private_tab_firefox.r${_rev}.patch"
}

package() {
  install -Dm755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/${pkgname}"
}

# Maintainer Joost Bremmer <contact@madeofmagicandowires.online>
pkgbase=shortcut-git
pkgname=('shortcut-pages-git' 'shortcut-pages-extra-git' 'shortcut-c-client-git')
pkgver=0.1.0
pkgrel=1
pkgdesc="A commandline client to list shortcuts"
url="https://github.com/mt-empty/shortcut-c-client"
arch=('x86_64')
license=('unknown')
makedepends=('git')
source=("shortcut-pages::git+https://github.com/mt-empty/shortcut-pages.git"
        "shortcut-c-client::git+https://github.com/mt-empty/shortcut-c-client.git"
        "shortcut-c-client.patch")
sha256sums=('SKIP'
            'SKIP'
            '61511fb1b61e7d07e3819d6bae477537ab14d4acd27490ddab5fa1a121822464')

pkgver() {
  cd "${srcdir}/shortcut-pages"
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
    [ ${PIPESTATUS[0]} -eq 0 ] || \
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/shortcut-c-client"
  patch -Np1 --input "${srcdir}/shortcut-c-client.patch"

}

build() {
  cd "${srcdir}/shortcut-c-client"
  make shortcut
}


package_shortcut-pages-git() {
  pkgname=shortcut-pages-git
  pkgdesc="A collections of keyboard shortcuts for Desktop application and websites"
  url="https://github.com/mt-empty/shortcut-pages"
  arch=('any')
  license=('unknown')
  provides=('shortcut-pages')

  cd "$srcdir/shortcut-pages/GUI"

  install -dvm755 "${pkgdir}/usr/share/shortcut/pages"
  find . -type f -iname "*.md" -exec  \
    install -Dvm644 "{}" "${pkgdir}/usr/share/shortcut/pages/{}" \;
}

package_shortcut-pages-extra-git() {
  pkgname=shortcut-pages-extra-git
  pkgdesc="An extra collection of cheatsheets for nonGUI applications and games"
  url="https://github.com/mt-empty/shortcut-pages"
  arch=('any')
  license=('unknown')
  provides=('shortcut-pages-extra' 'shortcut-pages')

  cd "$srcdir/shortcut-pages/nonGUI"

    install -dvm755 "${pkgdir}/usr/share/shortcut/pages"
    find . -type f -iname "*.md" -not -regex "\.\/\(c\|git\|r\|unity\|\)\.md$" -exec \
      install -Dvm644 "{}" "${pkgdir}/usr/share/shortcut/pages/{}" \;
}

package_shortcut-c-client-git() {
  pkgname="shortcut-c-client-git"
  pkgdesc="A command line client for shortcut-pages"
  url="https://github.com/mt-empty/shortcut-c-client"
  arch=('x86_64')
  license=('unknown')
  depends=('shortcut-pages')
  optdepends=('shortcut-pages-extra')
  provides=('shorcut')

  cd "$srcdir/shortcut-c-client"
  install -Dvm755 shortcut "${pkgdir}/usr/bin/shortcut"
}

# vim: set ts=2 sts=2 sw=2 et:

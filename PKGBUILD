# Maintainer: Hans-Nikolai Viessmann <hans at viess dot mn>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois . archlinux . org>

pkgname=tllocalmgr-git
_pkgname='texlive-localmanager'
pkgver=v0.7.r3.gbbd8488
pkgrel=4
pkgdesc='A shell and command-line utility to manage TeXLive on Arch Linux'
arch=('any')
url='https://git.archlinux.org/users/remy/texlive-localmanager.git/'
license=('GPL')
provides=("texlive-localmanager=$pkgver")
conflicts=('texlive-localmanager'
           'texlive-localmanager-git')
depends=('texlive-core>=2011'
         'perl-libwww'
         'perl-term-shellui'
         'perl-term-readline-gnu'
         'perl-list-moreutils'
         'perl-lwp-protocol-https')
makedepends=('git')

source=("${_pkgname}::git+http://git.archlinux.org/users/remy/texlive-localmanager.git"
        'tllocalmgr-enhance.patch'
        'tllocalmgr-fix-texlive-local-match.patch')
sha256sums=('SKIP'
            '22222ff329919ee6a16ffd489b0213b14f8169d9daf6ef1a82aa5ab37538c236'
            'a7698d0076f4e1a7ef401899c174ed9a290674a7e89e9c818ba078e17548c6e7')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # enhances the tllocalmgr script a bit
  # thanks: @sharethewisdom and @cobaltspace
  patch -p1 < "$srcdir/tllocalmgr-enhance.patch"

  # fix missing exclusion of matches for texlive local packages
  # thanks: @CaptainBern
  patch -p1 < "$srcdir/tllocalmgr-fix-texlive-local-match.patch"
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/usr/"{bin,share/texmf/arch/tlpkg/TeXLive}
  install -m755 tllocalmgr "$pkgdir/usr/bin/"
  cd tlpkg/TeXLive
  for _f in *; do
    install -m644 "$_f" "$pkgdir/usr/share/texmf/arch/tlpkg/TeXLive/"
  done
}

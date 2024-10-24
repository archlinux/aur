# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

pkgname="gtypist"
pkgver=2.9.5
pkgrel=8
pkgdesc="Universal typing tutor"
arch=('x86_64')
url="http://www.gnu.org/software/gtypist/gtypist.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses' 'perl')
makedepends=('help2man')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://ftp.gnu.org/gnu/${pkgname}/${_pkgsrc}.tar.gz"
        "${_pkgsrc}.tar.gz.sig::https://ftp.gnu.org/gnu/${pkgname}/${_pkgsrc}.tar.gz.sig"
        "${pkgname}_fix_spelling.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-4/debian/patches/802270_spelling_errors.patch"
        "${pkgname}_fix_vim_support.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-4/debian/patches/220581_gtypist_vim_support.patch"
        "${pkgname}_fix_manpages.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-4/debian/patches/fix_manual_page_issues.patch"
        "${pkgname}_fix_implicit_function_declaration.patch::https://sources.debian.org/data/main/${pkgname::1}/${pkgname}/${pkgver}-4/debian/patches/1066641-fix-implicit-function-declarations.patch"
	      "${pkgname}_fix_ncurses.patch")
sha256sums=('4059be9585683bbb84757dd4bbafa8ff4ecda2ed9eecd4e7594365843f05a266'
            'SKIP'
            '0ce69a946b6e5867c2ed2a00cc056b3c2f5e66b4fbe8d9ff4d580bd0a5d75364'
            'ff3627b471942e4deaec789f627830e8d5a436a5cac0271d5cdd65b70e952e63'
            'f1b5912377548f91ee887ec1f29ee630154c4274b79d458a1a7d10ddc2bd39c4'
            'bfe901464519877a737246e195a7e04b2d961a4f3b5b8ef6d59fa1740b8eeafa'
            'c4d7b942aafb2e9262683083662328f770565ce71c0ca11d3e99065a60925945')
validpgpkeys=("F8F09C0B79F90A20F953FB1CA6D813D8C94AFA52") # Tim Marston <edam@waxworlds.org>

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}" --batch || true
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --prefix='/usr'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make prefix="${pkgdir}/usr" install

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "QUESTIONS" "${pkgdir}/usr/share/doc/${pkgname}/QUESTIONS"
  install -Dm644 "THANKS"    "${pkgdir}/usr/share/doc/${pkgname}/THANKS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

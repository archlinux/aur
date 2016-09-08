# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: icasdri <icasdri at gmail dot com>

_pkgname=diff-so-fancy
pkgname=${_pkgname}-git
pkgver=0.11.1.r5.g3dd2580
pkgrel=1
pkgdesc="Good-looking diffs with diff-highlight and more (git version)"
arch=(any)
url="https://github.com/stevemao/diff-so-fancy"
license=('MIT')
depends=('git')
provides=('diff-so-fancy')
conflicts=('diff-so-fancy')
install="${pkgname}.install"
source=("git+${url}.git"
        "system-diff_highlight.patch")
sha1sums=('SKIP'
          'dc36f4fe31891e2b802668877a4b26868a6931c5')


pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${_pkgname}"

    sed -i 's/libexec/lib/g' diff-so-fancy readme.md
    mv libexec lib

    patch -p1 -i ${srcdir}/system-diff_highlight.patch

    sed -i 's|$(get_script_dir)/lib/diff-so-fancy.pl|/usr/share/diff-so-fancy/diff-so-fancy.pl|' diff-so-fancy
}

package() {
    cd "${_pkgname}"

    install -Dm755 'diff-so-fancy' "$pkgdir"/usr/bin/diff-so-fancy
    install -Dm755 'lib/diff-so-fancy.pl' "$pkgdir"/usr/share/diff-so-fancy/diff-so-fancy.pl

    install -Dm644 readme.md "$pkgdir"/usr/share/doc/diff-so-fancy/readme.md
}

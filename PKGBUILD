# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's font sets for scripts, and the fonts that the frits (font set
# files) of vtium's packages name, as dependencies on Arch's own font
# packages (ADR-1500 D8). The package installs no font. It installs nine
# frits into /etc/vtium/fonts, beside the frits each console package
# installs there, and each console package lists vtium-fonts as an optional
# dependency, so the fonts stay optional. The glyph helper finds each font
# among the fonts installed on the machine, and leaves out a font the
# machine lacks.
#
# The nine frits come from a release tag of vtium, so the recipe is a
# release recipe: bump-release moves its _tag with the other release
# recipes. The maintainer signs the tag with the PGP key in validpgpkeys,
# and makepkg checks the tag's signature before it builds. Import the key
# once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
#
# The frits for scripts, which vtium's docs/fonts-for-scripts.md describes:
#
#   - arabic, hebrew, indic, thai-lao and vietnamese: the five frits for
#     scripts whose marks need room above and below the letters.
#   - cjk-sc, cjk-tc, cjk-jp and cjk-kr: the four frits for Chinese,
#     Japanese and Korean, one for each region's forms of Han.
#
# The fonts:
#
#   - ttf-jetbrains-mono: JetBrains Mono, which the desktop frit draws text
#     with.
#   - ttf-nerd-fonts-symbols-mono: Symbols Nerd Font Mono, the symbols that
#     the desktop, minspec-16 and minspec-8 frits draw.
#   - noto-fonts-emoji: Noto Color Emoji, the emoji the same three frits
#     draw.
#   - terminus-font: the console font ter-v16n, which the terminus frit
#     draws.
#   - noto-fonts: Noto Sans Mono, which the nine frits for scripts draw
#     Latin text with, and the Noto font for each script of the five frits
#     for scripts with marks.
#   - noto-fonts-cjk: Noto Sans CJK, whose SC, TC, JP and KR faces the four
#     CJK frits draw.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgname=vtium-fonts
_tag=v0.1.0-alpha.8
pkgver=0.1.0alpha.8
pkgrel=1
pkgdesc='vtium font sets for scripts, and the fonts the vtium font sets name'
arch=('any')
url='https://github.com/vtium/vtium'
license=('MIT')
depends=('noto-fonts' 'noto-fonts-cjk' 'noto-fonts-emoji' 'terminus-font'
         'ttf-jetbrains-mono' 'ttf-nerd-fonts-symbols-mono')
makedepends=('git')
# The nine frits make install-fonts stages, which keep a user's edits
# across an upgrade.
backup=('etc/vtium/fonts/arabic.vtfrit'
        'etc/vtium/fonts/hebrew.vtfrit'
        'etc/vtium/fonts/indic.vtfrit'
        'etc/vtium/fonts/thai-lao.vtfrit'
        'etc/vtium/fonts/vietnamese.vtfrit'
        'etc/vtium/fonts/cjk-sc.vtfrit'
        'etc/vtium/fonts/cjk-tc.vtfrit'
        'etc/vtium/fonts/cjk-jp.vtfrit'
        'etc/vtium/fonts/cjk-kr.vtfrit')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

# vtium's Makefile stages the nine frits in /etc/vtium/fonts, so which frit
# the package ships lives in vtium's tree (ADR-1500 D1, D3). make
# install-fonts builds nothing, so the package needs no cargo. The frits
# stay in /etc whatever PREFIX is, because vtium reads its frits from
# /etc/vtium alone.
# The recipe installs vtium's LICENSE and COPYING itself, since make
# install-fonts stages the frits alone. COPYING holds the notices for the
# authors and the third-party code and data vtium builds in.
package() {
  make -C "$srcdir/vtium" PREFIX=/usr install-fonts DESTDIR="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/vtium/LICENSE" "$srcdir/vtium/COPYING"
}

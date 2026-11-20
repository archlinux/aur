# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's catalog of font sets, and the fonts those sets draw with. A font
# set (a frit, a .vtfrit file) lists the fonts that vtium draws a console
# with, in order, and adds layers (.vtlayer files) that bring in the fonts
# for a script, for icons or for emoji. Each console package installs a few
# sets and layers of its own and lists vtium-fonts as an optional
# dependency. vtium-fonts installs the rest of the catalog beside them.
#
# The package provides each font that a set names in the way that suits the
# font. Where Arch packages the font, the recipe depends on that package.
# Where Arch does not, the recipe carries a copy of the upstream file,
# pinned by its URL and SHA-256, whose license lets anyone pass it on. It
# installs those copies in /usr/share/fonts/vtium, unchanged apart from
# Unscii-8, which upstream publishes in a form the font helper does not read
# and which the recipe converts to BDF. The font helper looks for a font
# that a set names by its family in /usr/share/fonts and
# /usr/local/share/fonts, and opens a font that a set names by its path at
# that path. It leaves out a font the machine lacks, and the next source
# that holds a character draws it. vtium draws a font only once the person
# activates it with vtium-config, so the fonts this package brings wait for
# that step.
#
# The sets come from a release tag of vtium, so the recipe is a release
# recipe: bump-release moves its _tag with the other release recipes. The
# maintainer signs the tag with the PGP key in validpgpkeys, and makepkg
# checks the tag's signature before it builds. Import the key once:
# gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
#
# The dependencies, and the sets and layers that draw with each one:
#
#   - kbd: the console fonts default8x16, sun12x22, cp865-8x16 and
#     cp865-8x8, which the console sets and the classic set sun-gallant
#     draw.
#   - terminus-font: the console font ter-i32b, which the console set
#     linux-ter-16x32 draws.
#   - adobe-source-code-pro-fonts, ttf-cascadia-code, ttf-dejavu,
#     ttf-fira-code, ttf-hack, ttf-ibm-plex and ttf-monoid: Source Code Pro,
#     Cascadia Code, DejaVu Sans Mono, Fira Code, Hack, IBM Plex Mono and
#     Monoid, which the code sets of the same names draw text with.
#   - ttf-jetbrains-mono: JetBrains Mono, which the set jetbrains-mono that
#     the console packages install draws text with.
#   - noto-fonts-emoji: Noto Color Emoji, the emoji of the layers noto-emoji
#     and noto-emoji-small.
#   - noto-fonts: Noto Sans Mono, which the script sets draw Latin text
#     with, and the Noto fonts of the layers arabic, hebrew, indic and
#     thai-lao.
#
# The optional dependencies are fonts that the recipe neither depends on
# nor carries:
#
#   - noto-fonts-cjk: Noto Sans CJK, 299 MiB, whose SC, TC, JP and KR faces
#     only the four CJK layers draw.
#   - ttf-nerd-fonts-symbols-mono: Symbols Nerd Font Mono, the Powerline and
#     Nerd Fonts icons of the layers nerd-symbols and nerd-symbols-small.
#   - the seven Nerd Fonts builds that the sets in the nerd folder draw text
#     and icons with.
#
# Every Nerd Fonts build, Symbols Nerd Font Mono included, holds the Font
# Logos icons, which carry no license, so the recipe carries none of them.
# Without its optional font, a set still draws: its Han, kana and Hangul
# come from Unifont, each Nerd Fonts icon that none of its other sources
# holds is a hollow box, and a Nerd Fonts set draws its text from Unifont.
#
# The fonts the recipe carries, each in /usr/share/fonts/vtium:
#
#   - Px437_IBM_VGA_9x16.ttf, Px437 IBM VGA 9x16 from the Ultimate Oldschool
#     PC Font Pack 2.2, which the classic set ibm-vga names by its family.
#     The pack is a zip of 15 MB, and prepare() takes the font and the
#     pack's license out of it.
#   - Glass_TTY_VT220.ttf, Glass TTY VT220 1.3, which the classic set
#     dec-vt220 names by its family.
#   - Tiny5Mono.bdf, Tiny5 Mono 3.000, the font of the small set tiny5.
#     tiny5 opens the file at /usr/local/share/fonts/misc/Tiny5Mono.bdf, in
#     a folder that belongs to the machine's administrator and that no
#     package installs into, so tiny5 does not find this copy.
#   - unscii-8.bdf, Unscii-8 2.1, the font of the set unscii-icons that the
#     console packages install. Upstream publishes Unscii-8 as a .hex file,
#     which the font helper does not read, so build() converts it to BDF
#     with upstream's own script and command line, as upstream's Makefile
#     builds its PCF font. The script, hex2bdf.pl, comes from upstream's
#     source archive unscii-2.1-src.tar.gz and needs only perl. The archive
#     does not hold unscii-8.hex itself, so the recipe downloads both.
#     viznut.fi's https certificate fails to verify, so both files come
#     over http, and their SHA-256 pins protect them.
#
# NOTICES.txt names every font that a set of the catalog names, with its
# source, version, copyright line, license, and Reserved Font Name or the
# attribution its license asks for. The package installs it in
# /usr/share/licenses/vtium-fonts, beside the full text of each license of
# what the package carries.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).
#
# References:
# - ADR-1204 D8: how each font reaches the machine, the fonts the recipe
#   depends on, carries or leaves optional, the notices file and the
#   license field.
# - ADR-1204 D9: vtium-fonts installs the catalog apart from the sets and
#   layers the console packages install.
# - ADR-1205 D4: a font draws only once it is active, and the fonts of
#   vtium-fonts wait until the person activates them.

pkgname=vtium-fonts
_tag=v0.1.0-alpha.10
pkgver=0.1.0alpha.10
pkgrel=2
pkgdesc='vtium font set catalog, and the fonts its font sets draw with'
arch=('any')
url='https://github.com/vtium/vtium'
# The licenses of what the package itself holds: MIT for the font sets and
# layers, CC-BY-SA-4.0 for Px437 IBM VGA 9x16, the Unlicense for Glass TTY
# VT220, OFL-1.1 for Tiny5 Mono, and the public domain for Unscii-8. The
# fonts it depends on keep their licenses in their own packages, and
# NOTICES.txt names them.
license=('MIT' 'CC-BY-SA-4.0' 'OFL-1.1' 'Unlicense' 'LicenseRef-Public-Domain')
depends=('adobe-source-code-pro-fonts' 'kbd' 'noto-fonts' 'noto-fonts-emoji'
         'terminus-font' 'ttf-cascadia-code' 'ttf-dejavu' 'ttf-fira-code'
         'ttf-hack' 'ttf-ibm-plex' 'ttf-jetbrains-mono' 'ttf-monoid')
optdepends=('noto-fonts-cjk: Noto Sans CJK, for the sets noto-cjk-jp, noto-cjk-kr, noto-cjk-sc and noto-cjk-tc'
            'ttf-cascadia-code-nerd: CaskaydiaCove Nerd Font Mono, for the set caskaydia-cove'
            'ttf-firacode-nerd: FiraCode Nerd Font Mono, for the set fira-code-nerd'
            'ttf-hack-nerd: Hack Nerd Font Mono, for the set hack-nerd'
            'ttf-jetbrains-mono-nerd: JetBrainsMono Nerd Font Mono, for the set jetbrains-mono-nerd'
            'ttf-monoid-nerd: Monoid Nerd Font Mono, for the set monoid-nerd'
            'ttf-nerd-fonts-symbols-mono: Symbols Nerd Font Mono, for the icons of the layers nerd-symbols and nerd-symbols-small'
            'ttf-sourcecodepro-nerd: SauceCodePro Nerd Font Mono, for the set sauce-code-pro'
            'ttf-terminus-nerd: Terminess Nerd Font Mono, for the set terminess')
# perl runs Unscii's hex2bdf.pl in build().
makedepends=('git' 'perl')
# The sets and layers that make install-fonts installs. pacman keeps a
# user's edits to these files when it upgrades the package.
backup=('etc/vtium/fonts/classic/dec-vt220.vtfrit'
        'etc/vtium/fonts/classic/ibm-vga.vtfrit'
        'etc/vtium/fonts/classic/sun-gallant.vtfrit'
        'etc/vtium/fonts/code/cascadia-code.vtfrit'
        'etc/vtium/fonts/code/dejavu-sans-mono.vtfrit'
        'etc/vtium/fonts/code/fira-code.vtfrit'
        'etc/vtium/fonts/code/hack.vtfrit'
        'etc/vtium/fonts/code/ibm-plex-mono.vtfrit'
        'etc/vtium/fonts/code/monoid.vtfrit'
        'etc/vtium/fonts/code/source-code-pro.vtfrit'
        'etc/vtium/fonts/console/default8x16.vtfrit'
        'etc/vtium/fonts/console/linux-sun-12x22.vtfrit'
        'etc/vtium/fonts/console/linux-sun-8x16.vtfrit'
        'etc/vtium/fonts/console/linux-ter-16x32.vtfrit'
        'etc/vtium/fonts/console/linux-vga-8x16.vtfrit'
        'etc/vtium/fonts/console/linux-vga-8x8.vtfrit'
        'etc/vtium/fonts/layers/arabic.vtlayer'
        'etc/vtium/fonts/layers/cjk-jp.vtlayer'
        'etc/vtium/fonts/layers/cjk-kr.vtlayer'
        'etc/vtium/fonts/layers/cjk-sc.vtlayer'
        'etc/vtium/fonts/layers/cjk-tc.vtlayer'
        'etc/vtium/fonts/layers/hebrew.vtlayer'
        'etc/vtium/fonts/layers/indic.vtlayer'
        'etc/vtium/fonts/layers/thai-lao.vtlayer'
        'etc/vtium/fonts/nerd/caskaydia-cove.vtfrit'
        'etc/vtium/fonts/nerd/fira-code-nerd.vtfrit'
        'etc/vtium/fonts/nerd/hack-nerd.vtfrit'
        'etc/vtium/fonts/nerd/jetbrains-mono-nerd.vtfrit'
        'etc/vtium/fonts/nerd/monoid-nerd.vtfrit'
        'etc/vtium/fonts/nerd/sauce-code-pro.vtfrit'
        'etc/vtium/fonts/nerd/terminess.vtfrit'
        'etc/vtium/fonts/scripts/noto-arabic.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-jp.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-kr.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-sc.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-tc.vtfrit'
        'etc/vtium/fonts/scripts/noto-hebrew.vtfrit'
        'etc/vtium/fonts/scripts/noto-indic.vtfrit'
        'etc/vtium/fonts/scripts/noto-thai-lao.vtfrit'
        'etc/vtium/fonts/scripts/noto-vietnamese.vtfrit'
        'etc/vtium/fonts/small/tiny5.vtfrit')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed"
        'https://int10h.org/oldschool-pc-fonts/download/oldschool_pc_font_pack_v2.2_linux.zip'
        'https://github.com/svofski/glasstty/raw/845410289199833ca0d5d7697d06e1780bfe3715/Glass_TTY_VT220.ttf'
        'glasstty-LICENSE::https://github.com/svofski/glasstty/raw/845410289199833ca0d5d7697d06e1780bfe3715/LICENSE'
        'https://github.com/Gissio/font_Tiny5Mono/raw/7d30f9e887fdb29e0b951e92493822afba5f70a7/fonts/bdf/Tiny5Mono.bdf'
        'http://viznut.fi/unscii/unscii-8.hex'
        'http://viznut.fi/unscii/unscii-2.1-src.tar.gz'
        'NOTICES.txt')
noextract=('oldschool_pc_font_pack_v2.2_linux.zip')
sha256sums=('SKIP'
            'b30dc3ecc9931ad2dd8be7517dd01813c8834a1911b582ab7643191b41a3d759'
            'cc4d515abd736808f429f2df2fe950b6c13468c7a889a7032d074aa05f246958'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd'
            '33a935687277817534ddcc1decf586d977cee211550f611ba4bb4365e99755d3'
            '03094f7fbab7085cf6a6b624cee61e47e71ce5d0c2f308c2f4436afdc17f776c'
            '4d1215d495e49d005ae70828ec1529e997049b9a7f152b9439d78c7e70c65b57'
            '7f3ce15babc1dd773537a78b9f108a0ddb80146ce7049cad22143999e62dee78')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

# prepare() takes Px437 IBM VGA 9x16 and the pack's license, LICENSE.TXT,
# out of the font pack's zip into px437/, and leaves the pack's other fonts
# in the zip.
prepare() {
  mkdir -p "$srcdir/px437"
  bsdtar -xf "$srcdir/oldschool_pc_font_pack_v2.2_linux.zip" -C "$srcdir/px437" \
    'ttf - Px (pixel outline)/Px437_IBM_VGA_9x16.ttf' LICENSE.TXT
}

# build() converts Unscii-8 from upstream's .hex file to BDF with the
# command that upstream's Makefile runs for unscii-8.pcf, which then pipes
# the BDF font to bdftopcf. The script reads the hex file on its standard
# input and writes the BDF font to its standard output, and it opens no
# other file. It keeps the glyphs from U+0000 to U+FFFF and leaves out the
# 351 glyphs above them, most of them Symbols for Legacy Computing, as
# upstream's own PCF font does. The font names upstream's version, 2.1, and
# the variant 8, and its COPYRIGHT property is empty, because the command
# passes no copyright string. The script prints a warning from perl's
# Getopt::Long, because its short options -v and -V collide. The long
# options that the recipe passes parse as they should.
build() {
  cd "$srcdir/unscii-2.1-src"
  ./hex2bdf.pl --version=2.1 --variant='8' --rows=8 < "$srcdir/unscii-8.hex" \
    > "$srcdir/unscii-8.bdf"
}

# make install-fonts installs the sets of the category folders classic,
# code, console, nerd, scripts and small in vtium's
# crates/vtium-config/frits into the folder of the same name under
# /etc/vtium/fonts, and the layers of its layers folder into
# /etc/vtium/fonts/layers. It leaves out every set and layer that a console
# package installs, so pacman can install vtium-fonts beside any console
# package without two packages owning one file. Which sets the package
# ships is therefore decided in vtium's tree. make install-fonts builds
# nothing, so the package needs no cargo. The sets stay in /etc whatever
# PREFIX is, because vtium reads its font sets from /etc/vtium/fonts.
#
# The recipe then installs the fonts it carries, and the licenses: vtium's
# LICENSE and COPYING, which holds vtium's own notices, NOTICES.txt, and
# the text of each license of a carried font under the name of its SPDX
# identifier. The OFL's text is the one vtium-font keeps beside its own
# fonts. Unscii-8 has no license text, because it is in the public domain,
# so the recipe installs unscii.txt from upstream's source archive, whose
# introduction states that. The license texts of the fonts in other
# packages stay with those packages.
package() {
  make -C "$srcdir/vtium" PREFIX=/usr install-fonts DESTDIR="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/fonts/vtium" \
    "$srcdir/px437/ttf - Px (pixel outline)/Px437_IBM_VGA_9x16.ttf" \
    "$srcdir/Glass_TTY_VT220.ttf" "$srcdir/Tiny5Mono.bdf" \
    "$srcdir/unscii-8.bdf"
  local licenses="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 -t "$licenses" \
    "$srcdir/vtium/LICENSE" "$srcdir/vtium/COPYING" "$srcdir/NOTICES.txt"
  install -Dm644 "$srcdir/px437/LICENSE.TXT" "$licenses/CC-BY-SA-4.0.txt"
  install -Dm644 "$srcdir/glasstty-LICENSE" "$licenses/Unlicense.txt"
  install -Dm644 "$srcdir/vtium/crates/vtium-font/data/OFL-1.1.txt" \
    "$licenses/OFL-1.1.txt"
  install -Dm644 "$srcdir/unscii-2.1-src/unscii.txt" "$licenses/unscii.txt"
}

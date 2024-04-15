# Maintainer:
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

_ALL_OFF="$(tput sgr0)"
_BOLD="${ALL_OFF}$(tput bold)"
_BLACK="${BOLD}$(tput setaf 0)"
_BLUE="${BOLD}$(tput setaf 4)"
_CYAN="${BOLD}$(tput setaf 6)"
_GREEN="${BOLD}$(tput setaf 2)"
_MAGENTA="${BOLD}$(tput setaf 5)"
_RED="${BOLD}$(tput setaf 1)"
_WHITE="${BOLD}$(tput setaf 7)"
_YELLOW="${BOLD}$(tput setaf 3)"

notice() {
  printf "${_WHITE} $1${_ALL_OFF}\n"
}

>&2 echo
>&2 notice 'Abricotine development and support ceased in July 2023.'
>&2 notice 'The developer recommends using a different editor because'
>&2 notice 'Abricotine "hasn'\''t evolved in years and some dangerous'
>&2 notice 'bugs have recently been reported"'
>&2 notice
>&2 notice 'https://github.com/brrd/abricotine/issues/347'

for i in {1..5} ; do
  >&2 sleep 1
  >&2 echo -n '. '
done
>&2 echo

pkgname=abricotine
pkgver=1.1.4
pkgrel=2
pkgdesc="A markdown editor with inline preview (discontinued)"
url="https://github.com/brrd/Abricotine/issues/347"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'libnotify' # notify-send
  'libxss'
)
makedepends=(
  'npm'
  'nodejs'
)

_pkgsrc="abricotine-${pkgver}"
source=(
  "$_pkgsrc.tar.gz"::"https://github.com/brrd/abricotine/archive/${pkgver}.tar.gz"
  "abricotine.desktop"
  "abricotine.sh"
)
sha256sums=(
  '1c1fd67770a75e3fc8cae00a8c8151c6914b7b886a295844075c5039837824dd'
  '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c'
  'fe52b9b8331f6e5cc9fe95eb8de40bf40958fc38c26505fdd4d896b9055b1f25'
)

install="abricotine.install"

build() {
  cd "$_pkgsrc"

  npm install --cache ../cache --devdir="${srcdir}/devdir"
  npm run pack --cache ../cache --devdir="${srcdir}/devdir"
}

package() {
  cd "$_pkgsrc"

  install -d "${pkgdir}/opt/abricotine"
  cp -r dist/linux-unpacked/* "${pkgdir}/opt/abricotine"

  install -Dm755 "../abricotine.sh" "${pkgdir}/usr/bin/abricotine"

  install -Dm644 "../abricotine.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "icons/abricotine@2x.png" "${pkgdir}/usr/share/pixmaps/abricotine.png"
}

# vim:set ts=2 sw=2 et:

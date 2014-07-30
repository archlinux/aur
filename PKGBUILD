# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Swift Geek <swift geek ɐt gmɐil dot com >

# pre-parse
  # Fetching the pretty repos. This should possibly be a bit more
  # intelligent, such that it will remove orphaned repos.

if [ -x /usr/bin/curl ]; then
  PRETTY_REPOS=(`curl -s https://api.github.com/orgs/KiCad/repos?per_page=2000 2> /dev/null \
    | grep full_name | grep pretty \
    | sed -r  's:.+ "KiCad/(.+)",:\1:'`)
  PRETTY_SRC=(${PRETTY_REPOS[@]/%/.git})
  PRETTY_SRC=(${PRETTY_SRC[@]/#/git+https://github.com/KiCad/})
fi

pkgname=kicad-pretty-git
pkgver=a # 0 > a    and git revision can start from letter
pkgrel=1
pkgdesc="KiCad .pretty repos. Theese are the new footprint library."
arch=('any')
url="https://github.com/KiCad"
license=('GPL')
makedepends=('git' 'curl')
options=('!strip')
install='kicad.install'
source=('https://raw.githubusercontent.com/KiCad/kicad-library/master/template/fp-lib-table.for-pretty')
source+=(${PRETTY_SRC[@]})

md5sums=('SKIP')
for (( i=0; i<${#PRETTY_REPOS[@]}; i++ )); do
  md5sums+=('SKIP')
done
unset PRETTY_SRC

pkgver() {
  # TODO: use API for getting current revision in master branch
  PKGVER="$(curl -s "https://api.github.com/repos/KiCad/kicad-library/commits/master" 2> /dev/null | grep -m1 sha)"
  PKGVER="${PKGVER%\"*}"
  PKGVER="${PKGVER##*\"}"
  echo "${PKGVER:0:7}"
}

package() {
  cd "$srcdir"

  #echo "${PRETTY_REPOS[@]}"

  install -d "$pkgdir/usr/share/kicad/footprints"

  for repo in ${PRETTY_REPOS[@]}; do
    install -d "$pkgdir/usr/share/kicad/footprints/$repo/"
    cp -r "$srcdir/$repo/"* "$pkgdir/usr/share/kicad/footprints/$repo/" # change to install?
  done

  mv $(readlink -f "${srcdir}/fp-lib-table.for-pretty") "$pkgdir/usr/share/kicad/footprints/fp-lib-table" # Check chmods, change to install?

  install -d "$pkgdir/etc/profile.d"
  echo "export KISYSMOD=/usr/share/kicad/footprints" > "$pkgdir/etc/profile.d/kicad-pretty-git.sh"
}

# vim:set ts=2 sw=2 et:

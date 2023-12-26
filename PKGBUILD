# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: John McKnight <jmcknight@gmail.com>

pkgname=monkey-bubble
pkgver=0.4.0.r989.g3f15c50
pkgrel=1
_commit=3f15c50cce35567f00d7335467ad318411eb4cfe
_repourl='https://github.com/sudheesh001/monkey-bubble'
pkgdesc="A Puzzle Bobble clone for one or two players"
arch=('i686' 'x86_64')
url='https://screenshots.debian.net/package/monkey-bubble'
license=('GPL')
depends=(
  'gconf'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'hicolor-icon-theme'
  'libcanberra'
  'librsvg'
  'libxml2'
  'pango'
# 'yelp'              # Only needed if makedepends=gnome-doc-utils was used to build the help files.
)
makedepends=(
  'git'
  'gnome-common'
# 'gnome-doc-utils'   # Only needed to build the help files; this tool has been broken for years on AUR.
)
backup=('var/games/monkey-bubble.scores')
# Patches forked from Ubuntu's redistribution of Debian packaging addons:
# http://archive.ubuntu.com/ubuntu/pool/universe/m/monkey-bubble/
# http://archive.ubuntu.com/ubuntu/pool/universe/m/monkey-bubble/monkey-bubble_0.4.0-0ubuntu12.debian.tar.gz
source=(
  "${pkgname}::git+${_repourl}.git#commit=${_commit}"
  '010-fix-format-safety.patch'
  '020-fix-no-copy-dt-needed.patch'
# '030-unused-variables.patch'      # Debian's patch doesn't fully apply to github/sudheesh001/monkey-bubble master
  '035-remove-unused-ui-network-server-StatusJob-struct.patch'
  '040-desktop-fixes.patch'
  '050-only-include-glib.h.patch'
  '060-fix-libm-linking.patch'
)
b2sums=('SKIP'
        'f88c93e5de249eb0723d35d034e4e4b6cbe09ff5c31616504bc3855b830ce7a0f15d3f1d633b7b17b35d66bb7e22368e53452f1ef3f4791394bf70c438d65cf2'
        'bd458b7af175c555d5ff44e530575c71ee1fa6b9238665802fa50fe1bf3cdfe2079f33e923cc22d2a967858f280524f7174caf940b9b8a7940c64a84928d8f92'
        'b944ff1ee1826285f56cf50f30fad442f59debfc9e957c4bf9a4691d3559a5ce58ce9accb452e798201787186058c1920054aa2cae0b6f60d442a3b4494f2bae'
        'ecf40be671aab0db73100f72aa30ed0a54658e03588ddb5572d5115eeaea2c6fdf0a966ce011f0e866e95bcb6f9dc82311cae280b847e300f6d2a01cb1a5f98f'
        '67764f9b3f859587b7284a56d3ee71fe4cb71a0b63e22786a0081edb2520aaa7c20061e7ba61cbb3c196a403c2429cec00618fe90c51c0273ab335dd7faf96af'
        'c5fd916fa6c362b613ba12b1f92e2774ca1b6a33e302b7a57c8bba8dc07b9b0f94ce36a8dae84485de70daa3fad0f2ceddf301e3ab008f2a492c4f425e014e6e')

prepare() {
  cd "${pkgname}"

  echo 'Reverting commit: "76be7756854e57fcfccdb2c9bc81cb41930b9ce4"...'
  echo '(The Gtk3 port is broken with curren Gtk3 version.)'
  (
    cd "${_pkgbase}"
    git revert --no-commit 76be7756854e57fcfccdb2c9bc81cb41930b9ce4
  )

  for _patchfile in ../*.patch
  do
    echo "[patch] Applying ${_patchfile}..."
    patch --force --forward --strip=1 --input="../${_patchfile}"
  done

  echo "Disabling Werror: don't treat warnings as errors."
  export CFLAGS+=" -Wno-error"

  echo "Adding LDFLAGS vaues to CLFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  echo 'Executing autogen.sh...'
  ./autogen.sh
  echo 'Finished executing autogen.sh.'

  echo 'Executing autoreconf...'
  autoreconf -vfi
  echo 'Finished executing autoreconf.'

  echo 'Executing configure...'
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sharedstatedir=/var \
    --localstatedir=/var \
    --disable-schemas-install
  echo 'Finished executing configure.'
}

pkgver() {
  cd "${pkgname}"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  # Expected pkgver format: e.g. 4.6.2.10.r2.gebcb91e08
  echo "${_gitversion}" | sed \
    -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
    -e 's;\([0-9]\+-g\);r\1;' \
    -e 's;-;.;g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  make -C "${pkgname}" DESTDIR="${pkgdir}/" install
  echo "Adjusting permissions of '/var/games/' dir to match those set by 'filesystem' package..."
  chmod -v 775 "${pkgdir}/var/games/"
  echo "Adjusting permissions of '/var/games/monkey-bubble.scores' file to make it writable by non-root game process..."
  chmod -v 666 "${pkgdir}/var/games/monkey-bubble.scores"
}
